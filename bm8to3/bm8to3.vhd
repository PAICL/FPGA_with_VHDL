library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bm8to3 is
    port(
        a: in STD_LOGIC_VECTOR(7 downto 0);
        b: out STD_LOGIC_VECTOR(2 downto 0)
    );
end bm8to3;

architecture Behavioral of bm8to3 is
begin
    process(a)
    begin
        case a is
            when "00000001" => b <= "000";
            when "00000010" => b <= "001";
            when "00000100" => b <= "010";
            when "00001000" => b <= "011";
            when "00010000" => b <= "100";
            when "00100000" => b <= "101";
            when "01000000" => b <= "110";
            when "10000000" => b <= "111";
            when others => b <= "000"; 
        end case;
    end process;
end Behavioral;
