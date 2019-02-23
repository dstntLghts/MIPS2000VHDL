----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:47:58 09/23/2012 
-- Design Name: 
-- Module Name:    mux_4to1_32x - Behavioral 
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

entity mux4to1_32x is
port(      IN0    : in  std_logic_vector (31 downto 0);
           IN1    : in  std_logic_vector (31 downto 0);
           IN2    : in  std_logic_vector (31 downto 0);
           IN3    : in  std_logic_vector (31 downto 0);
           Sel    : in  std_logic_vector (1 downto 0);
           O      : out std_logic_vector (31 downto 0));
end mux4to1_32x;

 architecture structural of mux4to1_32x is
 begin
   
   process (Sel,IN0,IN1,IN2,IN3)
    begin
    case sel is 
                  when "00" => O <= IN0;
						when "01" => O <= IN1;
						when "10" => O <= IN2;
						when "11" => O <= IN3;
						when others => O <= x"00000000";
    end case;
   end process;
 end structural;
