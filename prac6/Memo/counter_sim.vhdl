-- File counter_sim.vhd
-- Entities of simulation environments are frequently black boxes without
-- ports.

library ieee;
use ieee.std_logic_1164.all;

entity counter_sim is
end entity counter_sim;

architecture sim of counter_sim is

 signal clk, reset :std_logic;
 signal value : std_logic_vector(3 downto 0);

begin

  -- Instantiation of the DUT
  counter_0: entity work.counter
  port map(
    ck  => clk,
    rst => reset,
    val => value
  );

  -- A clock generating process with a 2ns clock period. The process
  -- being an infinite loop, the clock will never stop toggling.
  process
  begin
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
    wait for 1 ns;
  end process;

  -- The process that handles the reset: active from beginning of
  -- simulation until the 5th rising edge of the clock.
  process
  begin
    reset  <= '1';
    for i in 1 to 5 loop
      wait until rising_edge(clk);
    end loop;
    reset  <= '0';
    wait; -- Eternal wait. Stops the process forever.
  end process;

end architecture sim;
