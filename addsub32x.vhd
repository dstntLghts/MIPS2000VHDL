----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:14:19 09/23/2012 
-- Design Name: 
-- Module Name:    addsub32x - Behavioral 
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

entity addsub32x is
  Port ( IN0 : in std_logic_vector(31 downto 0);
         IN1 : in std_logic_vector(31 downto 0);
			S0   : out std_logic_vector(31 downto 0);
			sub0 : in std_logic);
end addsub32x;

architecture structural of addsub32x is

begin
        process (IN0,IN1,sub0)
		    begin 
	           case sub0 is 
                           when '0' => S0 <= IN0 + IN1 ;	 
                           when '1' => S0 <= IN0 - IN1 ;
                           when others	=> S0 <= x"00000000";
					end case;
          end process;					
  
end structural;

