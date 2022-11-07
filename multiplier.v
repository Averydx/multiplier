`timescale 1ns / 1ps

module multiplier(
        input [0:5]sw,
        output [0:5]led
    );
       
    //p0
    assign led[0] = sw[0] & sw[3]; 
    
    //p1
    wire p1Wire,CP1; 
    halfadder Adder1(sw[4]&sw[0],sw[3]&sw[1],p1Wire,CP1);
    assign led[1] = p1Wire; 
    
    //p2
    wire p24Wire,CP2; 
    halfadder Adder2(sw[5] & sw[0],sw[4] & sw[1],p24Wire,CP2);
    wire p2Wire,CP21;  
    fulladder Adder4(sw[3] & sw[2],p24Wire,CP1,p2Wire,CP21); 
    assign led[2] = p2Wire; 
      
    //p3
    wire p35Wire,CP3; 
    halfadder Adder3(sw[5] & sw[1],CP2,p35Wire,CP3);
    wire p3Wire,CP31; 
    fulladder Adder5(sw[4] & sw[2],p35Wire,CP21,p3Wire,CP31);
    assign led[3] = p3Wire; 
    
    //p4 and p5 
    
    wire p4Wire,P5Wire; 
    fulladder Adder6(sw[5] & sw[2], CP3, CP31, p4Wire,p5Wire);
    assign led[4] = p4Wire; 
    assign led[5] = p5Wire; 
endmodule
