----------------------------------------------------------------------------------
-- Company: UOA 
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:27:40 09/23/2012 
-- Design Name: 
-- Module Name:    INC - Behavioral 
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

entity INC is
 port( PC    : in  std_logic_vector (31 downto 0);
   NPC   : out  std_logic_vector (31 downto 0));
end INC;

architecture Behavioral of INC is

begin
NPC <= PC + 4;
end Behavioral;