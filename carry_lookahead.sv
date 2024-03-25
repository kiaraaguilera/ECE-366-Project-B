// 4-bit carry lookahead adder
module carry_lookahead_adder_4bit(input logic[3:0] a,
                               input logic[3:0] b,
                               input logic c_in,
                               output logic[3:0] s,
                               output logic c_out);

    // Internal signals for generate (g) and propagate (p) signals
   logic[3:0] g, p;
   logic[2:0] c;
   logic o1, o2, o3, o4, o5, o6, o7, go, po // Outputs, generate output, propagate output


    // instantiate four 1-bit full adders, connect their c_out and c_in
    full_adder_1bit adder0(a[0], b[0], c_in, s[0], c[0]);
    full_adder_1bit adder1(a[1], b[1], c[0], s[1], c[1]);
    full_adder_1bit adder2(a[2], b[2], c[1], s[2], c[2]);
    full_adder_1bit adder3(a[3], b[3], c[2], s[3], c_out);


 // Continuous assignments for G and P signals using basic gates
  and2 and_g0(a[0], b[0], g[0]);
  or2 or_p0(a[0], b[0], p[0]);

  and2 and_g1(a[1], b[1], g[1]);
  or2 or_p1(a[1], b[1], p[1]);

  and2 and_g2(a[2], b[2], g[2]);
  or2 or_p2(a[2], b[2], p[2]);

  and2 and_g3(a[3], b[3], g[3]);
  or2 or_p3(a[3], b[3], p[3]);
	
// Logic for generate output

  and2 o1(g[0], p[1], o1);
  or2 o2(o1, g[1], o2);
  and2 o3(o2, p[2], o3);
  or2 o4(o3, g[2], o4);
  and2 o5(o4, p[3], o5);
  or2 go(o5, g[3], go);

// Logic for propagate output

  and2 o6(p[0], p[1], o6);
  and2 o7(o6, p[2], o7);
  and2 po(o7, p[3], po);

// Cout output
  and2 and_cout(po, c_in, and_cout);
  or2 or_cout(and_cout, go, c_out);

endmodule

// 32-bit carry-lookahead adder
module carry_lookahead_adder_32bit(
    input logic[31:0] a,
    input logic[31:0] b,
    input logic c_in,
    output logic[31:0] s,
    output logic c_out
);
     // Instantiate eight 4-bit carry-lookahead adders
    carry_lookahead_adder_4bit adder0(a[3:0], b[3:0], c_in, s[3:0], g[0], p[0]);
    carry_lookahead_adder_4bit adder1(a[7:4], b[7:4], g[0], s[7:4], g[1], p[1]);
    carry_lookahead_adder_4bit adder2(a[11:8], b[11:8], g[1], s[11:8], g[2], p[2]);
    carry_lookahead_adder_4bit adder3(a[15:12], b[15:12], g[2], s[15:12], g[3], p[3]);
    carry_lookahead_adder_4bit adder4(a[19:16], b[19:16], g[3], s[19:16], g[4], p[4]);
    carry_lookahead_adder_4bit adder5(a[23:20], b[23:20], g[4], s[23:20], g[5], p[5]);
    carry_lookahead_adder_4bit adder6(a[27:24], b[27:24], g[5], s[27:24], g[6], p[6]);
    carry_lookahead_adder_4bit adder7(a[31:28], b[31:28], g[6], s[31:28], c_out, p[7]);

    // Final generate and propagate signals
    and2 and_g(p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], g[0]);
    or2 or_p(p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8]);
endmodule
