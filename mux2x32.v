/* 
writer:liyiming 
date: 2018/11/13
version: 0.0
module: mux
func: 32位2选1多路器
*/
module mux2x32(
    a0,
    a1,
    s,
    y
);
    input [31:0]a0,a1;
    input s;
    output [31:0]y;
    function [31:0] select;
            input [31:0]a0,a1;
            input s;
            case (s)
                1'b0: select = a0;
                1'b1: select = a1;
            endcase
    endfunction
    assign y = select(a0,a1,s);
endmodule