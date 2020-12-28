library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity link_register is
port (clk, reset, en	: in std_logic;
	D		: in signed(31 downto 0);
	Q		: out signed(31 downto 0));
	
end link_register;


architecture Behavioral of link_register is

signal Q_int : signed(31 downto 0) := (others => '0');

begin
process (clk, reset, en)
begin
if (reset='1') then
Q_int <= (x"00000000");     --CPU registers
elsif (rising_edge(clk) and en = '1') then
Q_int  <= D ;

end if ;
end process;

end Behavioral;

