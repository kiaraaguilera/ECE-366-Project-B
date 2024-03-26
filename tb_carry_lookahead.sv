// carry lookahead adder testbench
// 31:0-bit carry lookahead
module tb_carry_lookahead_adder_32bit();
    logic[31:0] a1, b1, s1;
    logic c_in1, c_out1;
    logic[31:0] a2, b2, s2;
    logic c_in2, c_out2;
    logic[31:0] a3, b3, s3;
    logic c_in3, c_out3;
    logic[31:0] a4, b4, s4;
    logic c_in4, c_out4;
    logic[31:0] a5, b5, s5;
    logic c_in5, c_out5;
    logic[31:0] a6, b6, s6;
    logic c_in6, c_out6;
    logic[31:0] a7, b7, s7;
    logic c_in7, c_out7;
    logic[31:0] a8, b8, s8;
    logic c_in8, c_out8;
    

    // Instantiate four adders for testing
    carry_lookahead_adder_32bit adder1(a1, b1, c_in1, s1, c_out1);
    carry_lookahead_adder_32bit adder2(a2, b2, c_in2, s2, c_out2);
    carry_lookahead_adder_32bit adder3(a3, b3, c_in3, s3, c_out3);
    carry_lookahead_adder_32bit adder4(a4, b4, c_in4, s4, c_out4);

    // Instantiate four more adders for testing
    carry_lookahead_adder_32bit adder5(a5, b5, c_in5, s5, c_out5);
    carry_lookahead_adder_32bit adder6(a6, b6, c_in6, s6, c_out6);
    carry_lookahead_adder_32bit adder7(a7, b7, c_in7, s7, c_out7);
    carry_lookahead_adder_32bit adder8(a8, b8, c_in8, s8, c_out8);

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

	// Additional Test Cases

	// Test case 5: Positive integers, no carry-in
        a5 = 32'd5; b5 = 32'd5; c_in5 = 0;

        // Test case 6: Large positive integers, no carry-in
        a6 = 32'd100; b6 = 32'd200; c_in6 = 0;

        // Test case 7: Large positive and negative integers, no carry-in
        a7 = 32'd1000; b7 = -32'd500; c_in7 = 0;

        // Test case 8: Random positive integers, no carry-in
        a8 = 32'd1234; b8 = 32'd5678; c_in8 = 0;

	// Verify the results at time 9700ps
	#9700ps
	assert (s1 === 32'd0 && c_out1 == 1) else $error("Case 1 failed.");
	assert (s2 === 32'd30 && c_out2 == 0) else $error("Case 2 failed.");
	assert (s3 === -32'd10 && c_out3 == 0) else $error("Case 3 failed.");
	assert (s4 === 32'd0 && c_out4 == 1) else $error("Case 4 failed.");
	
	// Verify results for 4 other test cases
	assert (s5 === 32'd10 && c_out5 == 0) else $error("Case 5 failed.");
        assert (s6 === 32'd300 && c_out6 == 0) else $error("Case 6 failed.");
        assert (s7 === 32'd500 && c_out7 == 1) else $error("Case 7 failed.");
        assert (s8 === 32'd6912 && c_out8 == 0) else $error("Case 8 failed.");
	     
    end
endmodule