--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:52:24 08/29/2013
-- Design Name:   
-- Module Name:   /home/xhaar/Desktop/MIPS2000VHDL/mux3to1_32bt_tb.vhd
-- Project Name:  MIPS2000VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX3to1x32bit
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
 
ENTITY mux3to1_32bt_tb IS
END mux3to1_32bt_tb;
 
ARCHITECTURE behavior OF mux3to1_32bt_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX3to1x32bit
    PORT(
         Inp_0 : IN  std_logic_vector(31 downto 0);
         Inp_1 : IN  std_logic_vector(31 downto 0);
         Inp_2 : IN  std_logic_vector(31 downto 0);
         Sel_1 : IN  std_logic;
         Sel_2 : IN  std_logic;
         Outp : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Inp_0 : std_logic_vector(31 downto 0) := (others => '0');
   signal Inp_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Inp_2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Sel_1 : std_logic := '0';
   signal Sel_2 : std_logic := '0';

 	--Outputs
   signal Outp : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX3to1x32bit PORT MAP (
          Inp_0 => Inp_0,
          Inp_1 => Inp_1,
          Inp_2 => Inp_2,
          Sel_1 => Sel_1,
          Sel_2 => Sel_2,
          Outp => Outp
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
