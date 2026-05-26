library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_GATE is
    port (
        A : in  std_logic;
        B : in  std_logic;
        Y : out std_logic
    );
end entity NAND_GATE;

architecture Dataflow of NAND_GATE is
begin
    Y <= A nand B;
end architecture Dataflow;
