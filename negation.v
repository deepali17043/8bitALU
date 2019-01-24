module negation(in, out);
    input[7:0] in;
    output[7:0] out;
    
    for(genvar i = 0; i < 8; i = i + 1) begin
        assign out[i] = !in[i];
    end
    
endmodule