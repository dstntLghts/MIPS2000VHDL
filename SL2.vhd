----------------------------------------------------------------------------------
-- Company: UOA 
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:41:42 09/23/2012 
-- Design Name: 
-- Module Name:    SL2 - Behavioral 
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

entity SL2 is
    Port ( I : in  STD_LOGIC_VECTOR (31 downto 0);
           M : out  STD_LOGIC_VECTOR (31 downto 0)
			 );
end SL2;

architecture Structural of SL2 is

begin

      M(31 downto 0) <= I(29 downto 0) & "00";

end Structural;

