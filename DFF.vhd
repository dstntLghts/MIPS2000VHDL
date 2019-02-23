----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:21:59 09/23/2012 
-- Design Name: 
-- Module Name:    DFF - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

	entity DFF is
		 Port ( Inp : in  STD_LOGIC;
			     CLK : in  STD_LOGIC;
				  Outp : out  STD_LOGIC
				 );
	end DFF;

	architecture Behavioral of DFF is
	begin
		process( Inp, CLK )
		begin 
			if (CLK = '1' and clk'event) then 
				Outp <= Inp;
			end if ;	
	    end process;
		 
end Behavioral;
