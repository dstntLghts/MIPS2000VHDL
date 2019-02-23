----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:23:54 09/23/2012 
-- Design Name: 
-- Module Name:    EXT_sz - Behavioral 
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

	entity EXT_sz is
		port (	
				IR 	: in STD_LOGIC_VECTOR ( 15 downto 0);
				SorZ	: in std_logic;
				I		: out std_logic_vector ( 31 downto 0 )
				);
	end EXT_sz;
	architecture Behavioral of EXT_sz is
	
	constant signNEG 	: std_logic_vector ( 15 downto 0 ) := (others => '1');
	constant signPOS 	: std_logic_vector ( 15 downto 0 ) := (others => '0');
	
	begin	
		process ( IR,SorZ )
		begin 
			
			if SorZ = '1' then 
				if IR(15) = '1' then 
					I <= signNEG & IR ;
				elsif IR(15) = '0' then
					I <= signPOS & IR ;
				else 
					null;
				end if;
			elsif SorZ = '0' then 
				I <= signPOS & IR ;
			else
				null;
			end if ;
		end process;
end Behavioral;