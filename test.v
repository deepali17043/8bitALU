`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2018 18:25:15
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test;
    reg [3:0] op;
    reg [7:0] A, B;
    wire [7:0] out;
    wire Z, C, P, S;
    alu a( .A(A), .B(B), .D(op), .out(out), .flagz(Z), .flagp(P), .flagc(C), .flags(S));
    initial begin
        $monitor("op = %d, A = %d, B = %d, out = %d, Z = %d, C = %d, P = %d, S = %d", op, A, B, out, Z, C, P, S);
        #10
        op = 4'b0000;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b0001;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b0010;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b0011;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b0100;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b0101;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b0110;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b0111;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b1000;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b1001;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b1010;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b1011;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b1100;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b1101;
        A = 8'b11111010;
        B = 8'b01100011;
        #10 
        op = 4'b1110;
        A = 8'b11111010;
        B = 8'b01100011; 
        #10 
        op = 4'b1111;
        A = 8'b11111010;
        B = 8'b01100011; 
    end
endmodule
