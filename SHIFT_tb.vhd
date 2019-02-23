--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:59:53 10/12/2013
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/Desktop/MIPS2000VHDL/SHIFT_tb.vhd
-- Project Name:  MIPS2000VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SHIFT
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
 
ENTITY SHIFT_tb IS
END SHIFT_tb;
 
ARCHITECTURE behavior OF SHIFT_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SHIFT
    PORT(
         INa : IN  std_logic_vector(31 downto 0);
         INb : IN  std_logic_vector(31 downto 0);
         sft : IN  std_logic_vector(4 downto 0);
         R_L : IN  std_logic_vector(1 downto 0);
         sv : IN  std_logic;
         lui : IN  std_logic;
         OUTa : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal INa : std_logic_vector(31 downto 0) := (others => '0');
   signal INb : std_logic_vector(31 downto 0) := (others => '0');
   signal sft : std_logic_vector(4 downto 0) := (others => '0');
   signal R_L : std_logic_vector(1 downto 0) := (others => '0');
   signal sv : std_logic := '0';
   signal lui : std_logic := '0';

 	--Outputs
   signal OUTa : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SHIFT PORT MAP (
          INa => INa,
          INb => INb,
          sft => sft,
          R_L => R_L,
          sv => sv,
          lui => lui,
          OUTa => OUTa
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      WAIT FOR 100 ns;
		sft   <= b"01000";  
		R_L   <= b"00";  --**SLL**
		sv    <= '0';
		lui   <= '0';
		INa   <= x"00000003";
		INb   <= x"000B0000";
		WAIT FOR 100 ns;
		sft   <= b"01000";  --**SLLV**
		R_L   <= b"00"; 
		sv    <= '1';
		lui   <= '0';
		INa   <= x"00000003";
		INb   <= x"000B0000";
		WAIT FOR 100 ns;
		sft   <= b"01000";  
		R_L   <= b"01";  --**NOP**
		sv    <= '0';
		lui   <= '0';
		INa   <= x"00000003";
		INb   <= x"000B0000";		 
		 WAIT FOR 100 ns; 
		sft   <= b"01000";  --**srl**
		R_L   <= b"10"; 
		sv    <= '0';
		lui   <= '0';
		INa   <= x"00000003";
		INb   <= x"000B0000";
		WAIT FOR 100 ns; 
		sft   <= b"01000";  --**srlv**
		R_L   <= b"10"; 
		sv    <= '1';
		lui   <= '0';
		INa   <= x"00000003";
		INb   <= x"000B0000";		
		 WAIT FOR 100 ns; 
		sft   <= b"01000";  --**sra**
		R_L   <= b"11"; 
		sv    <= '0';
		lui   <= '0';
		INa   <= x"00000003";
		INb   <= x"000B0000";
		WAIT FOR 100 ns; 
		sft   <= b"01000";  --**srav**
		R_L   <= b"11"; 
		sv    <= '1';
		lui   <= '0';
		INa   <= x"00000003";
		INb   <= x"000B0000";
		
      -- insert stimulus here 

      wait;
   end process;
END;
