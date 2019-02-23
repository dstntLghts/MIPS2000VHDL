----------------------------------------------------------------------------------
-- Company: UOA
-- Engineer: C TZERANIS
-- 
-- Create Date:    18:39:43 09/23/2012 
-- Design Name: 
-- Module Name:    SHIFT - Behavioral 
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
use IEEE.numeric_std.all;

	entity SHIFT is
		port(		
					INa   		: in  std_logic_vector (31 downto 0);
					INb	      : in  std_logic_vector (31 downto 0);
					sft         : in  std_logic_vector (4 downto 0);
					R_L      	: in  std_logic_vector (1 downto 0) ;
					sv  			: in  std_logic;
					lui			: in std_logic;
					OUTa			: out std_logic_vector (31 downto 0)
			  );
	end SHIFT;
	architecture Behavioral of SHIFT is
	begin
		process( INb,INa, sft, sv,lui,R_L)
		variable Sh_am : natural range 0 to 31;
		variable InpS : signed (0 to 31);
		variable InpU : unsigned (0 to 31);
		variable Bus_ALSB: std_logic_vector (4 downto 0);
		variable lui_en : std_logic_vector (4 downto 0 ) := "10000";
		
			begin
				Bus_ALSB(4 downto 0 ) := INa (4 downto 0);
				if  (lui = '1') then 
					Sh_am := to_INTEGER (unsigned(lui_en));
				elsif (lui = '0') then
					if sv = '0' then 
						Sh_am := to_INTEGER (unsigned(sft));
					else 
						Sh_am := to_integer (unsigned(Bus_ALSB));
					end if ;
				end if ;
				InpS 	:= signed (INb);
				InpU 	:= unsigned (INb);
				
				case R_L is 
				when "00" => OUTa <=  std_logic_vector (SHIFT_LEFT (InpU, Sh_am)); --sll 
				when "01" => OUTa <=  INb;
				when "10" => OUTa <=  std_logic_vector (SHIFT_RIGHT(InpU, Sh_am)); --srl	
				when "11" => OUTa <=  std_logic_vector(SHIFT_RIGHT (InpS, Sh_am)); --sra
				when others => OUTa <= x"00000000";
				end case;
		end process;
end Behavioral;

