--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:06:40 09/24/2012
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/MIPSVHDL/DEMUX32BIT1TO2_tb.vhd
-- Project Name:  MIPSVHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DEMUX32BIT1to2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DEMUX32BIT1TO2_tb IS
END DEMUX32BIT1TO2_tb;
 
ARCHITECTURE behavior OF DEMUX32BIT1TO2_tb IS  
    COMPONENT DEMUX32BIT1to2
    PORT(
         Dem_Inp : IN  std_logic_vector(31 downto 0);
         Dem_Outp1 : OUT  std_logic_vector(31 downto 0);
         Dem_Outp2 : OUT  std_logic_vector(31 downto 0);
         Dem_Sel : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Dem_Inp : std_logic_vector(31 downto 0) := (others => '0');
   signal Dem_Sel : std_logic := '0';

 	--Outputs
   signal Dem_Outp1 : std_logic_vector(31 downto 0);
   signal Dem_Outp2 : std_logic_vector(31 downto 0);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DEMUX32BIT1to2 PORT MAP (
          Dem_Inp => Dem_Inp,
          Dem_Outp1 => Dem_Outp1,
          Dem_Outp2 => Dem_Outp2,
          Dem_Sel => Dem_Sel
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 100 ns;
      Dem_Inp <="11111111111111111111111111111111";
      Dem_Sel <='0';
		
		wait for 100 ns;
      Dem_Inp <="11111111111111111111111111111111";
      Dem_Sel <='1';
      wait;
   end process;

END;
