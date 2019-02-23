----------------------------------------------------------------------------------
-- Company: UOA 
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:13:08 09/23/2012 
-- Design Name: 
-- Module Name:    ADD32bit - Behavioral 
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
use IEEE.std_logic_unsigned.all;


	entity ADD32bit is
		 Port ( 
		        Input_A : in  STD_LOGIC_VECTOR (31 downto 0);
				  Input_B : in  STD_LOGIC_VECTOR (31 downto 0);
				  Output : out  STD_LOGIC_VECTOR (31 downto 0)
				 );
	end ADD32bit;

architecture Behavioral of ADD32bit is
	begin
	    Output <= Input_A + Input_B;
end Behavioral;
