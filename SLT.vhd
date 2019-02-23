----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:42:44 09/23/2012 
-- Design Name: 
-- Module Name:    SLT - Behavioral 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

	entity SLT is
		 Port ( 
					Ne 	: in  STD_LOGIC ;
					O : out  STD_LOGIC_vector (31 downto 0)
				);
	end SLT;

	architecture Behavioral of SLT is

		constant C : std_logic_vector(30 downto 0) := (others => '0');

			begin

			O <= C & Ne;

	end Behavioral;
