library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOR_GATE is
    port (
        A : in  std_logic;
        B : in  std_logic;
        Y : out std_logic
    );
end entity NOR_GATE;

architecture Dataflow of NOR_GATE is
begin
    Y <= A nor B;
end architecture Dataflow;
