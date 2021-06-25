     library ieee;
     use ieee.std_logic_1164.all;
     
     --  A counter from 0 to 10.
     entity counter is
        port (val : out std_logic_vector (3 downto 0);
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
          if rst = '1' then
             v <= "1111";
          elsif rising_edge (ck) then
             if v = "0000" then
                v <= "1111";
             else
                v <= v - 1;
             end if;
          end if;
        end process;
     
        val <= std_logic_vector (v);
     end good;
