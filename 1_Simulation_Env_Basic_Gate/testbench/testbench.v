`include "common_defines.vh"

module testbench;

reg in_a;
reg in_b;
wire not_gate_out;
wire and_gate_out;
wire nand_gate_out;
wire or_gate_out;
wire nor_gate_out;
wire xor_gate_out;
wire xnor_gate_out;
    
// Instantiation of the basic_gate module
basic_gate u_basic_gate (
    .in_a           (in_a         ),
    .in_b           (in_b         ),
    .not_gate_out   (not_gate_out ),
    .and_gate_out   (and_gate_out ),
    .nand_gate_out  (nand_gate_out),
    .or_gate_out    (or_gate_out  ),
    .nor_gate_out   (nor_gate_out ),
    .xor_gate_out   (xor_gate_out ),
    .xnor_gate_out  (xnor_gate_out)
);

// Initial block for the Testbench.
initial begin
    // Adjust the display format for better alignment using tab spacing
    $display("Time\tin_a\tin_b\tnot\tand\tnand\tor\tnor\txor\txnor");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, in_a, in_b, 
             not_gate_out, and_gate_out, nand_gate_out, or_gate_out, 
             nor_gate_out, xor_gate_out, xnor_gate_out);
    
    in_a = 0;
    in_b = 0;
    #20; 
    
    in_a = 1;
    in_b = 0;
    #20; 
    
    in_a = 0;
    in_b = 1;
    #20; 
    
    in_a = 1;
    in_b = 1;
    #20; 
    
    $finish;
end

endmodule