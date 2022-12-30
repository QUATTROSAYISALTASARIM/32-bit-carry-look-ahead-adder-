`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2022 17:53:47
// Design Name: 
// Module Name: otuzikibit_carry
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module otuzikibit_carry(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output cout,
    output [31:0] sum
    );
    wire [7:0] c;
     
    dortbit_carry cla1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c1));
    dortbit_carry cla2 (.a(a[7:4]), .b(b[7:4]), .cin(c1), .sum(sum[7:4]), .cout(c2));
    dortbit_carry cla3(.a(a[11:8]), .b(b[11:8]), .cin(c2), .sum(sum[11:8]), .cout(c3));
    dortbit_carry cla4(.a(a[15:12]), .b(b[15:12]), .cin(c3), .sum(sum[15:12]), .cout(c4));
    dortbit_carry cla5(.a(a[19:16]), .b(b[19:16]), .cin(c4), .sum(sum[19:16]), .cout(c5));
    dortbit_carry cla6(.a(a[23:20]), .b(b[23:20]), .cin(c5), .sum(sum[23:20]), .cout(c6));
    dortbit_carry cla7(.a(a[27:24]), .b(b[27:24]), .cin(c6), .sum(sum[27:24]), .cout(c7));
    dortbit_carry cla8(.a(a[31:28]), .b(b[31:28]), .cin(c6), .sum(sum[31:28]), .cout(cout));
        
    
endmodule

module dortbit_carry(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output cout,
    output [3:0] sum
    );
     wire [3:0] p,g,c;    
           
           assign p= a^b;      
          
           assign g=a&b;          
          
     assign c[0]=cin;
     assign c[1]= g[0]|(p[0]&c[0]);
     assign c[2]= g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
     assign c[3]= g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
     assign c[4]= g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&c[0];
     assign c[5]= g[4] | (p[4]&g[3]) | p[3]&p[2]&g[4] | p[3]&p[2]&p[1]&g[4]| p[4]&p[3]&p[2]&p[1]&p[0] | p[4]&p[3]&p[2]&p[1]&p[0]&c[0];
     assign c[6]= g[5] | (p[5]&p[4]) | p[5]&p[4]&g[3] | p[5]&p[4]&p[3]&g[2] | p[5]&p[4]&p[3]&p[2]&g[1]| p[5]&p[4]&p[3]&p[2]&p[1]&p[0] | p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&c[0];
     assign c[7]= g[6] | (p[6]&p[5]) | p[6]&p[5]&p[4]| p[6]&p[5]&p[4]&g[3] | p[6]&p[5]&p[4]&p[3]&g[2] | p[6]&p[5]&p[4]&p[3]&p[2]&g[1]| p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&p[0] | p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&c[0];
     assign c[8]= g[7] | (p[7]&p[6]  | p[7]&p[6]&p[5]) | p[7]&p[6]&p[5]&p[4]| p[7]&p[6]&p[5]&p[4]&g[3] | p[7]&p[6]&p[5]&p[4]&p[3]&g[2] | p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&g[1]| p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&p[0] | p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&c[0];     
          assign sum= p^c;
endmodule
