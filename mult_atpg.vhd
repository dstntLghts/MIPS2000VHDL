----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:40:21 09/26/2013 
-- Design Name: 
-- Module Name:    mult_atpg - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mult_atpg is
                   port( clock : in std_logic;
	                      reset : in std_logic;
							Out_ATPG  : out std_logic_vector(63 downto 0)
							   );
end mult_atpg;

architecture Behavioral of mult_atpg is

component rom
    port (
	       address  : in std_logic_vector (6 downto 0) ;
          data : out std_logic_vector( 63 downto 0 )
			 );
end component;

component atpg_counter
	  port( clock : in std_logic;
			  reset : in std_logic;
				 add : out std_logic_vector (6 downto 0)
			 );										 
end component;

signal add_signal : std_logic_vector(6 downto 0);


begin 

ADDRSS : atpg_counter port map
                       ( 
                       clock => clock,
							  reset => reset,
							  add   => add_signal
							  );
DATA : rom port map(
	               address => add_signal,
					      data => Out_ATPG
					    );
    
end Behavioral;