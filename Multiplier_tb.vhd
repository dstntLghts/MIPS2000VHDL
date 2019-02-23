--------------------------------------------------------------------------------
-- Company: UOA	
-- Engineer: C TZERANIS
--
-- Create Date:   19:58:35 09/24/2012
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/MIPSVHDL/Multiplier_tb.vhd
-- Project Name:  MIPSVHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mult32
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
 
ENTITY Multiplier_tb IS
END Multiplier_tb;
 
ARCHITECTURE behavior OF Multiplier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mult32
    PORT(
         X : IN  std_logic_vector(31 downto 0);
         Y : IN  std_logic_vector(31 downto 0);
         P : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(31 downto 0) := (others => '0');
   signal Y : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(63 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mult32 PORT MAP (
          X => X,
          Y => Y,
          P => P
        );
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for 100 ns; 
		X <= x"000000FF";
		Y <= x"000000FF";
		
		wait for 100 ns; 
		X <= x"0000FF00";
		Y <= x"0000FF00";
		
      wait for 100 ns; 
		X <= x"00FF0000";
		Y <= x"00FF0000";
		
		wait for 100 ns; 
		X <= x"FF00FF00";
		Y <= x"FF00FF00";
		
		wait for 100 ns; 
		X <= x"FFFFFFFF";
		Y <= x"0000FF00";
		
		wait for 100 ns; 
		X <= x"FFFFFFFF";
		Y <= x"FFFFFFFF";
      wait;
   end process;

END;
