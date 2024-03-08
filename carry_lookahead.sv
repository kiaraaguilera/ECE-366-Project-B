// 4-bit carry lookahead adder
module carry_lookahead_adder_4bit(input logic[3:0] a,
                               input logic[3:0] b,
                               input logic c_in,
                               output logic[3:0] s,
                               output logic c_out);

    // Internal signals for generate (G) and propagate (P) signals
  logic[3:0] g, p;

  // Continuous assignments for G and P signals using basic gates
  and2 and_g0(a[0], b[0], g[0]);
  or2 or_p0(a[0], b[0], p[0]);

  and2 and_g1(s[0], b[1], g[1]);
  or2 or_p1(s[0], b[1], p[1]);

  and2 and_g2(s[1], b[2], g[2]);
  or2 or_p2(s[1], b[2], p[2]);

  and2 and_g3(s[2], b[3], g[3]);
  or2 or_p3(s[2], b[3], p[3]);
	
// Calculate sum and carry using basic gates
  xor2 xor_s0(g[0], p[0], s[0]);
  and2 and_c0(g[0], p[0], c_out);

  xor2 xor_s1(g[1], p[1], s[1]);
  and2 and_c1(g[1], p[1], g[0]);

  xor2 xor_s2(g[2], p[2], s[2]);
  and2 and_c2(g[2], p[2], g[1]);

  xor2 xor_s3(g[3], p[3], s[3]);
  and2 and_c3(g[3], p[3], g[2]);

    // instantiate four 1-bit full adders, connect their c_out and c_in
    full_adder_1bit adder0(a[0], b[0], c_in, s[0], c[0]);
    full_adder_1bit adder1(a[1], b[1], c[0], s[1], c[1]);
    full_adder_1bit adder2(a[2], b[2], c[1], s[2], c[2]);
    full_adder_1bit adder3(a[3], b[3], c[2], s[3], c_out);
endmodule

// 32-bit carry lookahead adder
module carry_lookahead_adder_32bit(input logic[31:0] a,
                                input logic[31:0] b,
                                input logic c_in,
                                output logic[31:0] s,
                                output logic c_out);

     // Continuous assignments for G and P signals using basic gates
  and2 and_g[30:0](
    a[0:29], b[0:29], g[0:29]
  );

  or2 or_p[31:0](
    a[0:30], b[0:30], p[0:30]
  );

  // Calculate sum and carry using basic gates
  xor2 xor_s[30:0](
    g[0:29], p[0:29], s[0:29]
  );

  and2 and_cin(c_in, p[0], g[0]);

  and2 and_c[29:0](
    g[0:28], p[0:28], g[1:29]
  );

  // Instantiate eight 4-bit carry-lookahead adders
  carry_lookahead_adder_4bit adder0(a[3:0], b[3:0], c_in, s[3:0], g[0]);
  carry_lookahead_adder_4bit adder1(a[7:4], b[7:4], g[0], s[7:4], g[1]);
  carry_lookahead_adder_4bit adder2(a[11:8], b[11:8], g[1], s[11:8], g[2]);
  carry_lookahead_adder_4bit adder3(a[15:12], b[15:12], g[2], s[15:12], g[3]);
  carry_lookahead_adder_4bit adder4(a[19:16], b[19:16], g[3], s[19:16], g[4]);
  carry_lookahead_adder_4bit adder5(a[23:20], b[23:20], g[4], s[23:20], g[5]);
  carry_lookahead_adder_4bit adder6(a[27:24], b[27:24], g[5], s[27:24], g[6]);
  carry_lookahead_adder_4bit adder7(a[31:28], b[31:28], g[6], s[31:28], g[7]);

  // Final stage to compute c_out using XOR and AND gates
  xor2 xor_cin(g[7], p[8], c_out);
endmodule
