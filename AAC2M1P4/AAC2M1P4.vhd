--------------------------------------------------------------------------------
--                                                                            --
--               Application Assignment 4 Module 1 Course 2                   --
--                                                                            --
--------------------------------------------------------------------------------
--
-- @file AAC2M1P4solved.vhd
-- @brief Application Assignment 2-001 Majority Vote Code 
-- @version: 1.0 
-- Date of current revision:  @date [2018-08-13]  
-- Target FPGA: [Intel Altera MAX10] 
-- Tools used: [Quartus Prime 16.1] for editing and synthesis 
--             [Modeltech ModelSIM 10.4a Student Edition] for simulation 
--             [Quartus Prime 16.1]  for place and route if applied
--             
--  Functional Description:  This file contains the VHDL which describes the 
--               FPGA implementation of a Majority Vote Circuit. The inputs are  
--               signals A, B, C with one output Y that is true only if at  
--               least 2 of the inputs are true.
 
--  Hierarchy:  There is only one level in this simple design.
--  
--  Designed for: Coursera 
--                
--  Designed by:  @author Tim Scherr
--                University of Colorado
-- 
--      Copyright (c) 2018 by Tim Scherr
--
-- Redistribution, modification or use of this software in source or binary
-- forms is permitted as long as the files maintain this copyright. Users are
-- permitted to modify this and use it to learn about the field of HDl code.
-- Tim Scherr and the University of Colorado are not liable for any misuse
-- of this material.
------------------------------------------------------------------------------
-- 

library ieee;
use ieee.std_logic_1164.all;

entity Majority is
    port (
        A, B, C: in std_logic;
        Y: out std_logic
    );
end Majority;

architecture Behavioral of Majority is
begin
    process (A, B, C)
    variable count: integer := 0; -- Variable to count the number of '1's
    begin
        -- Initialize count to 0
        count := 0;
        
        -- Count the number of '1's in inputs A, B, and C
        if A = '1' then
            count := count + 1;
        end if;
        
        if B = '1' then
            count := count + 1;
        end if;
        
        if C = '1' then
            count := count + 1;
        end if;
        
        -- If 2 or more inputs are '1', output '1'; else output '0'
        if count >= 2 then
            Y <= '1';
        else
            Y <= '0';
        end if;
    end process;
end Behavioral;

