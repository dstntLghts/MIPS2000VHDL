library IEEE;
USE ieee.std_logic_1164.ALL;
USE IEEE.std_logic_arith.all;

entity mult_lfsr is		
    port (clock_top : in std_logic;
	       reset_top : in std_logic;
          Out_LFSR  : out std_logic_vector(63 downto 0)
	     );
end mult_lfsr;      


architecture Stractural of mult_lfsr is

component LFSR
  port 	( clock: in std_logic;
	        reset: in std_logic;
	         seed: in std_logic_vector(63 downto 0);
	     data_out: out std_logic_vector(63 downto 0)
	       );
end component;

Signal data_out_signal : std_logic_vector(63 downto 0);

begin

u1: lfsr port map (clock=>clock_top,
                   reset=>reset_top,
						 seed=> x"0123045607890ABC",
						 data_out=>data_out_signal
						 );
				 
Out_LFSR <= data_out_signal;
 
end Stractural;  

