module alu(A, B, D, out, flagz, flagp, flagc, flags);
    input[3:0] D;
    input[7:0] A, B;
    output[7:0] out;
    output flagz, flagp, flags;
    inout flagc;
    reg[7:0] O;
    reg Z, P, S;
    reg C;
    
    wire[7:0] neg_b;
    negation n1(
        .in(B), .out(neg_b)
    );
    
    wire[7:0] neg_a;
    negation n2(
        .in(A), .out(neg_a)
    );
    
    wire[7:0] a_inc;
    add e1(
        .i1(A), .i2(1), .sum(a_inc), .carry()
    ); 
    
    wire[7:0] a_dec;
    subtract s1(
        .in1(A), .in2(1), .out(a_dec), .carry()
    );
    
    wire[7:0] a_shifted; 
    wire c7;
    leftshift l(
        .i1(A), .i2(B), .out(a_shifted), .carry(c7)
    );
    
    wire[7:0] aplusb;
    wire c8;
    add e2(
        .i1(A), .i2(B), .sum(aplusb), .carry(c8)
    );
      
    wire[7:0] aminusb;
    wire c9;
    subtract s2(
        .in1(A), .in2(B), .out(aminusb), .carry(c9)
    );
    
    wire[7:0] aplusbc;
    wire c10;

    addc aplusbplusc(
    	.inp1(A), .inp2(B), .inp3(flagc), .sum(aplusbc), .carry(c10)
    );
    
    wire[7:0] aminusbc;
    wire c11;

    subc aminusbminusc (
    	.inp1(A), .inp2(B), .inp3(flagc), .diff(aminusbc), .carry(c11)
    );
    
    wire[7:0] aandb;
    And a(
        .in1(A), .in2(B), .out(aandb)
    );
    
    wire[7:0] aorb;
    Or o(
        .in1(A), .in2(B), .out(aorb)
    );
    
    wire[7:0] axorb;
    Xor x(
        .in1(A), .in2(B), .out(axorb)
    );
    
    wire[7:0] axnorb;
    negation lambda (
        .in(axorb), .out(axnorb)
    );
    
    always @(D == 0)
    begin 
        assign O = 0;
        assign Z = 0;
        assign C = 0;
        assign P = 0;
        assign S = 0;
    end
    always @(D == 1)
    begin
        assign O = B;
        assign Z = 0;
        assign C = 0;
        assign P = 0;
        assign S = 0;
    end
    always @(D == 2)
    begin
        assign O = neg_b;
        assign Z = 0;
        assign C = 0;
        assign P = 0;
        assign S = 0;        
    end
    always @(D == 3)
    begin
        assign O = A;
        assign Z = 0;
        assign C = 0;
        assign P = 0;
        assign S = 0;        
    end
    always @(D == 4)
    begin 
        assign O = neg_a;
        assign Z = 0;
        assign C = 0;
        assign P = 0;
        assign S = 0;        
    end
    always @(D == 5)
    begin
        assign O = a_inc;
        assign Z = 0;
        assign C = 0;
        assign P = 0;
        assign S = 0;        
    end
    always @(D == 6)
    begin
        assign O = a_dec;
        assign Z = 0;
        assign C = 0;
        assign P = 0;
        assign S = 0;        
    end
    always @(D == 7)
    begin
        assign O = a_shifted;
        assign Z = 0;
        assign C = c7;
        assign P = 0;
        assign S = 0;        
    end
    always @(D == 8)
    begin
        assign O = aplusb;
        assign C = c8;
    end
    always @(D == 9)
    begin
        assign O = aminusb;
        assign C = c9;
    end
    always @(D == 10)
    begin
        assign O = aplusbc;
        assign C = c10;        
    end
    always @(D == 11)
    begin
        assign O = aminusbc;
        assign C = c11;
    end
    always @(D == 12)
    begin
        assign O = aandb;
    end
    always @(D == 13)
    begin
        assign O = aorb;       
    end
    always @(D == 14)
    begin 
        assign O = axorb;       
    end
    always @(D == 15)
    begin
        assign O = axnorb;
    end
    always @(O == 0)begin  
        Z <= 1; 
    end
    always @(O) begin
        Z <= 0;
    end
    wire parity;
    cal_parity c1(
        .in(O), .out(parity)
    );
    always @(*) begin
        S <= O[7];
        P <= parity;
    end
    assign out = O;
    assign flagz = Z;
    assign flagc = C;
    assign flagp = P;
    assign flags = S;
endmodule