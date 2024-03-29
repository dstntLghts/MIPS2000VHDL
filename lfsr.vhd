library IEEE;
use IEEE.std_logic_1164.all;

entity lfsr is
port (
  clock    : in std_logic;
  reset    : in std_logic;
  seed     : in std_logic_vector(63 downto 0);
  data_out : out std_logic_vector(63 downto 0)
);
end lfsr;

architecture modular of lfsr is

  signal lfsr_reg : std_logic_vector(63 downto 0);

begin

  process (clock)
    variable lfsr_tap : std_logic;
  begin
    if clock'EVENT and clock='1' then
      if reset = '1' then
        lfsr_reg <= seed;
      else
        lfsr_tap := lfsr_reg(0) xor lfsr_reg(1) xor lfsr_reg(3) xor lfsr_reg(4);
        lfsr_reg <= lfsr_reg(62 downto 0) & lfsr_tap;
      end if;
    end if;
  end process;
  
  data_out <= lfsr_reg;
  
end modular;


