----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:29:13 09/23/2012 
-- Design Name: 
-- Module Name:    mult32 - Behavioral 
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

entity mult32 is
 port(
       X: in std_logic_vector(31 downto 0);
       Y: in std_logic_vector(31 downto 0);
       P: out std_logic_vector(63  downto 0)
       );

end mult32;

architecture Behavioral of mult32 is

begin

	P<=X*Y;

end Behavioral;