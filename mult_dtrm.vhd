library IEEE;
USE ieee.std_logic_1164.ALL;
USE IEEE.std_logic_arith.all;

entity mult_dtrm is		
    port (clock_top : in std_logic;
	       clear_top : in std_logic;	       		
          Out_dtrm  : out std_logic_vector(63 downto 0)	
	      );
end mult_dtrm;      

architecture Stractural of mult_dtrm is

component counter 
  generic(n: positive :=8);
  port(	clock:	in std_logic;
	      clear:	in std_logic;
	      count:	in std_logic;
	          Q:	out std_logic_vector(n-1 downto 0)
      );
end component;

Signal Q_signal  : std_logic_vector(7 downto 0);
Signal QA_signal : std_logic_vector(31 downto 0);
Signal QB_signal : std_logic_vector(31 downto 0);

begin

u1: counter port map ( clock=>clock_top,
                       clear=>clear_top,
							  count=>'1',
							  Q=>Q_signal
							 );
							 
QA_signal <= Q_signal(7 downto 4) & Q_signal(7 downto 4) & Q_signal(7 downto 4) & Q_signal(7 downto 4)
			  & Q_signal(7 downto 4) & Q_signal(7 downto 4) & Q_signal(7 downto 4) & Q_signal(7 downto 4);
QB_signal <= Q_signal(3 downto 0) & Q_signal(3 downto 0) & Q_signal(3 downto 0) & Q_signal(3 downto 0) 
           & Q_signal(3 downto 0) & Q_signal(3 downto 0) & Q_signal(3 downto 0) & Q_signal(3 downto 0);
							 
Out_dtrm(31 downto 0) <= QA_signal;
Out_dtrm(63 downto 32) <= QB_signal;

end Stractural;

