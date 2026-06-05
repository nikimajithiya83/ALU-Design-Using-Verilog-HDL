`timescale 1ns/1ps

module logic_unit_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] logic_sel;

    wire [3:0] result;

    logic_unit DUT (
        .A(A),
        .B(B),
        .logic_sel(logic_sel),
        .result(result)
    );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,logic_unit_tb);
  end

    initial begin

        $monitor("Time=%0t | A=%b B=%b logic_sel=%b | result=%b",
                 $time, A, B, logic_sel, result);

        // AND Operation
        A = 4'b1010;
        B = 4'b1100;
        logic_sel = 2'b00;
        #10;

        // OR Operation
        A = 4'b1010;
        B = 4'b1100;
        logic_sel = 2'b01;
        #10;

        // XOR Operation
        A = 4'b1010;
        B = 4'b1100;
        logic_sel = 2'b10;
        #10;

        // NOT Operation
        A = 4'b1010;
        B = 4'b1100;
        logic_sel = 2'b11;
        #10;

        // Additional Test Cases

        // AND
        A = 4'b1111;
        B = 4'b0101;
        logic_sel = 2'b00;
        #10;

        // OR
        A = 4'b0011;
        B = 4'b1100;
        logic_sel = 2'b01;
        #10;

        // XOR
        A = 4'b1111;
        B = 4'b1111;
        logic_sel = 2'b10;
        #10;

        // NOT
        A = 4'b0000;
        B = 4'b1010;
        logic_sel = 2'b11;
        #10;

        $finish;

    end

endmodule
