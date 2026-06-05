module full_adder(
  input a,
  input b,
  input cin,
  output y,
  output cout);
  
  assign y=(a^b)^cin;
  assign cout=(a&b) | (cin&(a^b));
  
endmodule

module ripple_adder(
  input [3:0]a,
  input [3:0]b,
  input cin,
  output [3:0]y,
  output cout
);
  wire c1,c2,c3;
  
  full_adder FA1 (
    .a(a[0]),
    .b(b[0]),
    .cin(cin),
    .y(y[0]),
    .cout(c1)
  );
  
   full_adder FA2 (
     .a(a[1]),
     .b(b[1]),
     .cin(c1),
     .y(y[1]),
     .cout(c2)
  );
  
   full_adder FA3 (
     .a(a[2]),
     .b(b[2]),
     .cin(c2),
     .y(y[2]),
     .cout(c3)
     
  );
  
   full_adder FA4 (
     .a(a[3]),
     .b(b[3]),
     .cin(c3),
     .y(y[3]),
     .cout(cout)
  );
endmodule

module Arithmetic_unit(
  input [3:0]a,
  input [3:0]b,
  input sub,
  output [3:0]result,
  output carry
);
  wire [3:0]bmodified;
  
  assign bmodified = b ^ sub;
  
  ripple_adder RA(
    .a(a),
    .b(bmodified),
    .cin(sub),
    .y(result),
    .cout(carry)
  );
  
endmodule
  
  
