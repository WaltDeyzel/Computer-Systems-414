-- File counter_sim.vhd
-- Entities of simulation environments are frequently black boxes without
-- ports.

library ieee;
use ieee.std_logic_1164.all;

entity counter_sim is
end entity counter_sim;

architecture sim of counter_sim is

--component counter
-- port (val : out std_logic_vector (3 downto 0);
--       ck : std_logic;
--       rst : std_logic);
--end component;
   
--   Specifies which entity is bound with the component.
-- for counter_0: counter use entity work.counter;
 signal ck, rst :std_logic;
 signal val : std_logic_vector(3 downto 0);

begin

  -- Instantiation of the DUT
  counter_0: entity work.counter
  port map(
    ck  => ck,
    rst => rst,
    val => val
  );

  -- A clock generating process with a 2ns clock period. The process
  -- being an infinite loop, the clock will never stop toggling.
  process
  begin
    ck <= '0';
    wait for 1 ns;
    ck <= '1';
    wait for 1 ns;
  end process;

  -- The process that handles the reset: active from beginning of
  -- simulation until the 5th rising edge of the clock.
  process
  begin
    rst  <= '1';
    for i in 1 to 5 loop
      wait until rising_edge(ck);
    end loop;
    rst  <= '0';
    wait; -- Eternal wait. Stops the process forever.
  end process;

end architecture sim;
