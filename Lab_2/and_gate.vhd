library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_GATE is
    port (
        A : in  std_logic;
        B : in  std_logic;
        Y : out std_logic
    );
end entity AND_GATE;

architecture Dataflow of AND_GATE is
begin
    Y <= A and B;
end architecture Dataflow;
