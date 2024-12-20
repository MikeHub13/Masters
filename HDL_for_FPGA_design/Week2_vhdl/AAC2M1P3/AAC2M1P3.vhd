--------------------------------------------------------------------------------
--                                                                            --
--               Application Assignment 3 Module 1 Course 2                   --
--                                                                            --
--------------------------------------------------------------------------------
--
-- [Replace [items in brackets] with your content]
-- @file AAC2M1P3.vhd
-- @brief Application Assignment 2-001 Example code with errors to be found
-- @version: 1.0 
-- Date of current revision:  @date YYYY-MM-DD  
-- Target FPGA: [Intel Altera MAX10] 
-- Tools used: [Quartus Prime 16.1] for editing and synthesis 
--             [Modeltech ModelSIM 10.4a Student Edition] for simulation 
--             [Quartus Prime 16.1]  for place and route if applied
--             
--  Functional Description:  This file contains the VHDL which describes the 
--               FPGA implementation of a 4-bit mux. The inputs are a, 4-bit 
--               vector, and a fixed 4-bit number, with c as the select and b
--               as the output. The output is of type std_logic_vector, which
--               means a conversion function is required.  
--  Hierarchy:  There is only one level in this simple design.
--  
--  Designed for: [Customer] 
--                [Address]
--                [City, ST ZIP]
--                [www.customer, phone number]
--  Designed by:  @michael maxwell 
--                MS EE work
--                Mikemax13@gmail.com
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

library ieee;                                -- line 1
use ieee.std_logic_1164.all;                 -- line 2

entity find_errors is                       -- line 4
    port (                                    -- line 5
        a: in bit_vector(0 to 3);      -- line 6 (input a as std_logic_vector)
	a_out: inout std_logic_vector(3 downto 0);
        b: out std_logic_vector(3 downto 0); -- line 7 (output b as std_logic_vector)
        c: in bit_vector(5 downto 0);   -- line 8 (input c as std_logic_vector)
	c_out: inout std_logic_vector (5 downto 0));                                        -- line 9
end find_errors;                             -- line 10

architecture good of find_errors is         -- line 11
begin                                         -- line 12
	a_out <= to_stdlogicvector(a);
	c_out <= to_stdlogicvector(c);
	
  my_label: process (c_out)                   -- line 13 (added sensitivity list)
  begin                                       -- line 14
    if c_out = "111111" then                     -- line 15 (compared to std_logic_vector "111111")
      b <= a_out;                                -- line 16
    else                                      -- line 17
      b <= "0101";                           -- line 18
    end if;                                  -- line 19
  end process;                               -- line 20
end good;                                    -- line 21