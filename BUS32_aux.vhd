----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C.TZERANIS
-- 
-- Create Date:    18:17:04 09/23/2012 
-- Design Name: 
-- Module Name:    BUS32_aux - Behavioral 
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

entity BUS32_aux is
       Port ( 
	          BIN   : in   STD_LOGIC_VECTOR (31 downto 0);
			    BOUT  : out  STD_LOGIC_VECTOR (31 downto 0)
				 );
end BUS32_aux;

architecture Structural of BUS32_aux is

begin

   BOUT(31 downto 0) <= BIN(31 downto 0);
	
end Structural;

