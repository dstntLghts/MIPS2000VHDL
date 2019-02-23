--------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C. TZERANIS
--
-- Create Date:   22:38:57 09/28/2012
-- Design Name:   
-- Module Name:   C:/Users/Xhaar/Desktop/MIPSVHDL/datapath_tb.vhd
-- Project Name:  MIPSVHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: datapath
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
 
ENTITY datapath_tb IS
END datapath_tb;
 
ARCHITECTURE behavior OF datapath_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT datapath
    PORT(
         PC_write : IN  std_logic;
         CLK : IN  std_logic;
         Reset : IN  std_logic;
         Bus_IR : IN  std_logic_vector(31 downto 0);
         IR_write : IN  std_logic;
         RorI : IN  std_logic;
         RF_write : IN  std_logic;
         SorZ : IN  std_logic;
         ALUop : IN  std_logic_vector(3 downto 0);
         sv : IN  std_logic;
         LUI : IN  std_logic;
         BorI : IN  std_logic;
         MAR_write : IN  std_logic;
         JUMP : IN  std_logic;
         Branch : IN  std_logic;
         NEorEQ : IN  std_logic;
         DMorALU : IN  std_logic_vector(1 downto 0);
         Link : IN  std_logic;
         Bus_MDRout : IN  std_logic_vector(31 downto 0);
         BUS_Wout : OUT  std_logic_vector(31 downto 0);
         BUS_MDRin : OUT  std_logic_vector(31 downto 0);
         BUS_MAR : OUT  std_logic_vector(31 downto 0);
         ALUout : OUT  std_logic_vector(31 downto 0);
         NE : OUT  std_logic;
         CO : OUT  std_logic;
         OFL : OUT  std_logic;
         Z : OUT  std_logic;
         OPCODE : OUT  std_logic_vector(5 downto 0);
         FUNC : OUT  std_logic_vector(5 downto 0);
         Bus_PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_write : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Bus_IR : std_logic_vector(31 downto 0) := (others => '0');
   signal IR_write : std_logic := '0';
   signal RorI : std_logic := '0';
   signal RF_write : std_logic := '0';
   signal SorZ : std_logic := '0';
   signal ALUop : std_logic_vector(3 downto 0) := (others => '0');
   signal sv : std_logic := '0';
   signal LUI : std_logic := '0';
   signal BorI : std_logic := '0';
   signal MAR_write : std_logic := '0';
   signal JUMP : std_logic := '0';
   signal Branch : std_logic := '0';
   signal NEorEQ : std_logic := '0';
   signal DMorALU : std_logic := '0';
   signal Link : std_logic := '0';
   signal Bus_MDRout : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal BUS_Wout : std_logic_vector(31 downto 0);
   signal BUS_MDRin : std_logic_vector(31 downto 0);
   signal BUS_MAR : std_logic_vector(31 downto 0);
   signal ALUout : std_logic_vector(31 downto 0);
   signal NE : std_logic;
   signal CO : std_logic;
   signal OFL : std_logic;
   signal Z : std_logic;
   signal OPCODE : std_logic_vector(5 downto 0);
   signal FUNC : std_logic_vector(5 downto 0);
   signal Bus_PC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: datapath PORT MAP (
          PC_write => PC_write,
          CLK => CLK,
          Reset => Reset,
          Bus_IR => Bus_IR,
          IR_write => IR_write,
          RorI => RorI,
          RF_write => RF_write,
          SorZ => SorZ,
          ALUop => ALUop,
          sv => sv,
          LUI => LUI,
          BorI => BorI,
          MAR_write => MAR_write,
          JUMP => JUMP,
          Branch => Branch,
          NEorEQ => NEorEQ,
          DMorALU => DMorALU,
          Link => Link,
          Bus_MDRout => Bus_MDRout,
          BUS_Wout => BUS_Wout,
          BUS_MDRin => BUS_MDRin,
          BUS_MAR => BUS_MAR,
          ALUout => ALUout,
          NE => NE,
          CO => CO,
          OFL => OFL,
          Z => Z,
          OPCODE => OPCODE,
          FUNC => FUNC,
          Bus_PC => Bus_PC
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
