-- half_adder VHDL Code
Library ieee; 
use ieee.std_logic_1164.all;
 
entity half_adder is
 port(
    a,   b   : in std_ulogic; 
    sum, carry:out std_ulogic
); 
end half_adder; 
architecture data of half_adder is
begin
 sum<= a xor b; 
 carry <= a and b; 
end data;