LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gameblock is
    port(start, reset, clk: IN std_logic;
    -- Game buttons 0-3; start 4 and reset 5
    BUTTON : IN STD_LOGIC_VECTOR(0 TO 5);  
    winner : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
end gameblock;
architecture structure of gameblock is
    type states is (A, B, C, D, E, F);
    signal current: states := A;
begin
    process(clk)
    begin
        if clk 'EVENT' and clk ='1' then
            case current is
                -- Game buttons 0-3; start 4 and reset 5
                when A=> if buttons(4)='1' then current <= B;
                    elsif buttons(5) = '1' then current <= A;
                
                when B=> if buttons(0)='1' then current <= C;
                    elsif buttons(1) = '1' then current <= D;
                    elsif buttons(2) = '1' then current <= E;
                    elsif buttons(3) = '1' then current <= F;

                when C=> if buttons(5)='1' then current <= A;
                when D=> if buttons(5)='1' then current <= A;
                when E=> if buttons(5)='1' then current <= A;
                when F=> if buttons(5)='1' then current <= A;
            end case;
            end if;
    end process;
    winner(0) <= '1' when current = C else '0';
    winner(1) <= '1' when current = D else '0';
    winner(2) <= '1' when current = E else '0';
    winner(3) <= '1' when current = F else '0';
 end structure

