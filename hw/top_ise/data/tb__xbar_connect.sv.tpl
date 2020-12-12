// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// tb__xbar_connect generated by `topgen.py` tool
<%
from collections import OrderedDict
import topgen.lib as lib

top_hier = 'tb.dut.top_' + top["name"] + '.'
clk_hier = top_hier + top["clocks"]["hier_paths"]["top"]

clk_src = OrderedDict()
for xbar in top["xbar"]:
  for clk, src in xbar["clock_srcs"].items():
    clk_src[clk] = src

clk_freq = OrderedDict()
for clock in top["clocks"]["srcs"] + top["clocks"]["derived_srcs"]:
  if clock["name"] in clk_src.values():
    clk_freq[clock["name"]] = clock["freq"]

hosts = OrderedDict()
devices = OrderedDict()
for xbar in top["xbar"]:
  for node in xbar["nodes"]:
    if node["type"] == "host" and not node["xbar"]:
      hosts[node["name"]] = "clk_" + clk_src[node["clock"]]
    elif node["type"] == "device" and not node["xbar"]:
      devices[node["name"]] = "clk_" + clk_src[node["clock"]]
%>\
<%text>
`define DRIVE_CHIP_TL_HOST_IF(tl_name, inst_name, sig_name) \
     force ``tl_name``_tl_if.d2h = dut.top_ise.u_``inst_name``.``sig_name``_i; \
     force dut.top_ise.u_``inst_name``.``sig_name``_o = ``tl_name``_tl_if.h2d; \
     force dut.top_ise.u_``inst_name``.clk_i = 0; \
     uvm_config_db#(virtual tl_if)::set(null, $sformatf("*%0s*", `"tl_name`"), "vif", \
                                        ``tl_name``_tl_if);

`define DRIVE_CHIP_TL_DEVICE_IF(tl_name, inst_name, sig_name) \
     force ``tl_name``_tl_if.h2d = dut.top_ise.u_``inst_name``.``sig_name``_i; \
     force dut.top_ise.u_``inst_name``.``sig_name``_o = ``tl_name``_tl_if.d2h; \
     force dut.top_ise.u_``inst_name``.clk_i = 0; \
     uvm_config_db#(virtual tl_if)::set(null, $sformatf("*%0s*", `"tl_name`"), "vif", \
                                        ``tl_name``_tl_if);

`define DRIVE_CHIP_TL_EXT_DEVICE_IF(tl_name, port_name) \
     force ``tl_name``_tl_if.h2d = dut.top_ise.``port_name``_req_o; \
     force dut.top_ise.``port_name``_rsp_i = ``tl_name``_tl_if.d2h; \
     uvm_config_db#(virtual tl_if)::set(null, $sformatf("*%0s*", `"tl_name`"), "vif", \
                                        ``tl_name``_tl_if);
</%text>\

% for c in clk_freq.keys():
wire clk_${c};
clk_rst_if clk_rst_if_${c}(.clk(clk_${c}), .rst_n(rst_n));
% endfor

% for i, clk in hosts.items():
tl_if ${i}_tl_if(${clk}, rst_n);
% endfor

% for i, clk in devices.items():
tl_if ${i}_tl_if(${clk}, rst_n);
% endfor

initial begin
  bit xbar_mode;
  void'($value$plusargs("xbar_mode=%0b", xbar_mode));
  if (xbar_mode) begin
    // only enable assertions in xbar as many pins are unconnected
    $assertoff(0, tb);
% for xbar in top["xbar"]:
    $asserton(0, tb.dut.top_${top["name"]}.u_xbar_${xbar["name"]});
% endfor

% for c in clk_freq.keys():
    clk_rst_if_${c}.set_active(.drive_rst_n_val(0));
    clk_rst_if_${c}.set_freq_khz(${clk_freq[c]} / 1000);
% endfor

    // bypass clkmgr, force clocks directly
% for xbar in top["xbar"]:
  % for clk, src in xbar["clock_srcs"].items():
    force ${top_hier}u_xbar_${xbar["name"]}.${clk} = clk_${src};
  % endfor
% endfor

    // bypass rstmgr, force resets directly
% for xbar in top["xbar"]:
  % for rst in xbar["reset_connections"]:
    force ${top_hier}u_xbar_${xbar["name"]}.${rst} = rst_n;
  % endfor
% endfor

% for xbar in top["xbar"]:
  % for node in xbar["nodes"]:
<%
clk = 'clk_' + clk_src[node["clock"]]
inst_sig_list = lib.find_otherside_modules(top, xbar["name"], 'tl_' + node["name"])
inst_name = inst_sig_list[0][1]
sig_name = inst_sig_list[0][2]

%>\
    % if node["type"] == "host" and not node["xbar"]:
    `DRIVE_CHIP_TL_HOST_IF(${node["name"]}, ${inst_name}, ${sig_name})
    % elif node["type"] == "device" and not node["xbar"] and node["stub"]:
    `DRIVE_CHIP_TL_EXT_DEVICE_IF(${node["name"]}, ${inst_name}_${sig_name})
    % elif node["type"] == "device" and not node["xbar"]:
    `DRIVE_CHIP_TL_DEVICE_IF(${node["name"]}, ${inst_name}, ${sig_name})
    % endif
  % endfor
% endfor
  end
end

`undef DRIVE_CHIP_TL_HOST_IF
`undef DRIVE_CHIP_TL_DEVICE_IF
`undef DRIVE_CHIP_TL_EXT_DEVICE_IF
