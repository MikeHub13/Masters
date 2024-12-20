-- Design a FIFO Memory
-- Make it 8 bits deep and 9 bits wide
-- When a read signal is asserted the output of the FIFO should be enabled
-- Otherwise it should be high impedance
-- when the write signal is asserted, write to one of the 9 bit registers
-- use RdInc and WRInc as input signals to increment the pointers that indicate which register to read or write
-- use RdPtrClr and WrPtrClr as input signals which reset the pointers to point to the first register in the array
-- Do NOT implement full or empry signals


-- clk                -- Clock
-- RdPtrClr        --  Read Pointer Clear,  to reset the read pointer
-- WrPtrClr        --  Write Pointer Clear, to reset the write pointer
-- rdinc             --  Read pointer increment signal 
-- wrinc            --  Write pointer increment signal
-- DataIn          --  Data input bus
-- DataOut        --  Data Output bus
-- rden             --  read (output) enable 
-- wden            --  write (input) enable


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO8x9 is
   port(
      clk, rst:		in std_logic;
      RdPtrClr, WrPtrClr:	in std_logic;    
      RdInc, WrInc:	in std_logic;
      DataIn:	 in std_logic_vector(8 downto 0);
      DataOut: out std_logic_vector(8 downto 0);
      rden, wren: in std_logic
	);
end entity FIFO8x9;

architecture RTL of FIFO8x9 is
	--signal declarations
	type fifo_array is array(7 downto 0) of std_logic_vector(8 downto 0);  -- makes use of VHDL’s enumerated type
	signal fifo:  fifo_array;
	signal wrptr, rdptr: unsigned(2 downto 0);
	signal en: std_logic_vector(7 downto 0);
	signal dmuxout: std_logic_vector(8 downto 0);

begin


--write process
wrptr <= "000" when rising_edge(clk) and WrPtrClr = '1' -- If write pointer clear is active, reset write pointer to 0.
else
wrptr + 1 when rising_edge(clk) and WrInc = '1' -- If write increment is active, increment write pointer.
else
wrptr;

-- read process
rdptr <= "000" when rising_edge(clk) and RdPtrClr = '1' -- If read pointer clear is active, reset read pointer to 0.
else
rdptr + 1 when rising_edge(clk) and RdInc = '1' -- If read increment is active, increment read pointer.
else
rdptr;

DataOut <= dmuxout when rden = '1' -- If read enable is active, output the data pointed to by the read pointer.
else 
"ZZZZZZZZZ" when rden = '0'; -- Otherwise, output undefined state (9 bits of 'u').

fifo(to_integer(wrptr)) <= DataIn when rising_edge(clk) and wren = '1' -- Write input data to the FIFO location pointed by the write pointer if write enable is active.
else fifo(to_integer(wrptr)); -- Otherwise, retain the current data in the FIFO.

dmuxout <= fifo(to_integer(rdptr)); -- Assign the FIFO location pointed by the read pointer to the intermediate output signal.

end architecture RTL;
