--------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
--
-- Create Date:   17:21:11 09/26/2012
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/MIPSVHDL/IMEM_tb.vhd
-- Project Name:  MIPSVHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IMEM
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
ENTITY IMEM_tb IS
END IMEM_tb;
 
ARCHITECTURE behavior OF IMEM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IMEM
    PORT(
         ADDR : IN  std_logic_vector(5 downto 0);
         DOUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ADDR : std_logic_vector(5 downto 0) := (others => '0');
 	--Outputs
   signal DOUT : std_logic_vector(31 downto 0);

BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: IMEM PORT MAP (
          ADDR => ADDR,
          DOUT => DOUT
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		wait for 100 ns;
		ADDR <= b"000000";
      
		wait for 100 ns;
		ADDR <= b"000001";
		
      wait for 100 ns;
		ADDR <= b"000010";
		
      wait for 100 ns;
		ADDR <= b"000011";

      wait for 100 ns;
		ADDR <= b"000100";
		
		wait for 100 ns;
		ADDR <= b"000101";

      wait for 100 ns;
		ADDR <= b"000110";

      wait for 100 ns;
		ADDR <= b"000111";

      wait for 100 ns;
		ADDR <= b"001000";

      wait for 100 ns;
		ADDR <= b"001001";

      wait for 100 ns;
		ADDR <= b"001010";

      wait;
   end process;

END;
