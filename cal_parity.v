module cal_parity(in, out);
    input[7:0] in;
    output out;
    wire[8:0] w;
    
    assign w[0] = 0;
    
    for(genvar i = 0; i < 8; i = i + 1) begin
        assign w[i+1] = w[i] ^in[i];
    end
    
    assign out = w[8];
    
endmodule