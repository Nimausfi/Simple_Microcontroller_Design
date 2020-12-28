library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity alumuxes is

port(
		use_imm:          in std_logic;
                load:             in std_logic;
		store:            in std_logic;
		alu_out:          in signed(63 downto 0);
		load_data:        in signed(31 downto 0);
                inst_out:         in signed(31 downto 0);
		
		dmem_addr:        out signed(31 downto 0);
		reg_data:         out signed(31 downto 0)  --Output from MUX
		
); 
end alumuxes;

architecture behv of alumuxes is
   
  signal write_data: signed(31 downto 0) := (others => '0');

begin
  
  --DEMUX for ALU output
  aludemux : entity work.aludemux port map(use_imm,load,store,inst_out,alu_out,dmem_addr,write_data);
   
  --MUX for register file
  wbmux : entity work.wbmux port map(load,write_data,load_data,reg_data);

end behv;

