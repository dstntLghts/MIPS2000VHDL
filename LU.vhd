----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:28:11 09/23/2012 
-- Design Name: 
-- Module Name:    LU - Behavioral 
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

entity LU is 
     Port ( INa: in std_logic_vector(31 downto 0);
	         INb: in std_logic_vector(31 downto 0);
				OUTa: out std_logic_vector(31 downto 0);
				sel: in std_logic_vector(1 downto 0)
			  ); 
end LU;

architecture structural of LU is

begin
       process (INa,INb,sel)
		   begin
		  			case sel is
				                     when "00" => OUTa <= INa AND INb; 
				                     when "01" => OUTa <= INa OR INb;
				                     when "10" => OUTa <= INa XOR INb;
				                     when "11" => OUTa <= INa NOR INb;
				                     when others => OUTa <= x"00000000";
					 end case;
         end process;
end structural;

