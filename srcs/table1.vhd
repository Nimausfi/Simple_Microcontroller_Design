library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity table1 is

port(
       inst:	    in signed(9 downto 0);
	   read_addr1:  out signed(1 downto 0);
       read_addr2:  out signed(1 downto 0);
       wr_addr:     out signed(1 downto 0);
       tab1_out:	out signed(9 downto 0)
);

end table1;


architecture Behavioral of table1 is

	--Table 1
	type table1 is array (15 downto 0,9 downto 0) of std_logic; --15
	
	--Table format
	--ret, call, use_imm, load, store, ALU_OP (3 bits), dmem_wr_en, reg_wren 
	--MSB                                                           LSB
	
	signal tab1 : table1 := (   "0000000000",  --1111 NOP
				                "0000000000",  --1110 NOP
			                    "0000000000",  --1101 NOP
                                "0000000000",  --1100 NOP
                                "0000000000",  --1011 NOP
                                "0000000000",  --1010 NOP
                                "0000000000",  --1001 NOP
                                "1000000000",  --1000 ---- RET
                                "0100000000",  --0111 ---- CAL
                                "0010010000",  --0110 ---- BR
                                "0000001001",  --0101 ---- SHL
                                "0000001101",  --0100 ---- SHR 
                                "0000000001",  --0011 ---- ADD
                                "0000000101",  --0010 ---- MULT
                                "0001000001",  --0001 ---- LD
                                "0000100010"); --0000 ---- ST
                                
signal tab1i : integer := 0;
signal tab1_addr : signed(4 downto 0) := (others => '0');  --Address into table 1

begin
   
   tab1_addr(3 downto 0) <= inst(3 downto 0);              --Table address based in 4 LSB inst bits
   tab1i <= to_integer(tab1_addr);                         --convert addr to integer to index into table array

	--Table 1 Address Indexing
   process(tab1_addr,tab1i, tab1)
   begin
	          tab1_out(0) <= tab1 (tab1i,0);
			  tab1_out(1) <= tab1 (tab1i,1);
			  tab1_out(2) <= tab1 (tab1i,2);
			  tab1_out(3) <= tab1 (tab1i,3);
			  tab1_out(4) <= tab1 (tab1i,4);
			  tab1_out(5) <= tab1 (tab1i,5);
			  tab1_out(6) <= tab1 (tab1i,6);
			  tab1_out(7) <= tab1 (tab1i,7);
			  tab1_out(8) <= tab1 (tab1i,8);
			  tab1_out(9) <= tab1 (tab1i,9);
   end process;	
	
	--Register file addressing 
   process(inst)
   begin
	  read_addr1 <= inst(5 downto 4);  --Rs1
	  read_addr2 <= inst(7 downto 6);  --Rs2
	  wr_addr    <= inst(9 downto 8);  --Rd
   end process;

end Behavioral;

