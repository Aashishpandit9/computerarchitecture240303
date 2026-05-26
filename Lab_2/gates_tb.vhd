library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GATES_TB is
end entity GATES_TB;

architecture Simulation of GATES_TB is
    -- Signals
    signal A, B                                  : std_logic := '0';
    signal Y_AND, Y_OR                           : std_logic;
    signal Y_NAND, Y_NOR, Y_XOR, Y_XNOR          : std_logic;
    signal Y_NOT                                 : std_logic;
begin

    -- Device Under Test (DUT) Instantiations
    U1 : entity work.AND_GATE  port map (A => A, B => B, Y => Y_AND);
    U2 : entity work.OR_GATE   port map (A => A, B => B, Y => Y_OR);
    U3 : entity work.NOT_GATE  port map (A => A, Y => Y_NOT);
    U4 : entity work.NAND_GATE port map (A => A, B => B, Y => Y_NAND);
    U5 : entity work.NOR_GATE  port map (A => A, B => B, Y => Y_NOR);
    U6 : entity work.XOR_GATE  port map (A => A, B => B, Y => Y_XOR);
    U7 : entity work.XNOR_GATE port map (A => A, B => B, Y => Y_XNOR);

    -- Stimulus Process
    STIMULUS : process
    begin
        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;
        wait;
    end process;

end architecture Simulation;
