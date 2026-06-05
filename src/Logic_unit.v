module logic_unit(
  input [3:0]A,
  input [3:0]B,
  input [1:0]logic_sel,
  output reg [3:0]result
);
  
  always @(*) begin
    case(logic_sel)
      2'b00 : result = A & B;
      2'b01 : result = A | B;
      2'b10 : result = A ^ B;
      2'b11 : result = ~A;
      default : result = 4'b0000;
    endcase
  end
  
endmodule
  
