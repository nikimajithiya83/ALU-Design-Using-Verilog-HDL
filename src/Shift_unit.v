module shift_unit(
  input [3:0]A,
  input shift_sel,
  output reg [3:0]result
);
  
  always @(*) begin
    case(shift_sel)
      1'b0 : result = A << 1;
      1'b1 : result = A >> 1;
      default : result = 1'b0;
      endcase
    end
      
 endmodule 
