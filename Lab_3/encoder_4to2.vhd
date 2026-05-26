library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ENCODER_4TO2 is
    port (
        I : in  std_logic_vector(3 downto 0); -- 4 inputs
        Y : out std_logic_vector(1 downto 0); -- 2-bit output
        V : out std_logic                     -- Valid: '1' if any input active
    );
end entity ENCODER_4TO2;

architecture Behavioral of ENCODER_4TO2 is
begin
    process(I)
    begin
        V <= '1';
        if I(3) = '1' then 
            Y <= "11";
        elsif I(2) = '1' then 
            Y <= "10";
        elsif I(1) = '1' then 
            Y <= "01";
        elsif I(0) = '1' then 
            Y <= "00";
        else 
            Y <= "00"; 
            V <= '0';
        end if;
    end process;
end architecture Behavioral;
