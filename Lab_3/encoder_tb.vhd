library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ENCODER_TB is
end entity ENCODER_TB;

architecture Simulation of ENCODER_TB is
    signal I : std_logic_vector(3 downto 0) := "0000";
    signal Y : std_logic_vector(1 downto 0);
    signal V : std_logic;
begin

    DUT : entity work.ENCODER_4TO2 
        port map ( 
            I => I, 
            Y => Y, 
            V => V
        );

    STIMULUS : process
    begin
        I <= "0001"; wait for 10 ns; -- I0 active -> Y=00
        I <= "0010"; wait for 10 ns; -- I1 active -> Y=01
        I <= "0100"; wait for 10 ns; -- I2 active -> Y=10
        I <= "1000"; wait for 10 ns; -- I3 active -> Y=11
        I <= "1010"; wait for 10 ns; -- I3 and I1 -> Y=11 (priority)
        I <= "0000"; wait for 10 ns; -- No input -> V=0
        wait;
    end process;

end architecture Simulation;
