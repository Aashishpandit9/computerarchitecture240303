library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_GATE is
    port (
        A : in  std_logic;
        B : in  std_logic;
        Y : out std_logic
    );
end entity OR_GATE;

architecture Dataflow of OR_GATE is
begin
    Y <= A or B;
end architecture Dataflow;
