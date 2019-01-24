module subc(inp1, inp2, inp3, diff, carry);
	input[7:0] inp1, inp2;
	input inp3;
	output[7:0] sum;
	output carry;
	wire[7:0] w;

	subtract s3(
        .in1(inp1), .in2(inp2), .out(w), .carry()
    );
    subtract s4(
        .in1(w), .in2(inp3), .out(diff), .carry(c11)
    );
endmodule