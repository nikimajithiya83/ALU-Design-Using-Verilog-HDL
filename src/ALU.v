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
  output cout,
  output c3_out
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
  
   assign c3_out = c3;
  
endmodule

module Arithmetic_unit(
  input [3:0]A,
  input [3:0]B,
  input sub,
  output [3:0]arith_result,
  output carry,
  output c3_out
);
  wire [3:0]bmodified;
  
  assign bmodified = B ^ sub;
  
  ripple_adder RA(
    .a(A),
    .b(bmodified),
    .cin(sub),
    .y(arith_result),
    .cout(carry),
    .c3_out(c3_out)
  );
  
endmodule
  
module logic_unit(
  input [3:0]A,
  input [3:0]B,
  input [1:0]logic_sel,
  output reg [3:0]logic_result
);
  
  always @(*) begin
    case(logic_sel)
      2'b00 : logic_result = A & B;
      2'b01 : logic_result = A | B;
      2'b10 : logic_result = A ^ B;
      2'b11 : logic_result = ~A;
      default : logic_result = 4'b0000;
    endcase
  end
  
endmodule

module shift_unit(
  input [3:0]A,
  input shift_sel,
  output reg [3:0]shift_result
);
  
  always @(*) begin
    case(shift_sel)
      1'b0 : shift_result = A << 1;
      1'b1 : shift_result = A >> 1;
      default : shift_result = 4'b0000;
      endcase
    end
      
 endmodule 

module ALU(
  input [3:0]A,
  input [3:0]B,
  input [2:0]opcode,
  
  output reg [3:0]result,
  
  output carry,
  output zero,
  output negative,
  output overflow
);
  
  wire [3:0]arith_out;
  wire [3:0]logic_out;
  wire [3:0]shift_out;
  reg [1:0]logic_sel;
  wire c3_out;
  
  always @(*) begin
    case(opcode)
      3'b010 : logic_sel = 2'b00;
      3'b011 : logic_sel = 2'b01;
      3'b100 : logic_sel = 2'b10;
      3'b101 : logic_sel = 2'b11;
      default : logic_sel = 2'b00;
    endcase
  end
  
  Arithmetic_unit AU (
    .A(A),
    .B(B),
    .sub(opcode[0]),
    .arith_result(arith_out),
    .carry(carry),
    .c3_out(c3_out)
  );
  
  logic_unit LU (
    .A(A),
    .B(B),
    .logic_sel(logic_sel),
    .logic_result(logic_out)
  );
  
  shift_unit SU (
    .A(A),
    .shift_sel(opcode[0]),
    .shift_result(shift_out)
  );
    
  
  always @(*) begin
    case(opcode)
      3'b000, 3'b001 : result = arith_out;
      3'b010, 3'b011, 3'b100, 3'b101 : result = logic_out;
      3'b110, 3'b111 : result = shift_out;
      default : result = 4'b0000;
    endcase
  end
  
  assign zero = ~|result;
  assign negative = result[3];
  assign overflow = c3_out ^ carry;
  
  
endmodule
