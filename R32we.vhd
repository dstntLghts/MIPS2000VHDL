----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:33:26 09/23/2012 
-- Design Name: 
-- Module Name:    R32we - Behavioral 
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

	entity R32we is
		 Port ( D_in 	: in  STD_LOGIC_VECTOR (31 downto 0);
				  D_out 	: out  STD_LOGIC_VECTOR (31 downto 0);
				  CLK 	: in  STD_LOGIC;
				  CLR 	: in  STD_LOGIC;
				  WE 		: in  STD_LOGIC
				);
	end R32we;
     
	architecture Behavioral of R32we is

		begin

			--process(clk,clr,we)   
			process(clk,clr)
			begin
				if clr = '1' then 
					D_out <= (others =>'0');
					
				elsif clk'event and clk='1' then      
					if we = '1' then 
						D_out <= D_in;
					else     
						null; 
					end if;
				else
					null;  
				end if;
			end process;


	end Behavioral;