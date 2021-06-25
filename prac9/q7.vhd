LIBRARY ieee;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY vraag3 IS
    PORT( clk : IN STD_LOGIC;
    slow_clock : OUT STD_LOGIC );
END vraag3;

ARCHITECTURE logic OF vrg3 IS
    --constant divider : integer range 0 to 255 := 55;
    Integer div:
    constant divider : div := 55;
    VARIABLE counter : integer range 0 to 255;
    signal slow_clock := '0';
BEGIN
    PROCESS( clk )
    BEGIN
        IF rising_edge(clk) then
            IF counter = divider THEN
                slow_clock <= not slow_clock;
            ELSE
                counter := counter + 1;
            end if;
        END IF;
    END process;
END logic;