// GPO with 1 cycle read/write delay, 32 bit words

module gpo (
    input               clk_i,
    input               rst_ni,

    input               req_i,
    input               we_i,
    input        [ 3:0] be_i,//ignored, support only 32 bit accesses
    input        [31:0] addr_i,
    input        [31:0] wdata_i,
    output logic        rvalid_o,
    output logic [31:0] rdata_o,
    output logic        err_o,
    output logic [31:0] state
);
always_ff @(posedge clk_i, negedge rst_ni) begin
    if (!rst_ni) begin
        rvalid_o <= 1'b0;
        err_o <= 1'b0;
    end else begin
        rvalid_o <= req_i;
        if(req_i) err_o <= be_i!=4'hF;
    end
end

always_ff @(posedge clk_i) begin
    if (req_i) begin
        if (we_i) begin
            state <= wdata_i;
        end else begin
            rdata_o <= state;
        end
    end
end

endmodule
