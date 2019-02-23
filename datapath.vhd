----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:20:27 09/23/2012 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

entity datapath is
                port( 
					      PC_write  : in std_logic ;
					      CLK       : in std_logic ;
							Reset     : in std_logic ;
							Bus_IR    : in std_logic_vector (31 downto 0);
							IR_write  : in std_logic ;
							RorI      : in std_logic ;
							RF_write  : in std_logic ;
							SorZ      : in std_logic ;
							ALUop     : in std_logic_vector (3 downto 0);
							sv        : in std_logic;
							LUI		 : in	std_logic;
							BorI      : in std_logic;
							MAR_write : in std_logic;
							JUMP      : in std_logic;
							Branch    : in std_logic;
							NEorEQ    : in std_logic;
						   DMorALU   : in std_logic_vector (1 downto 0);
							Link      : in std_logic;
					      Lo_enable : in std_logic;
						   Hi_enable : in std_logic;
                   toLo_enable : in std_logic;
                   toHi_enable : in std_logic;
							Bus_MDRout: in std_logic_vector (31 downto 0);
							test_sel  : in std_logic_vector (1 downto 0);
							BUS_Wout  : out std_logic_vector (31 downto 0);
							BUS_MDRin : out std_logic_vector (31 downto 0);
							BUS_MAR   : out std_logic_vector (31 downto 0);
						   ALUout    : out std_logic_vector (31 downto 0);
							NE        : out std_logic;
							CO        : out std_logic;
							OFL       : out std_logic;
							Z         : out std_logic;
							OPCODE    : out std_logic_vector (5 downto 0);
							FUNC      : out std_logic_vector (5 downto 0);
							Bus_PC    : out std_logic_vector(31 downto 0);
							stall_out : out std_logic;
							test_out  : out std_logic_vector (63 downto 0)
						  );		 
end datapath;

architecture Behavioral of datapath is
----------------------------------------------------------------------------
component R32we is
		 Port ( D_in 	: in  std_logic_vector (31 downto 0);
				  CLK 	: in  std_logic;
				  CLR 	: in  std_logic;
				  WE 		: in  std_logic;
				  D_out 	: out  std_logic_vector (31 downto 0)
				);				
end component;
----------------------------------------------------------------------------
component R32 is
	    Port ( D_in 	: in  std_logic_vector (31 downto 0);
			     CLK 	: in  std_logic;
			     CLR 	: in  std_logic;
				  D_out 	: out  std_logic_vector (31 downto 0)
			    );
end component;
----------------------------------------------------------------------------
component INC is
       Port ( PC    : in  std_logic_vector (31 downto 0);
              NPC   : out  std_logic_vector (31 downto 0)
				 );
end component;
----------------------------------------------------------------------------
component Regfile_bl is
        Port(
		       Clk : in std_logic;
		 Reg_Write : in std_logic;
	  Reg_Imm_not : in std_logic;
		        rs : in std_logic_vector(4 downto 0);
		        rt : in std_logic_vector(4 downto 0);
		        rd : in std_logic_vector(4 downto 0);
		     Bus_W : in std_logic_vector(31 downto 0);
		     Bus_A : out std_logic_vector(31 downto 0);
		     Bus_B : out std_logic_vector(31 downto 0)
            );
end component;
----------------------------------------------------------------------------
component EXT_sz is
		   Port (	
				   IR   : in std_logic_vector ( 15 downto 0);
				   SorZ : in std_logic;
				   I	  : out std_logic_vector ( 31 downto 0 )
				  );
end component;
----------------------------------------------------------------------------
component  CNTR_aux is
        Port(
        	    OPIN  : in   std_logic_vector (5 downto 0);
             FIN   : in   std_logic_vector (5 downto 0);
			    OPOUT : out  std_logic_vector (5 downto 0);
             FOUT  : out  std_logic_vector (5 downto 0)
				);
end component;
----------------------------------------------------------------------------
component ADD32bit is
		  Port ( 
		        Input_A : in  std_logic_vector (31 downto 0);
				  Input_B : in  std_logic_vector (31 downto 0);
				  Output  : out  std_logic_vector (31 downto 0)
				 );
end component;
----------------------------------------------------------------------------
component SL2 is
        Port ( I : in  std_logic_vector (31 downto 0);
               M : out  std_logic_vector (31 downto 0)
			    );
end component;
----------------------------------------------------------------------------
component  mux_2to1_32x is
            Port(
				     IN0    : in  std_logic_vector (31 downto 0);
                 IN1    : in  std_logic_vector (31 downto 0);
                 S0     : in  std_logic;
                 O      : out std_logic_vector (31 downto 0)
					  );
end component;
----------------------------------------------------------------------------
component ALU is
             Port( 
				       svar  : in std_logic ;
				       ALUop : in std_logic_vector ( 3 downto 0);
						 BUSa  : in std_logic_vector ( 31 downto 0);
						 BUSb  : in std_logic_vector ( 31 downto 0);
						 shamt : in std_logic_vector ( 4 downto 0);
						 lui	 : in std_logic;
						 Zero  : out std_logic;
						 ALUout: out std_logic_vector ( 31 downto 0)
						);
end component;
----------------------------------------------------------------------------
component BUS32_aux is
             Port ( 
	                BIN   : in   std_logic_vector (31 downto 0);
			          BOUT  : out  std_logic_vector (31 downto 0)
				       );
end component;
----------------------------------------------------------------------------
component DFF is
		      Port ( Inp : in  std_logic;
			          CLK : in  std_logic;
				      Outp : out  std_logic
				     );
end component;
----------------------------------------------------------------------------
component XOR32bit is
		     Port ( Inp_A : in  std_logic;
				      Inp_B : in  std_logic;
				       Outp : out  std_logic
					  );
end component;
----------------------------------------------------------------------------
component AND2bit is
		    Port ( Inp_A : in  std_logic;
				     Inp_B : in  std_logic;
				      Outp : out  std_logic
					 );
end component;
----------------------------------------------------------------------------
component MUX3to1x32bit is
		 Port ( Inp_0 : in  STD_LOGIC_VECTOR (31 downto 0);
				  Inp_1 : in  STD_LOGIC_VECTOR (31 downto 0);
				  Inp_2 : in  STD_LOGIC_VECTOR (31 downto 0);
				  Sel_1 : in  STD_LOGIC;
				  Sel_2 : in  STD_LOGIC;
				  Outp : out  STD_LOGIC_VECTOR (31 downto 0)
				 );
end component;
----------------------------------------------------------------------------
component DFT_Mult is		
      port ( clk : in std_logic;
	       reset : in std_logic;	       
	       sel   : in std_logic_vector(1 DOWNTO 0);
			 stall : out std_logic;
	       X_top     : in std_logic_vector(31 DOWNTO 0);
          Y_top     : in std_logic_vector(31 DOWNTO 0);
			 PorF      : out std_logic_vector(63 downto 0);
          P_top     : out std_logic_vector(63 downto 0)	
	);
end component;
----------------------------------------------------------------------------
component mux_5to1_32x is
		 Port ( In0 : in  std_logic_vector (31 downto 0);
				  In1 : in  std_logic_vector (31 downto 0);
				  In2 : in  std_logic_vector (31 downto 0);
				  In3 : in  std_logic_vector (31 downto 0);
				  In4 : in  std_logic_vector (31 downto 0);
				  Sel01 : in  std_logic_vector (1 downto 0);
				  Sel2 : in  std_logic;
				  Outp : out  std_logic_vector (31 downto 0)
				 );
end component;
--==================== Internal Signals ==================================--
	signal w_CLK 			: std_logic;
	signal w_Reset			: std_logic;
	signal w_PC				: std_logic_vector (31 downto 0) := (others => '0');
	signal w_IR_out		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_BUS_S 		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_BUS_W 		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_BUSALU		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_BUS_A 		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_BUSM			: std_logic_vector (31 downto 0) := (others => '0');
	signal w_BUS_Pc		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_BUSCM			: std_logic_vector (31 downto 0) := (others => '0');
	signal w_NPC 			: std_logic_vector (31 downto 0) := (others => '0');
	signal w_NPC_Out 		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_RFtoA			: std_logic_vector (31 downto 0) := (others => '0');
	signal w_RFtoB			: std_logic_vector (31 downto 0) := (others => '0');
	signal w_EXTtoI		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_ItoMux		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_BtoMux		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_SL2OUT		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_MuxtoALU		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_AddertoM 	: std_logic_vector (31 downto 0) := (others => '0');
	signal w_Zero			: std_logic;
	signal w_DFFOUT		: std_logic;
	signal w_xorOUT		: std_logic;
	signal w_branchOUT	: std_logic;
	signal w_MULTIout    : std_logic_vector (63 downto 0) := (others => '0');
	signal w_HiMuxtoReg  : std_logic_vector (31 downto 0) := (others => '0');
	signal w_LowMuxtoReg : std_logic_vector (31 downto 0) := (others => '0');
	signal w_HiRegtoMux  : std_logic_vector (31 downto 0) := (others => '0');
	signal w_LowRegtoMux : std_logic_vector (31 downto 0) := (others => '0');
	signal w_CountOut    : std_logic_vector (31 downto 0) := (others => '0');
	signal w_stall       : std_logic;
	signal w_TestOut     : std_logic_vector (63 downto 0) := (others => '0');
--============================ Wiring ====================================--
	begin
	stall_out <= w_stall;
	Z <= w_Zero;
	w_CLK <= CLK ;
	w_Reset <= Reset;
	BUS_PC <= w_BUS_Pc;
	test_out <= w_TestOut;
		PC : R32we port map ( 
									D_in 	=> w_PC, 	
									D_out	=> w_BUS_Pc,
									CLK 	=> w_CLK,
									CLR 	=> w_Reset,
									WE 	=> PC_write
									);
									
		IR : R32we port map ( 
									D_in 	=> BUS_IR, 	
									D_out	=> w_IR_out,
									CLK 	=> w_CLK,
									CLR 	=> w_Reset,
									WE 	=> IR_write
									);
									
	Increase: INC port map (
								   PC	   => w_BUS_Pc,
								   NPC   => w_NPC
								   );
								
		 NPC: R32 port map  (
									D_in 	=> w_NPC, 	
									D_out => w_NPC_out,
									CLK 	=> w_CLK,
									CLR 	=> w_Reset
									);

		RegFile: Regfile_bl port map (
											Clk 			=> w_CLK,
										   Reg_Write	=> RF_write,
										   Reg_Imm_not => RorI,
											rs				=> w_IR_out(25 downto 21),
											rt				=>	w_IR_out(20 downto 16),	
										   rd				=> w_IR_out(15 downto 11),
											Bus_W			=> w_BUS_W,
											Bus_A			=> w_RFtoA,
											Bus_B			=> w_RFtoB
											 );
													  
		Extender: EXT_sz port map  (
											IR 	=> w_IR_out(15 downto 0),
											SorZ	=> SorZ,
											I		=> w_EXTtoI
										    );
										  
		Auxilary: CNTR_aux port map (
											  OPIN  => w_IR_out(31 downto 26),
											  FIN   => w_IR_out( 5 downto 0),
											  OPOUT => OPCODE,
											  FOUT  => FUNC
											  );
											  
		A: R32 port map(
							 D_in 	=> w_RFtoA,
							 D_out => w_BUS_A, 
							 CLK 	=> w_CLK,
							 CLR 	=> w_Reset
							 );
							 
		I: R32 port map(
							 D_in 	=> w_EXTtoI,
							 D_out => w_ItoMux, 
							 CLK 	=> w_CLK,
							 CLR 	=> w_Reset
							);
							
		B: R32 port map(
							 D_in  => w_RFtoB,
							 D_out => w_BtoMux, 
							 CLK 	 => w_CLK,
							 CLR 	 => w_Reset
							);
							
		MUL_shift: SL2 port map (
										 I => w_ItoMux,
										 M => w_SL2OUT
										);

		BorImux: mux_2to1_32x port map (
													S0  	=> BorI,
													IN0 	=> w_ItoMux,
													IN1 	=> w_BtoMux,
													O 	   => w_MuxtoALU
												  );
												  
		Comp: ADD32bit port map(
										Input_A	=> w_NPC_out,
										Input_B	=> w_SL2OUT,
										Output	=> w_AddertoM
										);
										
		AriLogUnit: ALU port map (
									 BUSa	      => w_BUS_A,
									 BUSb 	   => w_MuxtoALU,
									 ALUout 	   => w_BUS_S,
							 		 ALUop 	   => ALUop,
									 shamt 	   => w_IR_out(10 downto 6),
							  		 Zero 		=> w_Zero,
									 svar			=> sv,
									 lui 		   => LUI
									 );
									 
		        M: R32 port map (
							           D_in 	=> w_AddertoM,
						              D_out  => w_BUSM, 
							           CLK 	=> w_CLK,
							           CLR 	=> w_Reset
							          );
												
		RegALUout: R32 port map (
									      D_in 	=> w_BUS_S,
									      D_out => w_BUSALU, 
									      CLK 	=> w_CLK,
									      CLR 	=> w_Reset
									      );
												
		RegMDRin: R32 port map (
										  D_in 	=> w_BtoMux,
										  D_out  => BUS_MDRin, 
										  CLK 	=> w_CLK,
										  CLR 	=> w_Reset
									     );
										  
		RegMAR : R32we port map ( 
										  D_in 	=> w_BUS_S, 	
										  D_out	=> BUS_Mar,
										  CLK 	=> w_CLK,
										  CLR 	=> w_Reset,
										  WE 	   => MAR_write
										 );
										 
		ALUoutBUS: BUS32_aux port map(
												BIN   => w_BUS_S,
												BOUT  => ALUOut
											   );
												
		DFlipFlop: DFF port map(
										Inp	=> w_Zero,
									   CLK	=> w_CLK,
									   Outp	=> w_DFFOUT
										);		
										
		EQXOR: XOR32bit port map(
										Inp_A => w_DFFOUT,
										Inp_B => NEorEQ,
										Outp 	=> w_xorOUT
								       );
								
		Brancher: AND2bit port map(
										   Inp_A 	=> w_xorOUT,
	   								   Inp_B 	=> Branch,
									      Outp		=> w_branchOUT
										   );
										 
		 NextC: MUX3to1x32bit port map(
												Inp_0	=> w_NPC_out, 
												Inp_1 =>	w_BUSM,
												Inp_2 => w_BUS_A,
												Sel_2	=> Jump,
												Sel_1	=>	w_branchOUT,
												Outp 	=> w_PC
												);
												
		 MULTIPLY : DFT_Mult port map (
		                               clk      => w_CLK,
	                                  reset    => w_Reset,       
			                            PorF     => w_TestOut,
												 sel       => test_sel,
												 stall     => w_stall,
												 X_top     => w_BUS_A,
												 Y_top     => w_BtoMux,
												 P_top     => w_MULTIout
												 );											 
												
		 MULHIMUX: mux_2to1_32x port map (
													S0	 => toLo_enable,
													IN0 => w_BUS_A,
													IN1 => w_MULTIout(63 downto 32),
													O 	 => w_HiMuxtoReg
												  );	
												  
		 MULLOWMUX: mux_2to1_32x port map (
													S0	 => toHi_enable,
													IN0 => w_BUS_A,
													IN1 => w_MULTIout(31 downto 0),
													O 	 => w_LowMuxtoReg
												  );	
												  
			Reg_HI : R32we port map ( 
										  D_in 	=> w_HiMuxtoReg, 	
										  D_out	=> w_HiRegtoMux,
										  CLK 	=> w_CLK,
										  CLR 	=> w_Reset,
										  WE 	   => Hi_enable
										   );									  
			
			Reg_LOW : R32we port map ( 
										  D_in 	=> w_LowMuxtoReg,	
										  D_out	=> w_LowRegtoMux,
										  CLK 	=> w_CLK,
										  CLR 	=> w_Reset,
										  WE 	   => Lo_enable
										     );			
												
		DMorALUorMUL_Mux: mux_5to1_32x port map (
												In0   => w_BUS_S, 
												In1   =>	w_BUSCM,
												In2   => w_NPC_out,
												In3   => w_HiRegtoMux,
												In4   => w_LowRegtoMux,
												Sel2  => Link,
												Sel01 =>	DMorALU,
												Outp 	=> w_BUS_W
												);
												
		     OutW: BUS32_aux port map(
												BIN   => w_BUS_W,
												BOUT  => BUS_Wout
											   );
												
		    CM_IN: BUS32_aux port map(
												BIN   => BUS_MDRout,
												BOUT  => w_BUSCM
											   );
			
end Behavioral;