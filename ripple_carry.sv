// 4-bit ripple-carry adder
module ripple_carry_adder_4bit(input logic[3:0] a,
                               input logic[3:0] b,
                               input logic c_in,
                               output logic[3:0] s,
                               output logic c_out);
    logic[2:0] c;

    // instantiate four 1-bit full adders, connect their c_out and c_in
    full_adder_1bit adder0(a[0], b[0], c_in, s[0], c[0]);
    full_adder_1bit adder1(a[1], b[1], c[0], s[1], c[1]);
    full_adder_1bit adder2(a[2], b[2], c[1], s[2], c[2]);
    full_adder_1bit adder3(a[3], b[3], c[2], s[3], c_out);
endmodule

// 32-bit ripple-carry adder
module ripple_carry_adder_32bit(input logic[31:0] a,
                                input logic[31:0] b,
                                input logic c_in,
                                output logic[31:0] s,
                                output logic c_out);
    logic[6:0] c;

    // instantiate eight 4-bit adders, connect them in ripple-carry manner
    ripple_carry_adder_4bit adder0(a[3:0], b[3:0], c_in, s[3:0], c[0]);
    ripple_carry_adder_4bit adder1(a[7:4], b[7:4], c[0], s[7:4], c[1]);
    ripple_carry_adder_4bit adder2(a[11:8], b[11:8], c[1], s[11:8], c[2]);
    ripple_carry_adder_4bit adder3(a[15:12], b[15:12], c[2], s[15:12], c[3]);
    ripple_carry_adder_4bit adder4(a[19:16], b[19:16], c[3], s[19:16], c[4]);
    ripple_carry_adder_4bit adder5(a[23:20], b[23:20], c[4], s[23:20], c[5]);
    ripple_carry_adder_4bit adder6(a[27:24], b[27:24], c[5], s[27:24], c[6]);
    ripple_carry_adder_4bit adder7(a[31:28], b[31:28], c[6], s[31:28], c_out);
endmodule

