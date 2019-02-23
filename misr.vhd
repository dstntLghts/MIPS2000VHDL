library IEEE;
use IEEE.std_logic_1164.all;

entity misr is
port (
  clock    : in std_logic;
  reset    : in std_logic;
  data_in   : in std_logic_vector(63 downto 0);
  signature : out std_logic_vector(63 downto 0)
);
end misr;

architecture modular of misr is

  signal misr_reg : std_logic_vector(63 downto 0);

begin

  process (clock)
    variable misr_tap :  std_logic;
	
  begin
    if clock'EVENT and clock='1' then
      if reset = '1' then
        misr_reg <= data_in;
	   else
        misr_tap := misr_reg(0) xor misr_reg(1) xor misr_reg(3) xor misr_reg(4);
        misr_reg <= (misr_reg(62 downto 0) & misr_tap) xor data_in;
      end if;
    end if;
  end process;
  
  signature <= misr_reg;
  
end modular;


