----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:15:14 09/23/2012 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
             Port( 
				       svar  : in std_logic ;
				       ALUop : in std_logic_vector ( 3 downto 0);
						 BUSa  : in std_logic_vector ( 31 downto 0);
						 BUSb  : in std_logic_vector ( 31 downto 0);
						 shamt : in std_logic_vector ( 4 downto 0);
						 lui	 : in std_logic ;
						 Zero  : out std_logic;
						 ALUout: out std_logic_vector ( 31 downto 0)
						);
end ALU;

architecture Behavioral of ALU is

----------------------------------------------------------------------------
component addsub32x is
     Port ( 
           IN0 : in std_logic_vector(31 downto 0);
           IN1 : in std_logic_vector(31 downto 0);
			  S0 : out std_logic_vector(31 downto 0);
			  sub0 : in std_logic
			 );
end component;
----------------------------------------------------------------------------
component LU is 
     Port ( 
	         INa: in std_logic_vector(31 downto 0);
	         INb: in std_logic_vector(31 downto 0);
				OUTa: out std_logic_vector(31 downto 0);
				sel: in std_logic_vector(1 downto 0)
			  ); 
end component;
----------------------------------------------------------------------------
component SHIFT is
     Port ( 
	         sv :  in std_logic;
				lui: in std_logic ;
	         R_L: in std_logic_vector(1 downto 0);
			   sft: in std_logic_vector(4 downto 0);
			   INa: in std_logic_vector(31 downto 0);
				INb: in std_logic_vector(31 downto 0);
				OUTa: out std_logic_vector(31 downto 0)
				);
end component;
-----------------------------------------------------------------------------
component SLT is
	   Port ( 
		      Ne: in std_logic;
	         O: out std_logic_vector(31 downto 0)
	         );
						 
end component;
-----------------------------------------------------------------------------
component mux4to1_32x is 
       Port (
		       IN0: in std_logic_vector (31 downto 0);
		       IN1: in std_logic_vector (31 downto 0);
				 IN2: in std_logic_vector (31 downto 0);
				 IN3: in std_logic_vector (31 downto 0);
				 sel: in std_logic_vector (1 downto 0);
				 O: out std_logic_vector (31 downto 0)
				 );  
end component;
-----------------------------------------------------------------------------
component OR_tree is
       port( 
            ORin	  : in std_logic_vector (31 downto 0); 
		      ORout  : out std_logic
				);
end component;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
	   signal ALUop_S    :  std_logic_vector ( 3 downto 0 );
	   signal AddSub_out	:  std_logic_vector ( 31 downto 0 );
	   signal LU_out		:  std_logic_vector ( 31 downto 0 );
	   signal Shift_out	: 	std_logic_vector ( 31 downto 0 );
	   signal SLT_out		:  std_logic_vector ( 31 downto 0 );
	   signal Mux_out		:  std_logic_vector ( 31 downto 0 );
	   signal NeSignal   :  std_logic;
	   signal Z		   	:  std_logic_vector ( 31 downto 0 );
	
begin
      ALUop_S(3 downto 0) <= ALUop(3 downto 0);			
		NeSignal <= AddSub_out(31);
    	Z <= mux_out;
		Aluout <= Mux_out;
		
		P1: addsub32x port map(
									  IN0 => BUSa,
									  IN1 => BUSb,
									  S0 => AddSub_out,
									  Sub0 => ALUop_S(1)
									  );
      
		P2: LU port map(
							 INa => BUSa,
							 INb => BUSb,
							 Outa => LU_out,
							 Sel => ALUop_S(1 downto 0)
							 ); 		
										
		P3: mux4to1_32x port map(
										 IN0 => Shift_out,										 
										 IN1 => SLT_out, 
										 IN2 => AddSub_out, 
										 IN3 => LU_out,
										 Sel => ALUop(3 downto 2),
										 O =>	Mux_out
										 );
		P4:OR_tree port map(
								   ORin => Z ,
									ORout => Zero
								  );
		P5: SLT port map(  
		                    Ne => NeSignal,
	 							  O => SLT_out
							  );
      P6: SHIFT port map(
								  INa => BUSa,
								  Inb => BUSb,
								  sft => shamt,
								  R_L => ALUop(1 downto 0),
								  sv => svar,
								  lui => lui,
								  OUTa => Shift_out
            				 );
								 
end Behavioral;