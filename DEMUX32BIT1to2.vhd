----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:21:22 09/23/2012 
-- Design Name: 
-- Module Name:    DEMUX32BIT1to2 - Behavioral 
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

	entity DEMUX32BIT1to2 is
		 Port  ( 
		        Dem_Inp   : in  std_logic_vector (31 downto 0);
				  Dem_Outp1 : out  std_logic_vector (31 downto 0);
				  Dem_Outp2 : out  std_logic_vector (31 downto 0);
				  Dem_Sel   : in  std_logic
				  );
	end DEMUX32BIT1to2;

	architecture Behavioral of DEMUX32BIT1to2 is

	begin
		process (Dem_Inp,Dem_Sel)
		begin
			case Dem_Sel is 
				when '0' => Dem_Outp1 <= Dem_Inp; Dem_Outp2 <= x"00000000";
				when '1' => Dem_Outp2 <= Dem_Inp; Dem_Outp1 <= x"00000000";
				when others => 
									Dem_Outp1 <= x"00000000";
									Dem_Outp2 <= x"00000000";
		end case;
	end process;
	end Behavioral;