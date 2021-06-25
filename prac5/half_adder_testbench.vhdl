-- Testbench for half_adder
library IEEE;
use IEEE.std_logic_1164.all;
entity half_adder_testbench is
-- empty
end half_adder_testbench; 
architecture tb of half_adder_testbench is
-- DUT component
component half_adder is
        port(
            a,b:in std_ulogic; 
            sum,carry:out std_ulogic
        ); 
end component;

signal a_in, b_in, sum_out, carry_out: std_logic;

begin
 -- Connect DUT
 ha: half_adder port map(a => a_in, b => b_in, sum => sum_out, carry 
=> carry_out);
 process
 begin
 a_in <= '0';
 b_in <= '0';
 wait for 1 ns;
 assert(sum_out='0') report "Fail 0/0" severity error;
 
 a_in <= '0';
 b_in <= '1';
 wait for 1 ns;
 assert(sum_out='1') report "Fail 0/1" severity error;
 a_in <= '1';
 b_in <= 'X';
 wait for 1 ns;
 assert(sum_out='X') report "Fail 1/X" severity error;
 a_in <= '1';
 b_in <= '1';
 wait for 1 ns;
 assert(sum_out='0') report "Fail 1/1" severity error;
 
 -- Clear inputs
 a_in <= '0';
 b_in <= '0';
 assert false report "Test done." severity note;
 wait;
 end process;
end tb;

