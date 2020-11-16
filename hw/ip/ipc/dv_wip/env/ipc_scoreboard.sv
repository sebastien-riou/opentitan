// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
class ipc_scoreboard extends cip_base_scoreboard #(.CFG_T (ipc_env_cfg),
                                                    .RAL_T (ipc_reg_block),
                                                    .COV_T (ipc_env_cov));


  `uvm_component_utils(ipc_scoreboard)

  `uvm_component_new

  // Function: build_phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  // Task: run_phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask

  // Task : process_tl_access
  // process monitored tl transaction
  virtual task process_tl_access(tl_seq_item item, tl_channels_e channel = DataChannel);
    uvm_reg csr;
    bit do_read_check       = 1'b1;
    bit write               = item.is_write();
    uvm_reg_addr_t csr_addr = ral.align_to_word_addr(item.a_addr);

    // if access was to a valid csr, get the csr handle
    if (csr_addr inside {cfg.csr_addrs}) begin
      csr = ral.default_map.get_reg_by_offset(csr_addr);
      `DV_CHECK_NE_FATAL(csr, null)
    end else begin
      `uvm_fatal(`gfn, $sformatf("Access unexpected addr 0x%0h", csr_addr))
    end

    // grab completed transactions from data channel; ignore packets from address channel
    if (channel == AddrChannel) begin
      // Clock period in nano seconds (timeunit)
      real clk_period = cfg.clk_rst_vif.clk_period_ps / 1000;
      time crnt_time = $time;

      // apply pending update for interrupt state
      if (data_in_update_queue.size() > 0) begin
        if (data_in_update_queue[$].needs_update == 1'b1 &&
            (int'((crnt_time - data_in_update_queue[$].eval_time) / clk_period)) > 1) begin
          void'(ral.data_in.predict(.value(data_in_update_queue[$].reg_value),
                                    .kind(UVM_PREDICT_READ)));
        end else if(data_in_update_queue[$ - 1].needs_update == 1'b1) begin
          // Use previous updated value for "data_in" prediction
          void'(ral.data_in.predict(.value(data_in_update_queue[$ - 1].reg_value),
                                    .kind(UVM_PREDICT_READ)));
        end
      end

      // apply pending update for interrupt state
      if (intr_state_update_queue.size() > 0) begin
        // As register read takes single clock cycle to latch the updated value, immediate
        // read on same or next clock will not give latest updated value. So, look for time stamp
        // of latest update to decide which value to predict for "intr_state" mirrored value
        if (intr_state_update_queue[$].needs_update == 1'b1 &&
            (int'((crnt_time - intr_state_update_queue[$].eval_time) / clk_period)) > 1) begin
          void'(ral.intr_state.predict(.value(intr_state_update_queue[$].reg_value),
                                       .kind(UVM_PREDICT_READ)));
        end else if(intr_state_update_queue[$ - 1].needs_update == 1'b1) begin
          // Use previous updated value for "intr_state" prediction
          void'(ral.intr_state.predict(.value(intr_state_update_queue[$ - 1].reg_value),
                                       .kind(UVM_PREDICT_READ)));
        end
      end

      // if incoming access is a write to a valid csr, then make updates right away
      if (write) begin
        if (csr.get_name() == "intr_state") begin
          // As per rtl definition of W1C, hardware must get a chance to make update
          // to interrupt state first, so we need to clear interrupt only after possible
          // interrupt update due to ipc change
          #0;
          `uvm_info(`gfn, $sformatf("Write on intr_state: write data = %0h", item.a_data), UVM_HIGH)
          if (intr_state_update_queue.size() > 0) begin
            ipc_reg_update_due_t intr_state_write_to_clear_update = intr_state_update_queue[$];
            `uvm_info(`gfn, $sformatf("Entry taken out for clearing is %0p",
                                      intr_state_write_to_clear_update), UVM_HIGH)
            // Update time
            intr_state_write_to_clear_update.eval_time = $time;
            for (uint each_bit = 0; each_bit < TL_DW; each_bit++) begin
              if (intr_state_write_to_clear_update.needs_update == 1'b1 &&
                  intr_state_write_to_clear_update.reg_value[each_bit] == 1'b1 &&
                  item.a_data[each_bit] == 1'b1) begin
                intr_state_write_to_clear_update.reg_value[each_bit] = 1'b0;
                cleared_intr_bits[each_bit] = 1'b1;
                // Coverage Sampling: ipc interrupt cleared
                if (cfg.en_cov) begin
                  cov.intr_state_cov_obj[each_bit].sample(1'b0);
                end
              end
            end
            // If same time stamp as last entry, update entry to account for "still active" event
            // that caused last interrupt update (As per definition of w1c in comportability
            // specification)
            if (intr_state_write_to_clear_update.eval_time == intr_state_update_queue[$].eval_time)
                begin
              // Re-apply interrupt update
              intr_state_write_to_clear_update.reg_value |= last_intr_update_except_clearing;
              // Delete last entry with same time stamp
              intr_state_update_queue.delete(intr_state_update_queue.size()-1);


            end
            // Push new interrupt state update entry into queue
            intr_state_update_queue.push_back(intr_state_write_to_clear_update);
            if (intr_state_update_queue.size() > 2) begin
              // Delete extra unenecessary entry
              intr_state_update_queue.delete(0);
            end
          end
        end else begin
          if (csr.get_name() == "intr_test") begin
            // Store the written value as it is WO register
            last_intr_test_event = item.a_data;
          end else begin
            // Coverage Sampling: coverage on *out* and *oe* register values
            if (cfg.en_cov && (!uvm_re_match("*out*", csr.get_name()) ||
                               !uvm_re_match("*oe*", csr.get_name()))) begin
              for (uint each_pin = 0; each_pin < NUM_ipcS; each_pin++) begin
                cov.out_oe_cov_objs[each_pin][csr.get_name()].sample(item.a_data[each_pin]);
              end
              // Coverage Sampling: Cross coverage on mask and data within masked_* registers
              if (!uvm_re_match("masked*", csr.get_name())) begin
                bit [(NUM_ipcS/2) - 1:0] mask, data;
                {mask, data} = item.a_data;
                for (uint each_pin = 0; each_pin < NUM_ipcS/2; each_pin++) begin
                  cov.out_oe_mask_data_cov_objs[each_pin][csr.get_name()].var1_var2_cg.sample(
                      mask[each_pin], data[each_pin]);
                end
              end
            end
            // these fields are WO, save values in scb
            if (csr.get_name() == "masked_out_lower") begin
              masked_out_lower_mask = get_field_val(ral.masked_out_lower.mask, item.a_data);
            end else if (csr.get_name() == "masked_out_upper") begin
              masked_out_upper_mask = get_field_val(ral.masked_out_upper.mask, item.a_data);
            end
            void'(csr.predict(.value(item.a_data), .kind(UVM_PREDICT_WRITE), .be(item.a_mask)));
          end
        end
        `uvm_info(`gfn, "Calling ipc_predict_and_compare on reg write", UVM_HIGH)
        ipc_predict_and_compare(csr);
      end // if (write)
    end else begin // if (channel == DataChannel)
      if (write == 0) begin
        `uvm_info(`gfn, $sformatf("csr read on %0s", csr.get_name()), UVM_HIGH)
        // If do_read_check, is set, then check mirrored_value against item.d_data
        if (do_read_check) begin
          // Checker-2: Check if reg read data matches expected value or not
          `DV_CHECK_EQ(csr.get_mirrored_value(), item.d_data)
          // Checker-3: Check value of interrupt pins against predicted value
          if (csr.get_name() == "intr_state") begin
            bit [TL_DW-1:0] intr_state = (intr_state_update_queue.size() > 0) ?
                                         intr_state_update_queue[$].reg_value :
                                         csr.get_mirrored_value();
            bit [TL_DW-1:0] pred_val_intr_pins = intr_state &
                                                 ral.intr_enable.get_mirrored_value();
            // according to issue #841, interrupt is a flop and the value will be updated after one
            // clock cycle. Because the `pred_val_intr_pins` might be updated during the one clk
            // cycle, we store the predicted intr val into a temp automatic variable.
            fork
              begin
                automatic bit [TL_DW-1:0] pred_val_intr_pins_temp = pred_val_intr_pins;
                cfg.clk_rst_vif.wait_clks(1);
                if (!cfg.under_reset) `DV_CHECK_EQ(cfg.intr_vif.pins, pred_val_intr_pins_temp)
              end
            join_none
          end
        end
      end // if (write == 0)
    end
  endtask : process_tl_access


  // Function: reset
  virtual function void reset(string kind = "HARD");
    super.reset(kind);
    ral.reset(kind);
    // Reset scoreboard variables
    data_out = '0;
    data_oe  = '0;
    intr_state_update_queue = {};
    data_in_update_queue = {};
    last_intr_update_except_clearing = '0;
    last_intr_test_event = '0;
    cleared_intr_bits = '0;
  endfunction

  // Function: check_phase
  function void check_phase(uvm_phase phase);
    super.check_phase(phase);
  endfunction

endclass : ipc_scoreboard
