`timescale 1ns/100ps
`include "../../sccomp_dataflow.v"
module test_tb;

   reg clock,mem_clk,resetn;
   reg [31:0] inst,pc,aluout,memout;
   sccomp_dataflow sc0 (clock,resetn,mem_clk,inst,pc,aluout,memout);

   initial begin
      $dumpfile("sccomp_dataflow.vcd");
      $dumpvars;
   end
   initial begin    
       clock = 1'b1;
       forever #10 clock = ~clock;
   end
   initial begin
       resetn = 1'b0;
       #5 resetn = 1'b1;
   end
   initial begin
       mem_clk = 1'b0;
       forever #5 mem_clk = ~mem_clk;
   end
endmodule