`timescale 1ns/1ps

module Arithmetic_unit_tb;

    reg  [3:0] a;
    reg  [3:0] b;
    reg        sub;

    wire [3:0] result;
    wire       carry;

    Arithmetic_unit DUT (
        .a(a),
        .b(b),
        .sub(sub),
        .result(result),
        .carry(carry)
    );
  
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,Arithmetic_unit_tb);
end
    
    initial begin

        $monitor("Time=%0t | a=%b b=%b sub=%b | result=%b carry=%b",
                 $time, a, b, sub, result, carry);

        // 0 + 0
        a = 4'b0000;
        b = 4'b0000;
        sub = 1'b0;
        #10;

        // 5 + 3 = 8
        a = 4'b0101;
        b = 4'b0011;
        sub = 1'b0;
        #10;

        // 15 + 1 = 16
        a = 4'b1111;
        b = 4'b0001;
        sub = 1'b0;
        #10;

        // 15 + 15 = 30
        a = 4'b1111;
        b = 4'b1111;
        sub = 1'b0;
        #10;

        // 5 - 3 = 2
        a = 4'b0101;
        b = 4'b0011;
        sub = 1'b1;
        #10;

        // 7 - 2 = 5
        a = 4'b0111;
        b = 4'b0010;
        sub = 1'b1;
        #10;

        // 8 - 8 = 0
        a = 4'b1000;
        b = 4'b1000;
        sub = 1'b1;
        #10;

        // 2 - 5 = -3 (Two's Complement)
        a = 4'b0010;
        b = 4'b0101;
        sub = 1'b1;
        #10;

        $finish;

    end

endmodule
