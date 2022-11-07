`timescale 1ns / 1ps


module fulladder(
    input A,
    input B,
    input Cin,
    output sum,
    output Cout
    );
    
    wire h1Cout,h1Sum,h2Cout;
    
    halfadder h1(A,B,h1Sum,h1Cout);
    halfadder h2(h1Sum,Cin,sum,h2Cout); 
    assign Cout = h2Cout | h1Cout; 
    
    
endmodule