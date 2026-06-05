`timescale 1ns/1ps

module ALU_tb;
  
  reg [3:0]A;
  reg [3:0]B;
  reg [2:0]opcode;
  
  wire [3:0]result;
  wire carry;
  wire zero;
  wire negative;
  wire overflow;
  
  ALU DUT(
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .zero(zero),
    .negative(negative),
    .overflow(overflow)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,ALU_tb);
  end
  
  initial begin
    $monitor("Time=%0t | A=%b B=%b opcode=%b | result=%b carry=%b zero=%b negative=%b overflow=%b",$time, A, B, opcode, result, carry, zero, negative, overflow);
    
    //ADD
    A=4'b0101;
    B=4'b1100;
    opcode=3'b000;
    #10;
    
    //SUB
    A=4'b1101;
    B=4'b0101;
    opcode=3'b001;
    #10;
    
    //AND
    A=4'b0111;
    B=4'b1100;
    opcode=3'b010;
    #10;
    
    //OR
    A=4'b1111;
    B=4'b1100;
    opcode=3'b011;
    #10;
    
    //XOR
    A=4'b0110;
    B=4'b1100;
    opcode=3'b100;
    #10;
    
    //NOT A
    A=4'b1010;
    B=4'b1100;
    opcode=3'b101;
    #10;
    
    //SHIFT LEFT A
    A=4'b1001;
    B=4'b1100;
    opcode=3'b110;
    #10;
    
    //SHIFT RIGHT B
    A=4'b1101;
    B=4'b1100;
    opcode=3'b111;
    #10;
    
    //ZERO
    A=4'b0101;
    B=4'b0101;
    opcode=3'b001;
    #10; 
    
    //NEGATIVE
    A=4'b0010;
    B=4'b0101;
    opcode=3'b001;
    #10;
    
    //CARRY
    A=4'b1111;
    B=4'b0001;
    opcode=3'b000;
    #10;
    
    //OVERFLOW
    A=4'b0111;
    B=4'b0001;
    opcode=3'b000;
    #10;
    
    $finish;
    
  end
  
endmodule
    
