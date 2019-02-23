----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:26 10/06/2012 
-- Design Name: 
-- Module Name:    mux_5to1_32x - Behavioral 
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

entity mux_5to1_32x is
		 Port ( In0   : in  std_logic_vector (31 downto 0);
				  In1   : in  std_logic_vector (31 downto 0);
				  In2   : in  std_logic_vector (31 downto 0);
				  In3   : in  std_logic_vector (31 downto 0);
				  In4   : in  std_logic_vector (31 downto 0);
				  Sel01 : in  std_logic_vector (1  downto 0);
				  Sel2  : in  std_logic;
				  Outp : out  std_logic_vector (31 downto 0));
	end mux_5to1_32x;

	architecture Behavioral of mux_5to1_32x is	
	begin
			
		process (In0,In1,In2,In3,In4,Sel01,Sel2)
		begin
			case Sel2 is 
				when '1' => Outp <= In2;
				when '0' =>
					case Sel01 is 
						when "00" => Outp <= In0;
						when "01" => Outp <= In1;
						when "10" => Outp <= In3;
						when "11" => Outp <= In4;
						when others => Outp <=x"00000000";
					end case;
				when others => Outp <=x"00000000";
			end case;
		end process;
	end Behavioral;
