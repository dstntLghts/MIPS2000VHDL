----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C.TZERANIS
-- 
-- Create Date:    18:18:37 09/23/2012 
-- Design Name: 
-- Module Name:    CNTR_comp - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- Dependencies: 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CNTR_comb is
	Port ( 
	       OPCODE  : in STD_LOGIC_VECTOR (5 downto 0);
	       FUNCT   : in STD_LOGIC_VECTOR (5 downto 0);		 
			 ALUop   : out STD_LOGIC_VECTOR (3 downto 0);
			 BorI    : out STD_LOGIC;
			 Branch  : out STD_LOGIC;
			 DMorALU : out STD_LOGIC_VECTOR (1 downto 0);
		  Hi_enable : out STD_LOGIC; 
			 Jump    : out STD_LOGIC;
			 Link    : out STD_LOGIC;
			 LUI     : out STD_LOGIC;
		  Lo_enable : out STD_LOGIC;
		    NeorEQ  : out STD_LOGIC;
			 RorI    : out STD_LOGIC;
	       SorZ    : out STD_LOGIC;
	       sv      : out STD_LOGIC;  
	   toLo_enable : out STD_LOGIC;
		toHi_enable : out STD_LOGIC
			);
end CNTR_comb;

architecture Behavioral of CNTR_comb is 

	-- Opcode Constant Definitions
	constant	ADDI	:std_logic_vector( 5 downto 0 )	:= "001000"; ------
	constant ADDIU	:std_logic_vector( 5 downto 0 )	:= "001001"; ------
	constant ANDI	:std_logic_vector( 5 downto 0 )	:= "001100"; ------
	constant BNE	:std_logic_vector( 5 downto 0 )	:= "000101"; ------
	constant BEQ	:std_logic_vector( 5 downto 0 )	:= "000100"; ------
	constant cLUI	:std_logic_vector( 5 downto 0 )	:= "001111"; ------
	constant ORI	:std_logic_vector( 5 downto 0 )	:= "001101"; ------
	constant LW		:std_logic_vector( 5 downto 0 )	:= "100011"; ------
	constant RTYPE	:std_logic_vector( 5 downto 0 )	:= "000000"; ------
	constant SW		:std_logic_vector( 5 downto 0 )	:= "101011"; ------
	constant SLTI	:std_logic_vector( 5 downto 0 )	:= "001010"; ------
	constant SLTIU	:std_logic_vector( 5 downto 0 )	:= "001011"; ------
	constant XORI	:std_logic_vector( 5 downto 0 )	:= "001110"; ------

	-- Funct Constant Definitions
	constant ADD	:std_logic_vector( 5 downto 0 )	:= "100000"; ------
	constant ADDU	:std_logic_vector( 5 downto 0 )	:= "100001"; ------
	constant	cAND	:std_logic_vector( 5 downto 0 )	:= "100100"; ------ 
	constant	cOR	:std_logic_vector( 5 downto 0 )	:= "100101"; ------
	constant	cXOR	:std_logic_vector( 5 downto 0 )	:= "100110"; ------
	constant	cNOR	:std_logic_vector( 5 downto 0 )	:= "100111"; ------
	constant JR    :std_logic_vector( 5 downto 0 )  := "001000"; ------
	constant JALR  :std_logic_vector( 5 downto 0 )  := "001001"; ------
	constant MULT  :std_logic_vector( 5 downto 0 )	:= "011000"; ------
	constant	MFHI  :std_logic_vector( 5 downto 0 )	:= "010000"; ------
	constant	MFLO  :std_logic_vector( 5 downto 0 )	:= "010010"; ------
	constant	MTHI  :std_logic_vector( 5 downto 0 )	:= "010001"; ------
	constant	MTLO  :std_logic_vector( 5 downto 0 )	:= "010011"; ------
	constant SLLR	:std_logic_vector( 5 downto 0 )	:= "000000"; ------
	constant SRLR	:std_logic_vector( 5 downto 0 )	:= "000010"; ------
	constant SRAR	:std_logic_vector( 5 downto 0 )	:= "000011"; ------
	constant SLLV	:std_logic_vector( 5 downto 0 )	:= "000100"; ------
	constant SRLV	:std_logic_vector( 5 downto 0 )	:= "000110"; ------
	constant SRAV	:std_logic_vector( 5 downto 0 )	:= "000111"; ------
	constant SLTU	:std_logic_vector( 5 downto 0 )  := "101011"; ------
	constant SLTR 	:std_logic_vector( 5 downto 0 )  := "101010"; ------
	constant SUBRU	:std_logic_vector( 5 downto 0 )	:= "100011"; ------
	constant SUB	:std_logic_vector( 5 downto 0 )	:= "100010"; ------
	
	begin
	
		CNTR_Combi: process ( Opcode, Funct )
		begin
			
			SorZ		<= '0';
			BorI 		<= '0';
			ALUop 	<= "0000";
			SV 		<= '0';
			DMorALU 	<= "00";
			Link 		<= '0';
			RorI 		<= '0';
			Branch 	<= '0';
			NEorEQ 	<= '0';
			Jump 		<= '0';
			Lo_enable <= '0';
			Hi_enable <= '0';
			toLo_enable <= '0';
			toHi_enable <= '0';
			LUI		<= '0';

			case OPCODE is 
			when LW =>  
							SorZ 			<= '1';
							BorI	 		<= '0';
							ALUop			<= "1000";
							sv 			<= '-';
							DMorALU 		<= "01";
							Link 			<= '0';
							RorI 			<= '0';
							Branch 		<= '0';
							NEorEQ 		<= '-';
							Jump 			<= '0';
							LUI         <= '0';
							Lo_enable   <= '0';
							Hi_enable   <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';

			when SW =>   
							SorZ <= '1';
							BorI <= '0';
							ALUop <= "1000"; 
							sv <= '-';
							DMorALU <= "--";
							Link <= '-';
							RorI <= '-';
							Branch <= '0';
							NEorEQ <= '-';
							Jump <= '0';
							LUI <= '0';
							Lo_enable <= '0';
							Hi_enable <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';
							
			when ADDIU => 
							SorZ <= '1';
							BorI <= '0';
							ALUop <= "1001"; --done
							sv <= '-';
							DMorALU <= "00";
							Link <= '0';
							RorI <= '0';
							Branch <= '0';
							NEorEQ <= '-';
							Jump <= '0';
							LUI <= '0';
							Lo_enable <= '0';
							Hi_enable <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';

			when ORI => 
							SorZ <= '0';
							BorI <= '0';
							ALUop <= "1101"; --done
							sv <= '-';
							DMorALU <= "00";
							Link <= '0';
							RorI <= '0';
							Branch <= '0';
							NEorEQ <= '-';
							LUI <= '0';
							Jump <= '0';
							Lo_enable <= '0';
							Hi_enable <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';

			when BEQ =>
							SorZ <= '1';
							BorI <= '1';
							ALUop <= "1010"; --done
							sv <= '-';
							DMorALU <= "--";
							Link <= '0';
							RorI <= '-';
							Branch <= '1';
							NEorEQ <= '0';
							Jump <= '0';
							LUI <= '0';
							Lo_enable <= '0';
							Hi_enable <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';

			when BNE =>
							SorZ <= '1';
							BorI <= '1';
							ALUop <= "1010"; --done
							sv <= '-';
							DMorALU <= "--";
							Link <= '0';
							RorI <= '-';
							Branch <= '1';
							NEorEQ <= '1';
							Jump <= '0';
							LUI <= '0';
							Lo_enable <= '0';
							Hi_enable <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';
							
			when cLUI => 
							SorZ <= '1';
							BorI <= '0';
							ALUop <= "0000"; --done
							sv <= '-';
							DMorALU <= "00";
							Link <= '0';
							RorI <= '0';
							Branch <= '0';
							NEorEQ <= '-';
							Jump <= '0';
							LUI <= '1';
							Lo_enable <= '0';
							Hi_enable <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';

			when ANDI => -- done
							SorZ <= '0';
							BorI <= '0';
							ALUop <= "1100"; 
							sv <= '-';
							DMorALU <= "00";
							Link <= '0';
							RorI <= '0';
							Branch <= '0';
							NEorEQ <= '-';
							Jump <= '0';
							LUI <= '0';
							Lo_enable <= '0';
							Hi_enable <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';

			when XORI =>
							SorZ <= '0';
							BorI <= '0'; 
							ALUop <= "1110";
							sv <= '-';
							DMorALU <= "00";
							Link <= '0';
							RorI <= '0';
							Branch <= '0';
							NEorEQ <= '-';
							Jump <= '0';
							LUI <= '0';
							Lo_enable <= '0';
							Hi_enable <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';
							
			when ADDI =>
							SorZ <= '1';
							BorI <= '0';
							ALUop <= "1000";
							sv <= '-';
							DMorALU <= "00";
							Link <= '0';
							RorI <= '0';
							Branch <= '0';
							NEorEQ <= '-';
							Jump <= '0';
							LUI <= '0';
							Lo_enable <= '0';
							Hi_enable <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';

			when SLTI =>
							SorZ <= '1';
							BorI <= '0';
							ALUop <= "0110";
							sv <= '-';
							DMorALU <= "00";
							Link <= '0';
							RorI <= '0';
							Branch <= '0';
							NEorEQ <= '-';
							Jump <= '0';
							LUI <= '0';
							Lo_enable <= '0';
							Hi_enable <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';

			when SLTIU =>
							SorZ <= '1';
							BorI <= '0';
							ALUop <= "0111"; --done
							sv <= '-';
							DMorALU <= "00";
							Link <= '0';
							RorI <= '0';
							Branch <= '0';
							NEorEQ <= '-';
							Jump <= '0';
							LUI <= '0';
							Lo_enable <= '0';
							Hi_enable <= '0';
							toLo_enable <= '0';
							toHi_enable <= '0';
			
			 
			when RTYPE =>
				case FUNCT is 
							when ADDU  => 
												SorZ <= '-';
												BorI <= '1';
												ALUop <= "1001";
												sv <= '-';
												DMorALU <= "00";
												Link <= '0';
												RorI <= '1';
												Branch <= '0';
												NEorEQ <= '-';
												Jump <= '0';
												LUI <= '0';
												Lo_enable <= '0';
							               Hi_enable <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when SUBRU =>  
												SorZ <= '-';
												BorI <= '1';
												ALUop <= "1011"; --done
												sv <= '-';
												DMorALU <= "00";
												Link <= '0';
												RorI <= '1';
												Branch <= '0';
												NEorEQ <= '-';
												Jump <= '0';
												LUI <= '0';
												Lo_enable <= '0';
							               Hi_enable <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';
												
							when SRLR => 
												SorZ <= '-';
												BorI <= '1';
												ALUop <= "0010";
												sv <= '0';
												DMorALU <= "00";
												Link <= '0';
												RorI <= '1';
												Branch <= '0';
												NEorEQ <= '-';
												Jump <= '0';
												LUI <= '0';
												Lo_enable <= '0';
							               Hi_enable <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when SLLR => 
												SorZ <= '-';
												BorI <= '1';
												ALUop <= "0000"; --done
												sv <= '0';
												DMorALU <= "00";
												Link <= '0';
												RorI <= '1';
												Branch <= '0';
												NEorEQ <= '-';
												Jump <= '0';
												LUI <= '0';
												Lo_enable <= '0';
							               Hi_enable <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when SRAR => 
												SorZ <= '-';
												BorI <= '1';
												ALUop <= "0011"; --done
												sv <= '0';
												DMorALU <= "00";
												Link <= '0';
												RorI <= '1';
												Branch <= '0';
												NEorEQ <= '-';
												Jump <= '0';
												LUI <= '0';
												Lo_enable <= '0';
							               Hi_enable <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when SLLV => 			
												SorZ <= '-';
												BorI <= '1';
												ALUop <= "0000"; --done
												sv <= '1';
												DMorALU <= "00";
												Link <= '0';
												RorI <= '1';
												Branch <= '0';
												NEorEQ <= '-';
												Jump <= '0';
												LUI <= '0';
												Lo_enable <= '0';
							               Hi_enable <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when SRLV => 			
												SorZ <= '-';
												BorI <= '1';
												ALUop <= "0010";
												sv <= '1';
												DMorALU <= "00";
												Link <= '0';
												RorI <= '1';
												Branch <= '0';
												NEorEQ <= '-';
												Jump <= '0';
												LUI <= '0';
												Lo_enable <= '0';
							               Hi_enable <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when SRAV => 				
												SorZ <= '-';
												BorI <= '1';
												ALUop <= "0011";
												sv <= '1';
												DMorALU <= "00";
												Link <= '0';
												RorI <= '1';
												Branch <= '0';
												NEorEQ <= '-';
												Jump <= '0';
												LUI <= '0';
												Lo_enable <= '0';
							               Hi_enable <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when JR =>
												SorZ <= '-';
												BorI <= '-';
												ALUop <= "----";
												sv <= '-';
												DMorALU <= "--";
												Link <= '-';
												RorI <= '-';
												Branch <= '-';
												NEorEQ <= '-';
												Jump <= '1';
												LUI <= '0';
												Lo_enable <= '0';
							               Hi_enable <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when JALR =>
												SorZ <= '-';
												BorI <= '-';
												ALUop <= "----";
												sv <= '-';
												DMorALU <= "--";
												Link <= '1';
												RorI <= '1';
												Branch <= '-';
												NEorEQ <= '-';
												Jump <= '1';
												LUI <= '0';
												Lo_enable <= '-';
							               Hi_enable <= '-';
							               toLo_enable <= '-';
							               toHi_enable <= '-';

							when cAND => 
												SorZ <= '-';
												BorI <= '1';
												ALUop <= "1100";
												sv <= '-';
												DMorALU <= "00";
												Link <= '0';
												RorI <= '1';
												Branch <= '0';
												NEorEQ <= '-';
												Jump <= '0';
												LUI <= '0';
												Lo_enable <= '0';
							               Hi_enable <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';
												
							when cOR => 
												SorZ <= '-';
												BorI <= '1';
												ALUop <= "1101";
												sv <= '-';
												DMorALU <= "00";
												Link <= '0';
												RorI <= '1';
												Branch <= '0';
												NEorEQ <= '-';
												Jump <= '0';
												LUI <= '0';
												Lo_enable <= '0';
							               Hi_enable <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when cXOR => 
												SorZ <= '-';
												BorI <= '1';
												ALUop <= "1110";
												sv <= '-';
												DMorALU <= "00";
												Link <= '0';
												RorI <= '1';
												Branch <= '0';
												NEorEQ <= '-';
												Jump        <= '0';
												LUI         <= '0';
												Lo_enable   <= '0';
							               Hi_enable   <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when cNOR => 
												SorZ        <= '-';
												BorI        <= '1';
												ALUop       <= "1111";
												sv          <= '-';
												DMorALU     <= "00";
												Link        <= '0';
												RorI        <= '1';
												Branch      <= '0';
												NEorEQ      <= '-';
												Jump        <= '0';
												LUI         <= '0';
												Lo_enable   <= '0';
							               Hi_enable   <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';
												
							when ADD => 
												SorZ        <= '-';
												BorI        <= '1';
												ALUop       <= "1000";
												sv          <= '-';
												DMorALU     <= "00";
												Link        <= '0';
												RorI        <= '1';
												Branch      <= '0';
												NEorEQ      <= '-';
												Jump        <= '0';
												LUI         <= '0';
												Lo_enable   <= '0';
							               Hi_enable   <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when SUB =>
												SorZ        <= '-';
												BorI        <= '1';
												ALUop       <= "1010";
												sv          <= '-';
												DMorALU     <= "00";
												Link        <= '0';
												RorI        <= '1';
												Branch      <= '0';
												NEorEQ      <= '-';
												Jump        <= '0';
												LUI         <= '0';
												Lo_enable   <= '0';
							               Hi_enable   <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when SLTR =>
												SorZ        <= '-';
												BorI        <= '1';
												ALUop       <= "0110";
												sv          <= '-';
												DMorALU     <= "00";
												Link        <= '0';
												RorI        <= '1';
												Branch      <= '0';
												NEorEQ      <= '-';
												Jump        <= '0';
												LUI         <= '0';
												Lo_enable   <= '0';
							               Hi_enable   <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';

							when SLTU =>
												SorZ        <= '-';
												BorI        <= '1';
												ALUop       <= "0111";
												sv          <= '-';
												DMorALU     <= "00";
												Link        <= '0';
												RorI        <= '1';
												Branch      <= '0';
												NEorEQ      <= '-';
												Jump        <= '0';
												LUI         <= '0';
												Lo_enable   <= '0';
							               Hi_enable   <= '0';
							               toLo_enable <= '0';
							               toHi_enable <= '0';
												
						   when MULT =>
												SorZ        <= '-';
												BorI        <= '1';
												ALUop       <= "0000";
												sv          <= '-';
												DMorALU     <= "00";
												Link        <= '0';
												RorI        <= '-';
												Branch      <= '0';
												NEorEQ      <= '-';
												Jump        <= '0';
												LUI         <= '0';
												Lo_enable   <= '1';
												Hi_enable   <= '1';
												toLo_enable <= '0';
												toHi_enable <= '0';

						  when MFHI =>
												SorZ        <= '-';
												BorI        <= '1';
												ALUop       <= "0000";
												sv          <= '-';
												DMorALU     <= "10";
												Link        <= '0';
												RorI        <= '1';
												Branch      <= '0';
												NEorEQ      <= '-';
												Jump        <= '0';
												LUI         <= '0';
												Lo_enable   <= '0';
												Hi_enable   <= '0';
												toLo_enable <= '0';
												toHi_enable <= '0';

						  when MFLO =>
												SorZ        <= '-';
												BorI        <= '1';
												ALUop       <= "0000";
												sv          <= '-';
												DMorALU     <= "11";
												Link        <= '0';
												RorI        <= '1';
												Branch      <= '0';
												NEorEQ      <= '-';
												Jump        <= '0';
												LUI         <= '0';
												Lo_enable   <= '0';
												Hi_enable   <= '0';
												toLo_enable <= '0';
												toHi_enable <= '0';

						 when MTHI =>
												SorZ        <= '-';
												BorI        <= '1';
												ALUop       <= "0000";
												sv          <= '-';
												DMorALU     <= "00";
												Link        <= '0';
												RorI        <= '-';
												Branch      <= '0';
												NEorEQ      <= '-';
												Jump        <= '0';
												LUI         <= '0';
												Lo_enable   <= '0';
												Hi_enable   <= '1';
												toLo_enable <= '0';
												toHi_enable <= '1';
												
						when MTLO =>
												SorZ 			<= '-';
												BorI 			<= '1';
												ALUop 		<= "0000";
												sv 			<= '-';
												DMorALU 		<= "00";
												Link 			<= '0';
												RorI 			<= '-';
												Branch 		<= '0';
												NEorEQ 		<= '-';
												Jump 			<= '0';
												LUI 			<= '0';
												Lo_enable	<= '1';
												Hi_enable	<= '0';
												toLo_enable	<= '1';
												toHi_enable	<= '0';												
						when others =>    SorZ <= '-';
												
						end case ;
						
					when others => SorZ <= '-';
				end case;
			end process;
	
end Behavioral;