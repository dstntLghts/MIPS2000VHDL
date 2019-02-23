----------------------------------------------------------------------------------
-- Company: UOA 
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:48:43 09/23/2012 
-- Design Name: 
-- Module Name:    MUX3to1x32bit - Behavioral 
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

	entity MUX3to1x32bit is
		 Port ( Inp_0 : in  STD_LOGIC_VECTOR (31 downto 0);
				  Inp_1 : in  STD_LOGIC_VECTOR (31 downto 0);
				  Inp_2 : in  STD_LOGIC_VECTOR (31 downto 0);
				  Sel_1 : in  STD_LOGIC;
				  Sel_2 : in  STD_LOGIC;
				  Outp : out  STD_LOGIC_VECTOR (31 downto 0));
	end MUX3to1x32bit;

	architecture Behavioral of MUX3to1x32bit is
	
	signal Inp_0orInp_1 : std_logic_vector (31 downto 0);		   
	
	begin
		Inp_0orInp_1 <= Inp_1 when Sel_1='1' else Inp_0;
		Outp <= Inp_2 When Sel_2 = '1' else Inp_0orInp_1;
		
	
end Behavioral;