----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:16:01 09/23/2012 
-- Design Name: 
-- Module Name:    AND2bit - Behavioral 
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

entity AND2bit is
		 Port ( Inp_A : in  STD_LOGIC;
				  Inp_B : in  STD_LOGIC;
				  Outp : out  STD_LOGIC);
end AND2bit;

architecture Behavioral of AND2bit is

begin
	
 Outp <= Inp_A and Inp_B;

end Behavioral;