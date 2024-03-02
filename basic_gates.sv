//
// ECE 366, spring 2024, Project B
//
// Define basic gates used for adders 
// Created by Zhao Zhang
//
// All gates are 2-input only with a fixed delay of 100ps. Only those gates
// should be used to contruct ripple-carry, CLA, and prefix addders.  The
// gates also swap the positions of input and output, e.g., and2(c, a, b) for
// and(a, b, c).
//

// AND gate with 100ps delay
module and2(input logic a, 
	    input logic b,
	    output logic c);
    and #100ps and_gate(c, a, b);
endmodule

// OR gate with 100ps delay
module or2(input logic a, 
	   input logic b,
	   output logic c);
    or #100ps or_gate(c, a, b);
endmodule

// XOR gate with 100ps delay
module xor2(input logic a, 
	    input logic b,
	    output logic c);
    xor #100ps xor_gate(c, a, b);
endmodule

// Split "gate" with no delay
module split(input logic a,
             output logic b,
             output logic c);
    assign b = a;
    assign c = a;
endmodule


