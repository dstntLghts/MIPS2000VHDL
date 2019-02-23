----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:30:01 09/23/2012 
-- Design Name: 
-- Module Name:    R32 - Behavioral 
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

	entity R32 is
	Port (
  	      D_in 	: in  STD_LOGIC_VECTOR (31 downto 0);
		   D_out 	: out  STD_LOGIC_VECTOR (31 downto 0);
		   CLK 	: in  STD_LOGIC;
		   CLR 	: in  STD_LOGIC
		  );
	end R32;

	architecture Behavioral of R32 is
	begin   
			process(clk,clr,D_in)
			begin	
			if clr = '1' then 
				D_out <= (others =>'0');
			else
			if clk'event and clk='1' then
				D_out <= D_in; 
			else 
				null;
			end if;
			end if;
		end process;
	end Behavioral;
