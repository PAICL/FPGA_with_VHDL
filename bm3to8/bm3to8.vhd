library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bm3to8 is
    port(
        G1, G2, G3: in STD_LOGIC;
        A2, A1, A0: in STD_LOGIC;
        Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0: out STD_LOGIC
    );
end bm3to8;

architecture Behavioral of bm3to8 is
    signal addr: STD_LOGIC_VECTOR(2 downto 0);
    signal output_signal: STD_LOGIC_VECTOR(7 downto 0); -- 新增信号
begin
    addr <= A2 & A1 & A0;  -- 合并信号为单一向量

    process(G1, G2, G3, addr)
    begin
        if (G1 = '1' and G2 = '0' and G3 = '0') then
            case addr is
                when "000" => output_signal <= "01111111";
                when "001" => output_signal <= "10111111";
                when "010" => output_signal <= "11011111";
                when "011" => output_signal <= "11101111";
                when "100" => output_signal <= "11110111";
                when "101" => output_signal <= "11111011";
                when "110" => output_signal <= "11111101";
                when "111" => output_signal <= "11111110";
                when others => output_signal <= "11111111";
            end case;
        else
            output_signal <= "11111111";
        end if;
        
        -- 将输出信号赋值给输出端口
        Y7 <= output_signal(7);
        Y6 <= output_signal(6);
        Y5 <= output_signal(5);
        Y4 <= output_signal(4);
        Y3 <= output_signal(3);
        Y2 <= output_signal(2);
        Y1 <= output_signal(1);
        Y0 <= output_signal(0);
    end process;
end Behavioral;
