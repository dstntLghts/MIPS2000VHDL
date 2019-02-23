----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:49:18 09/27/2013 
-- Design Name: 
-- Module Name:    atpg_counter - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity atpg_counter is
                       port( clock : in std_logic;
	                          reset : in std_logic;
									    add : out std_logic_vector (6 downto 0)
                            );										 
end atpg_counter;

architecture Behavioral of atpg_counter is

signal count_int : std_logic_vector(6 downto 0);
begin 
 process (reset, clock)
  begin
		if reset = '1' then
		      count_int <= "0000000";
		elsif clock'event and clock = '1' then
		     if count_int = "1010111" then
			   count_int <= "0000000";
				else
				count_int <= count_int + "1";
		     end if;
		end if;
  end process;
  add <= count_int;
end Behavioral;