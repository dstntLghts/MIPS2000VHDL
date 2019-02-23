----------------------------------------------------------------------------------
-- Company: UOA 
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:19:29 09/23/2012 
-- Design Name: 
-- Module Name:    CNTR_fsm - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CNTR_fsm is
		Port (
		     OPCODE : in STD_LOGIC_VECTOR (5 downto 0);
	      	FUNCT : in STD_LOGIC_VECTOR (5 downto 0);
		      RESET : in STD_LOGIC;
		        CLK : in STD_LOGIC;
		stall_signal: in STD_LOGIC;
		   PC_write : out STD_LOGIC;
		   IR_write : out STD_LOGIC;
		  MAR_write : out STD_LOGIC;
		 DMEM_write : out STD_LOGIC_VECTOR (3 downto 0);
		   RF_write : out STD_LOGIC
			  );
end CNTR_fsm;

architecture Behavioral of CNTR_fsm is

	-- state definition
		type control_states is
		(S0, S1, S2A, S2B, S3, S4A, S4B, S4C ,S4D ,S4E); --,S5
		signal current_state, next_state : control_states;
		
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
-- common synchronous process for all FSMs
	SYNCHR: process (CLK, RESET)
		begin
			if (RESET = '1') or( stall_signal = '1') then
			current_state <= S0; -- initial state
			elsif (CLK'event and CLK = '1') then
			current_state <= next_state;
			end if;
		end process;
		
-- asynchronous process to create output logic and next state logic
	ASYNCHR: process (current_state, OPCODE, FUNCT)	
	begin 
			-- next state and output initialization
				next_state <= S0; -- initial state
				IR_write <= '0';
				MAR_write <= '0';
				DMEM_write <= "0000";
				RF_write <= '0';
				PC_write <= '0';
				
				case current_state is	
				when S0 =>
								next_state <= S1;
								IR_write <= '1';
				
				when S1 =>
				    case OPCODE is
				         when SW | LW  =>
								    next_state <= S2A; 
	
				  
				         when ADDIU | ORI | cLUI | BEQ | ANDI | XORI | ADDI | BNE | SLTI | SLTIU =>
								    next_state <= S2B; 
								
								
				         when RTYPE =>
					          case FUNCT is 
					
					                when ADDU | SUBRU | cAND | cOR | cXOR | cNOR | SLLR| SRLR| SRAR | SLLV | SRLV | SRAV | SUB | ADD | SLTU | SLTR =>
									      	next_state <= S2B; 
									      	
										 WHEN JR |MULT | MTHI | MTLO =>
										  next_state <= S4D;					
											 
                               when JALR | MFHI | MFLO =>
										     next_state <= S4E; 

				          	       when others => next_state <= S0;
					         end case;
				       when others => next_state <= S0;
				       end case;
				
				when S2A =>
				case OPCODE is 
					
					when LW =>
								 next_state <= S3;
								 MAR_write <= '1';
					when  SW => 
								 next_state <= S4B;
								 MAR_write <= '1';		 		
					when  others => 
					          next_state <= S0;
					end case;			
				when S2B =>
				case OPCODE is    
					        when ADDIU | XORI | ORI | cLUI | ADDI | ANDI |SLTI | SLTIU =>
								    next_state <= S4E;
                             MAR_write <= '0';
					        when BEQ | BNE =>
                            next_state <= S4D;									 
									  MAR_write <= '0';
					        when RTYPE =>
					                    case FUNCT is 
											              WHEN SLLR | SRLR | SRAR | SLLV | SRLV | SRAV =>
															                  next_state <= S4C;
																					 MAR_write <= '0';
																
						                             when ADDU | SUBRU |cAND | SUB | cOR | cXOR | cNOR | SLTU | SLTR | MFHI | MFLO=>
															                	next_state <= S4E;
									 						                    MAR_write <= '0';
						                              when others => next_state <= S0;
						                end case;
					        when others => next_state <= S0;
					end case;					
				When S3 =>
				case OPCODE is 			
					when LW => 
									next_state <= S4A;								
					when others => next_state <= S0;
				end case;
				
				when S4A  =>
				next_state <= S0;--S5;
			   DMEM_write <= "0000";
			     RF_write <= '1';
			  	  PC_write <= '1';
			 
				when S4B =>
				next_state <= S0;--S5;
				DMEM_write <= "1111";
				RF_write <= '0';
				PC_write <= '1';

            when S4C =>
			 next_state <= S0;--S5;
			  MAR_write <= '0';
			 DMEM_write <= "1111";
				RF_write <= '1';
				PC_write <= '1';
				
				when S4D =>
				 next_state <= S0;--S5;
				  MAR_write <= '0';
				 DMEM_write <= "0000";
			      RF_write <= '0';
					PC_write <= '1';
				
				when S4E =>
				next_state <= S0;--S5;			     
				 MAR_write <= '0';						    									 
				DMEM_write <= "0000";
			  	  RF_write <= '1';
				  PC_write <= '1';

--			when S5 =>
--			  next_state <= S0;
--			  				when others => next_state <= S0;
		end case ;
		end process;

end Behavioral;