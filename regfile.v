/* 
writer:liyiming 
date: 2018/11/13
version: 0.0
module: regfile
func: 32register
*/
module regfile(
    a_addr,
    b_addr,
    write_data,
    write_addr,
    write_en,
    clk,rst,
    a_data,
    b_data
)
    input clk,rst,write_en;
    input [31:0] write_data;
    input [3:0] a_addr,b_addr,write_addr;
    output [31:0]a_data,b_data;

    //register Arry
    reg [31:0] register [0:31]

    //read data from Arry
    assign a_addr=(a_addr==0)? 0 : register[a_addr];
    assign b_addr=(b_addr==0)? 0 : register[b_addr];

    //write data into Arry
    always @(posedge clk or negedge rst) begin
        if(rst == 0)begin
            integer i;
            for(i=0;i<=31;i=i+1)register[i]<=0;
        end else if ((write_addr!=0) && write_en) begin
            register[write_addr]<=write_data;
        end        
    end
endmodule