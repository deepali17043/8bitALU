module leftshift(i1, i2, out, carry);
    input[7:0] i1, i2;
    output[7:0] out;
    output carry;
    
    wire[7:0] x;
    assign x = i1 << (i2 - 1);
    assign carry = x >> 7;
    assign out = x << 1;

endmodule