--------------------------------------------------------------------------------
-- Company: UOA 
-- Engineer: C TZERANIS
--
-- Create Date:   19:42:15 09/24/2012
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/MIPSVHDL/ALU_tb.vhd
-- Project Name:  MIPSVHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         svar : IN  std_logic;
         ALUop : IN  std_logic_vector(3 downto 0);
         BUSa : IN  std_logic_vector(31 downto 0);
         BUSb : IN  std_logic_vector(31 downto 0);
         shamt : IN  std_logic_vector(4 downto 0);
         lui : IN  std_logic;
         Zero : OUT  std_logic;
         ALUout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal svar : std_logic := '0';
   signal ALUop : std_logic_vector(3 downto 0) := (others => '0');
   signal BUSa : std_logic_vector(31 downto 0) := (others => '0');
   signal BUSb : std_logic_vector(31 downto 0) := (others => '0');
   signal shamt : std_logic_vector(4 downto 0) := (others => '0');
   signal lui : std_logic := '0';

 	--Outputs
   signal Zero : std_logic;
   signal ALUout : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          svar => svar,
          ALUop => ALUop,
          BUSa => BUSa,
          BUSb => BUSb,
          shamt => shamt,
          lui => lui,
          Zero => Zero,
          ALUout => ALUout
        );
   -- *** Test Bench - User Defined Section ***
   test_patterns : PROCESS
   BEGIN
		WAIT FOR 50ns; -- the test patterns change after 100ns
		Shamt <= "00000";  --**ADD Bus A and Bus B** 
		ALUop <=b"0000"; 
		BUSa <= x"0000000A";
		BUSb <= x"00000005";
		
		WAIT FOR 50ns; -- the test patterns change after 150ns
		Shamt <= "00000";  --**SUB bus A and bus B** 
		ALUop <=b"0010"; 
		BUSa <= x"0000000A";
		BUSb <= x"00000005";
		
		WAIT FOR 50ns; -- the test patterns change after 200ns
		Shamt <= "00000";  --**INa AND INb
		ALUop <=b"0100"; 
		BUSa <= x"0000000A";
		BUSb <= x"00000007";
		
		WAIT FOR 50ns; -- the test patterns change after 250ns
		Shamt <= "00000";  --**INa OR INb
		ALUop <=b"0101"; 
		BUSa <= x"0000000A";
		BUSb <= x"00000007";
		
		WAIT FOR 50ns; -- the test patterns change after 300ns
		Shamt <= "00000";  --**INa XOR INb
		ALUop <=b"0110"; 
		BUSa <= x"0000000A";
		BUSb <= x"00000007";
		
		WAIT FOR 50ns; -- the test patterns change after 350ns
		Shamt <= "00000";  --**INa NOR INb
		ALUop <=b"0111"; 
		BUSa <= x"0000000A";
		BUSb <= x"00000005";
		
		WAIT FOR 50 ns; -- the test patterns change after 400ns
		Shamt <= b"00100";  --**Shifting BUSb 8 places to the left**
		ALUop <= b"1000"; 
		svar  <= '0';
		lui   <= '0';
		BUSa <= x"00000003";
		BUSb <= x"0000F000";
		
		WAIT FOR 50 ns; -- the test patterns change after 450ns
		Shamt <= b"00100";  --**Shifting BUSb 8 places to the right logical**
		ALUop <= b"1010"; 
		svar  <= '0';
		lui   <= '0';	
		BUSa  <= x"00000003";
		BUSb  <= x"0000F000";
		
		WAIT FOR 50 ns; -- the test patterns change after 500ns
		Shamt <= b"00100";  --**Shifting BUSb 8 places to the left arithmetic**
		ALUop <= b"1011"; 
		svar  <= '0';
		lui   <= '0';
		BUSa  <= x"00000003";
		BUSb  <= x"0000F000";
		
		WAIT FOR 50 ns; -- the test patterns change after 550ns
		Shamt <= b"00100";  --**Shifting BUSb 3 places to the left arithmetic**
		ALUop <= b"1011"; 
		svar  <= '1';
		lui   <= '0';
		BUSa  <= x"00000003";
		BUSb  <= x"0000F000";
						
		WAIT FOR 50 ns; -- the test patterns change after 650ns
		Shamt <= "00000";  --**SetLessThan**
		ALUop <=b"1100"; 
		svar  <= '0';
		lui   <= '0';
		BUSa <= x"F0000000";
		BUSb <= x"00000000";
		
		WAIT FOR 50 ns; -- the test patterns change after 700ns
		Shamt <= "00000";  --**SetLessThan**
		ALUop <=b"1100"; 
		svar  <= '0';
		lui   <= '0';
		BUSa <= x"0000000F";
		BUSb <= x"00000002";		
		
		WAIT FOR 50 ns; -- the test patterns change after 600ns
		Shamt <= b"01000";  --**Load Upper Immediate **
		ALUop <= b"0000"; 
		svar  <= '0';
		lui   <= '1';
		BUSa  <= x"00000003";
		BUSb  <= x"0000000A";
		
 END PROCESS;
-- *** End Test Bench - User Defined Section ***
END;	