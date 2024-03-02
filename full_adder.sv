// ripple-carry adder, 4-bit
module full_adder_1bit(input logic a,
                       input logic b,
		       input logic c_in,
                       output logic s,
	               output logic c_out);
    logic t1, t2, t3, t4, t5;

    // circuit for sum bit
    xor2 g1(a, b, t1);
    xor2 g2(t1, c_in, s);

    // circuit for c_out
    and2 g3(a, b, t2);
    and2 g4(a, c_in, t3);
    and2 g5(b, c_in, t4);
    or2  g6(t2, t3, t5);
    or2  g7(t4, t5, c_out);
endmodule

