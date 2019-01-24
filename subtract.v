module subtract(in1, in2, out, carry);
    input[7:0] in1, in2;
    output[7:0] out;
    output carry;
    
    wire[7:0] w1, w2;
    negation n(
        .in(in2), .out(w1)
    );
    
    add e0 (
        .i1(w1), .i2(1), .sum(w2), .carry()
    );
    
    add e1 (
        .i1(in1), .i2(w2), .sum(out), .carry(carry)
    );
    
endmodule