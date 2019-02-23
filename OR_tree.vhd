----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:46:52 09/23/2012 
-- Design Name: 
-- Module Name:    OR_tree
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

entity OR_tree is
port(  
       ORin	  : in std_logic_vector (31 downto 0); 
		 ORout  : out std_logic
	  );
	  end entity OR_tree;


	architecture structural of OR_tree is

	Begin
	process ( ORin )
	begin
		case ORin is
			when x"00000000" => ORout <= '1';
			when others => ORout <= '0';
		end case;
	end process;

	end structural;

                 

