LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL; -- Removed extra spaces for standard compliance

-- Testbench has NO ports
ENTITY BUFFER_TB IS
END ENTITY BUFFER_TB;

ARCHITECTURE Simulation OF BUFFER_TB IS
    -- Signals to connect to the DUT
    SIGNAL tb_A : STD_LOGIC := '0';
    SIGNAL tb_Y : STD_LOGIC;
BEGIN
    -- Instantiate (connect) the Design Under Test (DUT)
    -- Ensure MY_BUFFER is compiled into the 'work' library first
    DUT : ENTITY work.MY_BUFFER
        PORT MAP(
            A => tb_A,
            Y => tb_Y
        );

    -- Stimulus process: toggle the input
    STIMULUS : PROCESS
    BEGIN
        tb_A <= '0';
        WAIT FOR 10 ns; 
        
        tb_A <= '1';
        WAIT FOR 10 ns; 
        
        tb_A <= '0';
        WAIT FOR 10 ns; 
        
        WAIT; -- Stops the process from looping forever
    END PROCESS STIMULUS;
END ARCHITECTURE Simulation;