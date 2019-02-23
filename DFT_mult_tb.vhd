--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:31:25 10/12/2013
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/Desktop/MIPS2000VHDL/DFT_mult_tb.vhd
-- Project Name:  MIPS2000VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DFT_Mult
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
 
ENTITY DFT_mult_tb IS
END DFT_mult_tb;
 
ARCHITECTURE behavior OF DFT_mult_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DFT_Mult
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         sel : IN  std_logic_vector(1 downto 0);
         X_top : IN  std_logic_vector(31 downto 0);
         Y_top : IN  std_logic_vector(31 downto 0);
         stall : OUT  std_logic;
         PorF : OUT  std_logic_vector(63 downto 0);
         P_top : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal sel : std_logic_vector(1 downto 0) := (others => '0');
   signal X_top : std_logic_vector(31 downto 0) := (others => '0');
   signal Y_top : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal stall : std_logic;
   signal PorF : std_logic_vector(63 downto 0);
   signal P_top : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DFT_Mult PORT MAP (
          clk => clk,
          reset => reset,
          sel => sel,
          X_top => X_top,
          Y_top => Y_top,
          stall => stall,
          PorF => PorF,
          P_top => P_top
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
     wait for 100 ns;	
		    reset <= '1';
          sel   <= "00";
          X_top <= x"00000000";
          Y_top <= x"00000000";
      wait for clk_period*2;		 
          reset <= '0';
          sel   <= "00";
          X_top <= x"000000AA";
          Y_top <= x"000000B0";
      wait for clk_period*10;	
          reset <= '1';
          sel   <= "00";
          X_top <= x"00000000";
          Y_top <= x"00000000";
      wait for clk_period*2;		
-----------********LFSR********---------------
          reset <= '0';
          sel   <= "01";
          X_top <= x"00000000";
          Y_top <= x"00000000";
		   --SEED IS CONSTANT--	 		
		wait for clk_period*64 ;	
          reset <= '1';
          sel   <= "00";
		    X_top <= x"00000000";
		    Y_top <= x"00000000";
      wait for clk_period*2; -- extract results
 -----------*******DTRM********---------------- 
			 reset <= '0';
          sel   <= "10";
          X_top <= x"00000000";
          Y_top <= x"00000000";
		wait for clk_period*256;
		    reset <= '1';
          sel   <= "00";
		    X_top <= x"00000000";
		    Y_top <= x"00000000";
      wait for clk_period*2; -- extract results
------------********ATPG********----------------
          reset <= '0';
          sel   <= "11";
          X_top <= x"00000000";
          Y_top <= x"00000000";
		 wait for clk_period*90;
          reset <= '1';
          sel   <= "00";
		    X_top <= x"00000000";
		    Y_top <= x"00000000";
      wait for clk_period*2; -- extract results		 
        wait;
   end process;
END;
