-- Library declarations (always required for std_logic)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entity: one input, one output
ENTITY MY_BUFFER IS
    PORT (
        A : IN  STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END ENTITY MY_BUFFER;

-- Architecture: output simply follows input
ARCHITECTURE Dataflow OF MY_BUFFER IS
BEGIN
    Y <= A;
END ARCHITECTURE Dataflow;
