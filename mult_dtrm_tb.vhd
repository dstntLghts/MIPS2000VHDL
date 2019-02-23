--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:26:05 09/11/2013
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/Desktop/MIPS2000VHDL/mult_dtrm_tb.vhd
-- Project Name:  MIPS2000VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mult_dtrm
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
 
ENTITY mult_dtrm_tb IS
END mult_dtrm_tb;
 
ARCHITECTURE behavior OF mult_dtrm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mult_dtrm
    PORT(
         clock_top : IN  std_logic;
         clear_top : IN  std_logic;
         count_top : IN  std_logic;
         sel_top : IN  std_logic;
         X_top : IN  std_logic_vector(31 downto 0);
         Y_top : IN  std_logic_vector(31 downto 0);
         P_top : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock_top : std_logic := '0';
   signal clear_top : std_logic := '0';
   signal count_top : std_logic := '0';
   signal sel_top : std_logic := '0';
   signal X_top : std_logic_vector(31 downto 0) := (others => '0');
   signal Y_top : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal P_top : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clock_top_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mult_dtrm PORT MAP (
          clock_top => clock_top,
          clear_top => clear_top,
          count_top => count_top,
          sel_top => sel_top,
          X_top => X_top,
          Y_top => Y_top,
          P_top => P_top
        );

   -- Clock process definitions
   clock_top_process :process
   begin
		clock_top <= '0';
		wait for clock_top_period/2;
		clock_top <= '1';
		wait for clock_top_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      wait for clock_top_period*10;
      clear_top <= '1';
		wait for clock_top_period*10;
		sel_top   <= '1';
		clear_top <= '0';
      count_top <= '1';
      -- insert stimulus here 

      wait;
   end process;
-- mux sto 1--
END;
