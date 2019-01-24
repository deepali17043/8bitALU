module Or(in1, in2, out);
    input[7:0] in1, in2;
    output[7:0] out;
    
    for(genvar i = 0; i < 8; i = i + 1) begin
        assign out[i] = in1[i] | in2[i];
    end
    
endmodule