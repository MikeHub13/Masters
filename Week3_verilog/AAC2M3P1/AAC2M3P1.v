////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//               Application Assignment Problem 1 Module 3 Course 2           //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
//
// 
// @file AAC2M3P4.v
// @brief Application Assignment 2-007 2-bit comparator
// @version: 1.0 
// Date of current revision:  @date 2019-06-21  
// Target FPGA: [Intel Altera MAX10] 
// Tools used: [Quartus Prime 16.1 or Sigasi] for editing and/or synthesis 
//             [Modeltech ModelSIM 10.4a Student Edition] for simulation 
//             [Quartus Prime 16.1]  for place and route if applied
//             
//  Functional Description:  This file contains the Verilog which describes the 
//             FPGA implementation of a 2-bit comparator circuit. 
//             The inputs are 2-bit vectors A and B 
//             The output is a scalar Equals that is a 1 iff A and B are equal
//
//  Hierarchy:  There is only one level in this simple design.
//        
//  Designed by:  @author [your name] 
//                [Organization]
//                [email] 
//
//      Copyright (c) 2019 by Tim Scherr
//
// Redistribution, modification or use of this software in source or binary
// forms is permitted as long as the files maintain this copyright. Users are
// permitted to modify this and use it to learn about the field of HDl code.
// Tim Scherr and the University of Colorado are not liable for any misuse
// of this material.
//////////////////////////////////////////////////////////////////////////////
// 
  	                                            		
module Comparator2(
   input[1:0] A, B,
   output reg Equals
);      		
                   	          	
// student code here
always @ ( A , B ) 

begin 

Equals = (~( A[1]^B[1]))&(~(A[0]^B[0])); 

// A[1] ^ B[1]: This performs a bitwise XOR operation between the most significant bit (MSB) of A and B. The result is 1 if the bits are different and 0 if they are the same.
// ~(A[1] ^ B[1]): This negates the XOR result, so it becomes 1 if A[1] and B[1] are the same and 0 if they are different.
// Similarly, ~(A[0] ^ B[0]) checks if the least significant bit (LSB) of A and B are the same.
// The & operator performs a bitwise AND between the two negated XOR results. The result will be 1 if both bits are equal (both MSB and LSB), and 0 otherwise.
// This assigns the result of the comparison (1 for equality and 0 for inequality) to the output Equals.

end 

endmodule // Comparator2 




    