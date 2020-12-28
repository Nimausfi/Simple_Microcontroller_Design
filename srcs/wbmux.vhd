library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity wbmux is

port(
		load:             in std_logic;
		write_data:		   in signed(31 downto 0);
		load_data:		   in signed(31 downto 0);
		
		reg_data:		   out signed(31 downto 0)
); 

end wbmux;


architecture Behavioral of wbmux is

begin

 process(load,write_data,load_data)
 begin
    if(load='1') then
	   reg_data <= load_data;
	 else
	   reg_data <= write_data;
	 end if;
 end process;

end Behavioral;

