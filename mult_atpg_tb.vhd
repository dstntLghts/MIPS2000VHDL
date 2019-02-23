--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:13:32 09/27/2013
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/Desktop/MIPS2000VHDL/mult_atpg_tb.vhd
-- Project Name:  MIPS2000VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mult_atpg
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
 
ENTITY mult_atpg_tb IS
END mult_atpg_tb;
 
ARCHITECTURE behavior OF mult_atpg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mult_atpg
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         Out_ATPG : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal Out_ATPG : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mult_atpg PORT MAP (
          clock => clock,
          reset => reset,
          Out_ATPG => Out_ATPG
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      reset <= '1';
      wait for clock_period*10;
      reset <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
