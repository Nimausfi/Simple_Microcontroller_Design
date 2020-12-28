library IEEE ;
use IEEE.STD_LOGIC_1164.ALL ;


entity pc is

port( clk: in std_logic;
      reset: in std_logic;
	  branch: in std_logic;     --from TABLE 1
	  alu_branch: in std_logic; --from ALU OUTPUT
	  load: in std_logic;       --from TABLE 1
	  store: in std_logic;      --from TABLE 1
	  tag: in signed(4 downto 0); -- Offset
	  pc_out:	 out signed(31 downto 0);
	  call: in std_logic; -- from TABLE 1
	  ret: in std_logic; -- from TABLE 1
	  pc_from_link:	 in signed(31 downto 0)
);

end pc;


architecture Behavioral of pc is

signal pc_temp : signed(31 downto 0);


begin

  pc_out <= pc_temp;

  process (clk, reset)
  begin
   if (reset='1') then                       --reset PC to 0 on a reset
   pc_temp <= x"00000000" ;
   
   elsif(rising_edge(clk)) then
   
   if (branch = '1' and alu_branch = '1' ) then
   pc_temp (14 downto 10) <= tag ;
   end if;
   
   if (CALL = '1') then
   pc_temp (14 downto 10) <= tag ;
   end if;
    
   if (ret = '1') then
   pc_temp <= pc_from_link ;
   end if;
  
   else
   pc_temp <= pc_temp + 1 ;
  
   end if;
   end process;

  end Behavioral;
  
  
