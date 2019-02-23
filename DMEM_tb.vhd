--------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
--
-- Create Date:   16:26:59 09/28/2012
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/Desktop/MIPSVHDL/DMEM_tb.vhd
-- Project Name:  MIPSVHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DMEM
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
 
ENTITY DMEM_tb IS
END DMEM_tb;
 
ARCHITECTURE behavior OF DMEM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DMEM
    PORT(
         di : IN  std_logic_vector(31 downto 0);
         a : IN  std_logic_vector(4 downto 0);
         we : IN  std_logic;
         clk : IN  std_logic;
         do : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal di : std_logic_vector(31 downto 0) := (others => '0');
   signal a : std_logic_vector(4 downto 0) := (others => '0');
   signal we : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal do : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DMEM PORT MAP (
          di => di,
          a => a,
          we => we,
          clk => clk,
          do => do
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		di <= x"A33455A0";
       a <= b"00000";
      we <= '1';
     clk <= '1';
	  
	  wait for clk_period*10;
	  
	  wait for clk_period*10;
		di <= x"A33455A0";
       a <= b"00000";
      we <= '0';
     clk <= '1';
	  
	  wait for clk_period*10;
		di <= x"ABCABCA0";
       a <= b"00001";
      we <= '1';
     clk <= '1';
	  
	  wait for clk_period*10;
	  
	  wait for clk_period*10;
		di <= x"ABCABCA0";
       a <= b"00001";
      we <= '0';
     clk <= '1';
	  
	  wait for clk_period*10;
		di <= x"A33455A0";
       a <= b"00010";
      we <= '1';
     clk <= '1';
	  
	  wait for clk_period*10;
	  
	  wait for clk_period*10;
		di <= x"A33455AB";
       a <= b"00010";
      we <= '0';
     clk <= '1';

      wait;
   end process;

END;
