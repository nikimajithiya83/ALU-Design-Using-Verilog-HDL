`timescale 1ns/1ps

module shift_unit_tb;

    reg [3:0] A;
    reg shift_sel;

    wire [3:0] result;

    shift_unit DUT (
        .A(A),
        .shift_sel(shift_sel),
        .result(result)
    );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,shift_unit_tb);
  end

    initial begin

        $monitor("Time=%0t | A=%b shift_sel=%b | result=%b",
                 $time, A, shift_sel, result);

        // Left Shift Tests

        A = 4'b0001;
        shift_sel = 1'b0;
        #10;

        A = 4'b1010;
        shift_sel = 1'b0;
        #10;

        A = 4'b1111;
        shift_sel = 1'b0;
        #10;

        A = 4'b1000;
        shift_sel = 1'b0;
        #10;

        // Right Shift Tests

        A = 4'b0001;
        shift_sel = 1'b1;
        #10;

        A = 4'b1010;
        shift_sel = 1'b1;
        #10;

        A = 4'b1111;
        shift_sel = 1'b1;
        #10;

        A = 4'b1000;
        shift_sel = 1'b1;
        #10;

        $finish;

    end

endmodule
