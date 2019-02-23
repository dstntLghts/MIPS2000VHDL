----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C. Tzeranis
-- 
-- Create Date:    18:19:02 09/24/2013 
-- Design Name: 
-- Module Name:    DFT_Mult - Behavioral 
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
USE ieee.std_logic_1164.ALL;
USE IEEE.std_logic_arith.all;

entity DFT_Mult is		
    port (clk : in std_logic;
	       reset : in std_logic;	       
	       sel   : in std_logic_vector(1 DOWNTO 0);
	       X_top : in std_logic_vector(31 DOWNTO 0);
          Y_top : in std_logic_vector(31 DOWNTO 0);
			 stall : out std_logic;
			 PorF  : out std_logic_vector(63 downto 0);
          P_top : out std_logic_vector(63 downto 0)	
	       );
end DFT_Mult;      


architecture Stractural of DFT_Mult is

component mult_32x32
  PORT(
       X :IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       Y :IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       P :OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
      );
end component;

component mux_4to1_x64 is
		 Port ( In0 : in  STD_LOGIC_VECTOR (63 downto 0);
				  In1 : in  STD_LOGIC_VECTOR (63 downto 0);
				  In2 : in  STD_LOGIC_VECTOR (63 downto 0);
				  In3 : in  STD_LOGIC_VECTOR (63 downto 0);
				  Sel : in  STD_LOGIC_VECTOR (1 downto 0);
				  Outp : out  STD_LOGIC_VECTOR (63 downto 0)
				  );
end component;

component mult_lfsr is		
    port (clock_top : in std_logic;
	       reset_top : in std_logic;
           Out_LFSR : out std_logic_vector(63 downto 0)
	     );
end component;  

component mult_dtrm is		
    port (clock_top : in std_logic;
	       clear_top : in std_logic;	       		
          Out_dtrm  : out std_logic_vector(63 downto 0)	
	      );
end component;      

component mult_atpg is
	 port( clock : in std_logic;
			 reset : in std_logic;
		Out_ATPG  : out std_logic_vector(63 downto 0)
		  );
end component;

component misr is 
port ( clock     : in std_logic;
       reset     : in std_logic;
       data_in   : in std_logic_vector(63 downto 0);
       signature : out std_logic_vector(63 downto 0)
      );
end component;

signal XY_signal     : std_logic_vector(63 downto 0);
signal lfsr_signal   : std_logic_vector(63 downto 0);
signal dtrm_signal   : std_logic_vector(63 downto 0);
signal atpg_signal   : std_logic_vector(63 downto 0);
signal muxout_signal : std_logic_vector(63 downto 0);
signal multout_signal: std_logic_vector(63 downto 0);

begin
stall <= sel(1) OR sel (0) ;
P_top <= multout_signal;
XY_signal(31 downto 0) <= X_top;
XY_signal(63 downto 32) <= Y_top;

LFSR : mult_lfsr port map( 
                          clock_top => clk,
								  reset_top => reset,
								  Out_LFSR => lfsr_signal
								  );
								  
DTRM : mult_dtrm port map (
                          clock_top =>clk,
                          clear_top =>reset,
                          Out_dtrm => dtrm_signal
                          );	
								  
ATPG :  mult_atpg port map(
                           clock => clk,
	                        reset => reset,
							  Out_ATPG  => atpg_signal
							     );	
								  
MUX : mux_4to1_x64 port map(
                            In0 => XY_signal,
				                In1 => lfsr_signal,
				                In2 => dtrm_signal,
				                In3 => atpg_signal,
				                Sel => sel,
				                Outp => muxout_signal
								    );

MULTI : mult_32x32 port map(
                            X => muxout_signal(31 downto 0),
                            Y => muxout_signal(63 downto 32),
                            P => multout_signal
                            );		
							 
MSR : misr port map (
                      clock   => clk,
                      reset   => reset,
                     data_in  => multout_signal,
                    signature => PorF
                      );
							 
end Stractural;