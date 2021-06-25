     library ieee;
     use ieee.std_logic_1164.all;
     
     entity counter is
        port (val : out std_logic_vector (3 downto 0);
			     dir : std_logic;
              ck : std_logic;
              rst : std_logic);
     end counter;
     
     library ieee;
     use ieee.numeric_std.all;
     
     architecture good of counter
     is
        signal v : unsigned (3 downto 0);
     begin
        process (ck, rst)
        begin
		if dir = '1' then
          if rst = '1' then
             v <= "1111";
          elsif rising_edge (ck) then
             if v = "0000" then
                v <= "1111"; 
             else
                v <= v - 1;
             end if;
          end if;
		elsif dir = '0' then
		       if rst = '1' then
             v <= x"0";
          elsif rising_edge (ck) then
             if v = "1111" then
                v <= x"0";
             else
                v <= v + 1;
             end if;
          end if;
		 end if;
        end process;
     
        val <= std_logic_vector (v);
     end good;

 