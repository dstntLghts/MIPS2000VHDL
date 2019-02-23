----------------------------------------------------------------------------------
-- Company: UOA 
-- Engineer: C TZERANIS
-- 
-- Create Date:    23:20:10 09/28/2012 
-- Design Name: 
-- Module Name:    Toplevel - Behavioral 
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

entity Toplevel is 
              Port(
				       RESET   : in std_logic;
						 CLK     : in std_logic;
						 TEST_SEL: in std_logic_vector(1 downto 0);
					    IR      : out std_logic_vector(31 downto 0);
						 PC      : out std_logic_vector(31 downto 0);
						 MDR_in  : out std_logic_vector(31 downto 0);
						 MAR     : out std_logic_vector(31 downto 0);
						 W       : out std_logic_vector(31 downto 0);  
						 ALUout  : out std_logic_vector(31 downto 0);
						 TEST_OUT: out std_logic_vector(63 downto 0);
						 ZERO    : out std_logic
						); 
end Toplevel;

architecture Behavioral of Toplevel is
----------------------------------------------------------------------------
component BUS32_aux is
             Port ( 
	                BIN   : in   std_logic_vector (31 downto 0);
			          BOUT  : out  std_logic_vector (31 downto 0)
				      );
end component;
----------------------------------------------------------------------------
component CNTR_comb is 
	          Port ( 
			          OPCODE      : in STD_LOGIC_VECTOR (5 downto 0);
	                FUNCT       : in STD_LOGIC_VECTOR (5 downto 0);
	                SorZ        : out STD_LOGIC;
	                BorI        : out STD_LOGIC;
	                ALUop       : out STD_LOGIC_VECTOR (3 downto 0);
	                DMorALU     : out STD_LOGIC_VECTOR (1 downto 0);
	                Link        : out STD_LOGIC;
	                RorI        : out STD_LOGIC;
	                Branch      : out STD_LOGIC;
					    NeorEQ      : out STD_LOGIC;
			          sv          : out STD_LOGIC;
					    LUI         : out STD_LOGIC;
	                Jump        : out STD_LOGIC;
				       Lo_enable   : out STD_LOGIC;
					    Hi_enable   : out STD_LOGIC;
				       toLo_enable : out STD_LOGIC;
				       toHi_enable : out STD_LOGIC
			         );
end component;
----------------------------------------------------------------------------
component CNTR_Fsm is
		       Port (
						 OPCODE     : in STD_LOGIC_VECTOR (5 downto 0);
						 FUNCT      : in STD_LOGIC_VECTOR (5 downto 0);
						 RESET      : in STD_LOGIC;
						 CLK        : in STD_LOGIC;
						stall_signal: in STD_LOGIC;
						 PC_write   : out STD_LOGIC;
						 IR_write   : out STD_LOGIC;
					    MAR_write  : out STD_LOGIC;
					    DMEM_write : out STD_LOGIC_VECTOR (3 downto 0);
						 RF_write   : out STD_LOGIC
						);
end component;
----------------------------------------------------------------------------
component datapath is 
              Port (
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
						  LUI	   	: in	std_logic;
						  BorI      : in std_logic;
						  MAR_write : in std_logic;
						  JUMP      : in std_logic;
						  Branch    : in std_logic;
						  NEorEQ    : in std_logic;
						  Lo_enable : in STD_LOGIC;
					     Hi_enable : in STD_LOGIC;
				        toLo_enable : in STD_LOGIC;
				        toHi_enable : in STD_LOGIC;
						  DMorALU   : in std_logic_vector (1 downto 0);
						  Link      : in std_logic;
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
end component;
----------------------------------------------------------------------------
component dmem is 
              Port (
	                 clk     : in std_logic;
	                 we      : in std_logic_vector(3 downto 0); 
	                 en      : in std_logic_vector(3 downto 0);
	                 ssr     : in std_logic_vector(3 downto 0);
	                 address : in std_logic_vector(10 downto 0); 
	                 data_in : in std_logic_vector(31 downto 0);
	                 data_out: out std_logic_vector(31 downto 0)
						);
end component;
----------------------------------------------------------------------------
component IMEM is
             Port ( 
				       clk      : in std_logic;
	                en       : in std_logic;
	                address  : in std_logic_vector(10 downto 0); 
	                data_out : out std_logic_vector(31 downto 0)
				     );
end component;
--======================== Internal Signals ===============================--
   signal w_CLK 			: std_logic; 
	signal w_Reset			: std_logic;
	signal w_OPCONE      : std_logic_vector (5 downto 0) := (others => '0');
	signal w_FUNCT       : std_logic_vector (5 downto 0) := (others => '0');
	signal w_SorZ        : std_logic;
   signal w_BorI	      : std_logic;                                       
	signal w_sv          : std_logic;                                        
	signal w_DMorALU		: std_logic_vector (1 downto 0) := (others => '0');
	signal w_Link 			: std_logic;                                       
	signal w_RorI			: std_logic;
	signal w_Branch		: std_logic;
	signal w_LUI         : std_logic;
	signal w_NEorEQ		: std_logic;                                       
	signal w_Jump			: std_logic;                                       
	signal w_ALUop       : std_logic_vector (3 downto 0) := (others => '0');
	signal w_PCwrite		: std_logic;                                       
	signal w_IRwrite		: std_logic;                                       
	signal w_MARwrite		: std_logic;                                       
	signal w_DEMwrite    : std_logic_vector (3 downto 0) := (others => '0');                                       --
	signal w_RFwrite		: std_logic;  
   signal w_stall       : std_logic;	
	signal w_BUS_PC      : std_logic_vector (31 downto 0) := (others => '0');
	signal w_BUS_MDRin	: std_logic_vector (31 downto 0) := (others => '0');
	signal w_BUS_MAR		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_ALUout		: std_logic_vector (31 downto 0) := (others => '0');
	signal w_BUS_MDRout  : std_logic_vector (31 downto 0) := (others => '0');
	signal w_BUS_IRin    : std_logic_vector (31 downto 0) := (others => '0');
	signal w_AUXout_1    : std_logic_vector (31 downto 0) := (others => '0');
	signal w_AUXout_2    : std_logic_vector (31 downto 0) := (others => '0');
	signal w_AUXout_3    : std_logic_vector (31 downto 0) := (others => '0');
	signal w_AUXout_4    : std_logic_vector (31 downto 0) := (others => '0');
   signal w_Lo_enable   : STD_LOGIC;
	signal w_Hi_enable   : STD_LOGIC;
	signal w_toLo_enable : STD_LOGIC;
   signal w_toHi_enable : STD_LOGIC;
--============================ Wiring ====================================--

begin
     w_CLK   <= CLK ;
	  w_Reset <= Reset;
	  ALUout  <= w_ALUout;
	  
	  IR_aux1: BUS32_aux port map ( 
	                               BIN  => w_BUS_IRin,
			                         BOUT => IR
											 );
	  PC_aux2: BUS32_aux port map ( 
	                               BIN  => w_BUS_PC,
			                         BOUT => PC
										    );
	  MDRin_aux3: BUS32_aux port map ( 
	                                  BIN  => w_BUS_MDRin,
			                            BOUT => MDR_in
												 );                               
	  MAR_aux4: BUS32_aux port map ( 
	                                BIN  => w_BUS_MAR,
			                          BOUT => MAR
											  );               
	  Comp_Control: CNTR_comb port map ( 
			                              OPCODE      => w_OPCONE,
	                                    FUNCT       => w_FUNCT,
	                                    SorZ        => w_SorZ,
	                                    BorI        => w_BorI,
	                                    ALUop       => w_ALUop,
	                                    DMorALU     => w_DMorALU,
	                                    Link        => w_Link,
	                                    RorI        => w_RorI,
	                                    Branch      => w_Branch,
			                              sv          => w_sv,
	                                    Jump        => w_Jump,
													LUI         => w_LUI,
													NeorEQ      => w_NEorEQ,
												   Lo_enable   => w_Lo_enable,
					                        Hi_enable   => w_Hi_enable,
				                           toLo_enable => w_toLo_enable,
				                           toHi_enable => w_toHi_enable
			                              );
		 FSM_Control: CNTR_Fsm port map (
													OPCODE     => w_OPCONE,
													FUNCT      => w_FUNCT,
													RESET      => w_Reset,
													CLK        => w_CLK,
													PC_write   => w_PCwrite,
													IR_write   => w_IRwrite,
													MAR_write  => w_MARwrite,
													DMEM_write => w_DEMwrite,
												stall_signal  => w_stall,
													RF_write   => w_RFwrite
													);
									
	datapath_module: datapath port map (
	                                    LUI		   => w_LUI,
													PC_write    => w_PCwrite,
													CLK         => w_CLK,
													Reset       => w_Reset,
													Bus_IR      => w_BUS_IRin,
													IR_write    => w_IRwrite,
													RorI        => w_RorI,
													RF_write    => w_RFwrite,
													SorZ        => w_SorZ,
													ALUop       => w_ALUop,
													sv          => w_sv,
													BorI        => w_BorI,
													MAR_write   => w_MARwrite,
													JUMP        => w_Jump,
													Branch      => w_Branch,
													NEorEQ      => w_NEorEQ,
													DMorALU     => w_DMorALU, 
													Link        => w_link,
						                     test_sel    => TEST_SEL,
													Bus_MDRout  => w_BUS_MDRout,
													BUS_Wout    => W,
													BUS_MDRin   => w_BUS_MDRin,
													BUS_MAR     => w_BUS_MAR,
													ALUout      => w_ALUout,
													Z           => ZERO,
													Lo_enable   => w_Lo_enable,
													Hi_enable   => w_Hi_enable,
												   toLo_enable => w_toLo_enable,
												   toHi_enable => w_toHi_enable,
													OPCODE      => w_OPCONE,
													FUNC        => w_FUNCT,
													Bus_PC      => w_BUS_PC,
													stall_out   => w_stall,
													test_out    => TEST_OUT
											     );	
  DATAMEMORY : DMEM port map 
                             (
                              data_in   => w_BUS_MDRin,
	                           address   => w_BUS_MAR(10 downto 0),
                              we        => w_DEMwrite,
									   clk       => w_CLK,
									   en        => "1111",
									   ssr       => "0000",
							         data_out  => w_BUS_MDRout
										);
	
 INSTRUCTIONMEMORY: IMEM port map (
                                   clk      => w_CLK,
	                                en       => '1' ,
	                                address  => w_BUS_PC (12 downto 2), 
	                                data_out => w_BUS_IRin 
                                   );
end Behavioral;