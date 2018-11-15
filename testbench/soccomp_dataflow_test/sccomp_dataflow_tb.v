`timescale 1ns/100ps
`include "../../sccomp_dataflow.v"
`include "../../clu.v"
`include "../../dff32.v"
`include "../../mux2x32.v"
`include "../../cla32.v"
`include "../../mux2x5.v"
`include "../../alu.v"
`include "../../regfile.v"
`include "../../shifter.v"
`include "../../mux4x32.v"
`include "../../scinstmem.v"
`include "../../scdatamem.v" 
`include "../../sccpu_dataflow.v"

module test_tb;
   reg clock,mem_clk,resetn;
   wire [31:0] inst,pc,aluout,memout;
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
   initial begin
       #2000 $finish;
   end
endmodule