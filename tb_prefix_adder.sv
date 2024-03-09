// prefix adder testbench
// 31:0-bit prefix adder

module tb_prefix_adder_32bit();

    // Inputs
    logic [31:0] a1, b1;
    logic c_in1;
    logic [31:0] a2, b2;
    logic c_in2;
    logic [31:0] a3, b3;
    logic c_in3;
    logic [31:0] a4, b4;
    logic c_in4;
    logic [31:0] a5, b5;
    logic c_in5;
    logic [31:0] a6, b6;
    logic c_in6;
    logic [31:0] a7, b7;
    logic c_in7;
    logic [31:0] a8, b8;
    logic c_in8;

    // Outputs
    logic [31:0] s1, s2, s3, s4, s5, s6, s7, s8;
    logic c_out1, c_out2, c_out3, c_out4, c_out5, c_out6, c_out7, c_out8;

    // Instantiate your prefix adder for testing
    prefix_adder_32bit adder1 (a1, b1, c_in1, s1, c_out1);
    prefix_adder_32bit adder2 (a2, b2, c_in2, s2, c_out2);
    prefix_adder_32bit adder3 (a3, b3, c_in3, s3, c_out3);
    prefix_adder_32bit adder4 (a4, b4, c_in4, s4, c_out4);
    prefix_adder_32bit adder5 (a5, b5, c_in5, s5, c_out5);
    prefix_adder_32bit adder6 (a6, b6, c_in6, s6, c_out6);
    prefix_adder_32bit adder7 (a7, b7, c_in7, s7, c_out7);
    prefix_adder_32bit adder8 (a8, b8, c_in8, s8, c_out8);

   //Input Signals and Output Test cases
    initial begin
        // Case 1: a1 = 1, b1 = -1, no carry
        a1 = 32'd1; b1 = -32'd1; c_in1 = 0;

        // Case 2: a2 = 10, b2 = 20, no carry
        a2 = 32'd10; b2 = 32'd20; c_in2 = 0;

        // Case 3: a3 = 10, b3 = -20, no carry
        a3 = 32'd10; b3 = -32'd20; c_in3 = 0;

        // Case 4: a4 = -1, b4 = 0, carry = 1
        a4 = -32'd1; b4 = 32'd0; c_in4 = 1;

        // Additional test cases
        // Case 5: a5 = 0, b5 = 0, no carry
        a5 = 32'd0; b5 = 32'd0; c_in5 = 0;

        // Case 6: a6 = 100, b6 = 200, no carry
        a6 = 32'd100; b6 = 32'd200; c_in6 = 0;

        // Case 7: a7 = -50, b7 = 50, no carry
        a7 = -32'd50; b7 = 32'd50; c_in7 = 0;

        // Case 8: a8 = 0, b8 = 0, carry = 1
        a8 = 32'd0; b8 = 32'd0; c_in8 = 1;

        // Verify results at time 9700ps
        #9700;
        assert (s1 === 32'd0 && c_out1 == 1) else $error("Case 1 failed.");
        assert (s2 === 32'd30 && c_out2 == 0) else $error("Case 2 failed.");
        assert (s3 === -32'd10 && c_out3 == 0) else $error("Case 3 failed.");
        assert (s4 === 32'd0 && c_out4 == 1) else $error("Case 4 failed.");
        // Additional case assertions
        assert (s5 === 32'd0 && c_out5 == 0) else $error("Case 5 failed.");
        assert (s6 === 32'd300 && c_out6 == 0) else $error("Case 6 failed.");
        assert (s7 === 32'd0 && c_out7 == 0) else $error("Case 7 failed.");
        assert (s8 === 32'd0 && c_out8 == 1) else $error("Case 8 failed.");

        $display("All test cases passed!");
    end
endmodule

