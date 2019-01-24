module fulladder(a, b, c, s, cout);
  input a, b, c;
  output s, cout;
  wire s, cout;
  wire c_int1, c_int2, s_int; //intermediate sum and carry
  
  halfadder first (
    .x(a), .y(b), .sum(s_int), .carry(c_int1) );
  
  halfadder second (
    .x(c), .y(s_int), .sum(s), .carry(c_int2) );

  assign cout = c_int1 | c_int2;
endmodule