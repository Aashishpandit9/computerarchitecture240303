library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_GATE is
    port (
        A : in  std_logic;
        B : in  std_logic;
        Y : out std_logic
    );
end entity XOR_GATE;

architecture Dataflow of XOR_GATE is
begin
    Y <= A xor B;
end architecture Dataflow;
