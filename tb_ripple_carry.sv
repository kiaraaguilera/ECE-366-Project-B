// ripple-carry adder testbench
// 31:0-bit ripple-carry adder
module tb_ripple_carry_adder_32bit();
    logic[31:0] a1, b1, s1;
    logic c_in1, c_out1;
    logic[31:0] a2, b2, s2;
    logic c_in2, c_out2;
    logic[31:0] a3, b3, s3;
    logic c_in3, c_out3;
    logic[31:0] a4, b4, s4;
    logic c_in4, c_out4;

    // Instantiate four adders for testing
    ripple_carry_adder_32bit adder1(a1, b1, c_in1, s1, c_out1);
    ripple_carry_adder_32bit adder2(a2, b2, c_in2, s2, c_out2);
    ripple_carry_adder_32bit adder3(a3, b3, c_in3, s3, c_out3);
    ripple_carry_adder_32bit adder4(a4, b4, c_in4, s4, c_out4);

    // Input signals and output testing
    initial begin
	// a1 = 1, b1 = -1, no carry
        a1 = 32'd1; b1 = -32'd1; c_in1 = 0;

	// a2 = 10, b2 = 20, no carry
        a2 = 32'd10; b2 = 32'd20; c_in2 = 0;

	// a2 = 10, b2 = -20, no carry
        a3 = 32'd10; b3 = -32'd20; c_in3 = 0;

	// a1 = -1, b1 = 0, carry = 1
        a4 = -32'd1; b4 = 32'd0; c_in4 = 1;

	// Verify the results at time 9700ps
	#9700ps
	assert (s1 === 32'd0 && c_out1 == 1) else $error("Case 1 failed.");
	assert (s2 === 32'd30 && c_out2 == 0) else $error("Case 2 failed.");
	assert (s3 === -32'd10 && c_out3 == 0) else $error("Case 3 failed.");
	assert (s4 === 32'd0 && c_out4 == 1) else $error("Case 4 failed.");
    end
endmodule

