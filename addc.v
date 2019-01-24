module addc(inp1, inp2, inp3, sum, carry);
	input[7:0] inp1, inp2;
	input inp3;
	output[7:0] sum;
	output carry;
	wire[7:0] w;
	add a3(
        .i1(inp1), .i2(inp2), .sum(w), .carry()
    );
    add a4(
        .i1(w), .i2(inp3), .sum(sum), .carry(carry)
    );
endmodule