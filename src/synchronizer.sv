// 2-FF synchronizer for the 8-bit switch input bus.
// Prevents metastability from asynchronous switch changes.
module synchronizer #(
    parameter int WIDTH = 8
) (
    input  logic             clk,
    input  logic             rst_n,
    input  logic [WIDTH-1:0] async_in,
    output logic [WIDTH-1:0] sync_out
);

    logic [WIDTH-1:0] stage1;

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            stage1   <= '0;
            sync_out <= '0;
        end else begin
            stage1   <= async_in;
            sync_out <= stage1;
        end
    end

endmodule
