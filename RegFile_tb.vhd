--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:15:18 09/28/2013
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/Desktop/MIPS2000VHDL/RegFile_tb.vhd
-- Project Name:  MIPS2000VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Regfile_bl
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
use IEEE.std_logic_arith.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RegFile_tb IS
END RegFile_tb;
 
ARCHITECTURE behavior OF RegFile_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Regfile_bl
    PORT(
         Clk : IN  std_logic;
         Reg_Write : IN  std_logic;
         Reg_Imm_not : IN  std_logic;
         rs : IN  std_logic_vector(4 downto 0);
         rt : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         Bus_W : IN  std_logic_vector(31 downto 0);
         Bus_A : OUT  std_logic_vector(31 downto 0);
         Bus_B : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reg_Write : std_logic := '0';
   signal Reg_Imm_not : std_logic := '0';
   signal rs : std_logic_vector(4 downto 0) := (others => '0');
   signal rt : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal Bus_W : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Bus_A : std_logic_vector(31 downto 0);
   signal Bus_B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Regfile_bl PORT MAP (
          Clk => Clk,
          Reg_Write => Reg_Write,
          Reg_Imm_not => Reg_Imm_not,
          rs => rs,
          rt => rt,
          rd => rd,
          Bus_W => Bus_W,
          Bus_A => Bus_A,
          Bus_B => Bus_B
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process			
	stim_proc: process
	begin		
		wait for 50 ns;
------------Load data to the registers-----------	
		for i in 1 to 31 loop
			wait until (CLK'event and CLK = '1');
			Bus_W <= x"00000001";
			Reg_Write <= '1';
			Reg_Imm_not <= '0';
			rs <= b"00000";
			rt <= CONV_STD_LOGIC_VECTOR((i),(5));
			rd <= b"00000";
		end loop;	
		
		for i in 1 to 15 loop 			
			wait until (CLK'event and CLK = '1');
			Bus_W <= x"00000101";
			Reg_Write <= '1';
			Reg_Imm_not <= '1';
			rs <= b"00000";
			rt <= b"00000";
			rd <= CONV_STD_LOGIC_VECTOR((i),(5));
		end loop;			

		for i in 16 to 31 loop
		  wait until (CLK'event and CLK = '1');
		  Bus_W <= x"00000201";
		  Reg_Write <= '1';
		  Reg_Imm_not <= '1';
		  rs <= b"00000";
		  rt <= b"00000";
		  rd <= CONV_STD_LOGIC_VECTOR((i),(5));			
		end loop;	
-- Read data from the registers ---------------
		for i in 1 to 31 loop 
			wait until (CLK'event and CLK = '1');
			Bus_W <= x"00000000";
			Reg_Write <= '0';
			Reg_Imm_not <= '1';
			rs <= CONV_STD_LOGIC_VECTOR((i),(5));
			rt <= b"00000";
			rd <= b"00000";
		end loop;		
		
		for i in 1 to 31 loop
			wait until (CLK'event and CLK = '1');
			Bus_W <= x"0000000D";
			Reg_Write <= '0';
			Reg_Imm_not <= '0';
			rs <= b"00000";
			rt <= CONV_STD_LOGIC_VECTOR((i),(5));
			rd <= b"00000";
		end loop;		
   end process;
END;
