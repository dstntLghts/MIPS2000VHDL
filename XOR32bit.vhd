----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:43:28 09/23/2012 
-- Design Name: 
-- Module Name:    XOR32bit - Behavioral 
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

	entity XOR32bit is
		 Port ( Inp_A : in  std_logic;
				  Inp_B : in  std_logic;
				  Outp : out  std_logic);
	end XOR32bit;

	architecture Behavioral of XOR32bit is
	signal A: std_logic;
	signal B: std_logic;
	begin
		A <= Inp_A;
		B <= Inp_B;
		Outp <= A xor B;

	end Behavioral;
