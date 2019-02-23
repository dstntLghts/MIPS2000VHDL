----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:12:59 09/24/2013 
-- Design Name: 
-- Module Name:    mux_4to1_x64 - Behavioral 
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

	entity mux_4to1_x64 is
		 Port ( In0 : in  STD_LOGIC_VECTOR (63 downto 0);
				  In1 : in  STD_LOGIC_VECTOR (63 downto 0);
				  In2 : in  STD_LOGIC_VECTOR (63 downto 0);
				  In3 : in  STD_LOGIC_VECTOR (63 downto 0);
				  Sel : in  STD_LOGIC_VECTOR (1 downto 0);
				  Outp : out  STD_LOGIC_VECTOR (63 downto 0)
				  );
	end mux_4to1_x64;

	architecture structural of mux_4to1_x64 is
   begin
	 process (Sel,In0,In1,In2,In3)
    begin
    case sel is 
    when "00" => Outp <= In0;
    when "01" => Outp <= In1;
    when "10" => Outp <= In2;
    when others => Outp <= In3;
    end case;
   end process;
 end structural;