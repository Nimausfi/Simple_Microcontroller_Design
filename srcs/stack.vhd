library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity stack is
port (clk, reset, en	: in std_logic;
	D		: in signed(127 downto 0);
	Q		: out signed(127 downto 0));
	
end stack;


architecture Behavioral of stack is

signal Q_int : signed(127 downto 0) := (others => '0');


begin
process (clk, reset, en)
begin
if (reset='1') then
Q_int <= (x"00000000000000000000000000000000");     --CPU registers
elsif (rising_edge(clk) and en = '1') then

Q_int   (31 downto 0)    <= D  (31 downto 0)   ;
Q_int   (63 downto 32)   <= D  (63 downto 32)  ;  
Q_int   (95 downto 64)   <= D  (95 downto 64)  ; 
Q_int   (127 downto 96)  <= D  (127 downto 96) ;  

end if ;
end process;

end Behavioral;

