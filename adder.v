module add(i1, i2, sum, carry);
    input[7:0] i1, i2;
    output[7:0] sum;
    output carry;
    
    wire c_int0;
    halfadder ha (
        .x(i1[0]), .y(i2[0]), .sum(sum[0]), .carry(c_int0)
    );
    
    wire c_int1;
    fulladder fa1 (
        .a(i1[1]), .b(i2[1]), .c(c_int0), .s(sum[1]), .cout(c_int1)
    );
    
    wire c_int2;
    fulladder fa2 (
        .a(i1[2]), .b(i2[2]), .c(c_int1), .s(sum[2]), .cout(c_int2)
    );

    wire c_int3;
    fulladder fa3 (
        .a(i1[3]), .b(i2[3]), .c(c_int2), .s(sum[3]), .cout(c_int3)
    );
    
    wire c_int4;
    fulladder fa4 (
        .a(i1[4]), .b(i2[4]), .c(c_int3), .s(sum[4]), .cout(c_int4)
    );

    wire c_int5;
    fulladder fa5 (
        .a(i1[5]), .b(i2[5]), .c(c_int4), .s(sum[5]), .cout(c_int5)
    );
    
    wire c_int6;
    fulladder fa6 (
        .a(i1[6]), .b(i2[6]), .c(c_int5), .s(sum[6]), .cout(c_int6)
    );

    fulladder fa7 (
        .a(i1[7]), .b(i2[7]), .c(c_int6), .s(sum[7]), .cout(carry)
    );

endmodule