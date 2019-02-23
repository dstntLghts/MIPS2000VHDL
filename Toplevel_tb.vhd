--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:55:46 10/18/2013
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/Desktop/MIPS2000VHDL/Toplevel_tb.vhd
-- Project Name:  MIPS2000VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Toplevel
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
 
ENTITY Toplevel_tb IS
END Toplevel_tb;
 
ARCHITECTURE behavior OF Toplevel_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Toplevel
    PORT(
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         TEST_SEL : IN  std_logic_vector(1 downto 0);
         IR : OUT  std_logic_vector(31 downto 0);
         PC : OUT  std_logic_vector(31 downto 0);
         MDR_in : OUT  std_logic_vector(31 downto 0);
         MAR : OUT  std_logic_vector(31 downto 0);
         W : OUT  std_logic_vector(31 downto 0);
         ALUout : OUT  std_logic_vector(31 downto 0);
         TEST_OUT : OUT  std_logic_vector(63 downto 0);
         ZERO : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';
   signal TEST_SEL : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal IR : std_logic_vector(31 downto 0);
   signal PC : std_logic_vector(31 downto 0);
   signal MDR_in : std_logic_vector(31 downto 0);
   signal MAR : std_logic_vector(31 downto 0);
   signal W : std_logic_vector(31 downto 0);
   signal ALUout : std_logic_vector(31 downto 0);
   signal TEST_OUT : std_logic_vector(63 downto 0);
   signal ZERO : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Toplevel PORT MAP (
          RESET => RESET,
          CLK => CLK,
          TEST_SEL => TEST_SEL,
          IR => IR,
          PC => PC,
          MDR_in => MDR_in,
          MAR => MAR,
          W => W,
          ALUout => ALUout,
          TEST_OUT => TEST_OUT,
          ZERO => ZERO
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;	
     -- Reset Generation
   reset <= '1', '0' after CLK_period;
   -- Stimulus process
   stim_proc: process
   begin	
	TEST_SEL <= "10";
	wait for 100 ns;
	TEST_SEL <= "11";
	wait for 100 ns;
	TEST_SEL <= "00";
      wait;
   end process;

END;
