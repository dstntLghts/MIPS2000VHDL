----------------------------------------------------------------------------------
-- Company: UOA 
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:46:13 09/23/2012 
-- Design Name: 
-- Module Name:    mux_2to1_32x - Behavioral 
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
use IEEE.std_logic_1164.all;


 entity mux_2to1_32x is
      port(IN0    : in  std_logic_vector (31 downto 0);
           IN1    : in  std_logic_vector (31 downto 0);
           S0     : in  std_logic;
           O      : out std_logic_vector (31 downto 0));
  end entity mux_2to1_32x;


architecture structural of mux_2to1_32x is
	begin
   process(IN0, IN1, S0)
   begin
   if(S0 = '0') then
       O <= IN0;
   elsif (S0 = '1') then      
       O <= IN1;
	else
   NULL;	
   end if;
   end process;
end structural;
