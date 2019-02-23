--------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
--
-- Create Date:   20:47:31 09/24/2012
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/MIPSVHDL/addsub32x_tb.vhd
-- Project Name:  MIPSVHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: addsub32x
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY addsub32x_tb IS
END addsub32x_tb;
 
ARCHITECTURE behavior OF addsub32x_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT addsub32x
    PORT(
         IN0 : IN  std_logic_vector(31 downto 0);
         IN1 : IN  std_logic_vector(31 downto 0);
         S0 : OUT  std_logic_vector(31 downto 0);
         sub0 : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IN0 : std_logic_vector(31 downto 0) := (others => '0');
   signal IN1 : std_logic_vector(31 downto 0) := (others => '0');
   signal sub0 : std_logic := '0';

 	--Outputs
   signal S0 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addsub32x PORT MAP (
          IN0 => IN0,
          IN1 => IN1,
          S0 => S0,
          sub0 => sub0
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for 100 ns;		
      IN0 <= "00000000000000010101010101010101";
		IN1 <= "00000000000000010101010101010101";
		sub0 <= '0'; -- ADD
		
		wait for 100 ns;		
      IN0 <= "00000000000000010101010101010101";
		IN1 <= "00000000000000010101010101010101";
		sub0 <= '1'; --SUB
		
      wait;
   end process;

END;
