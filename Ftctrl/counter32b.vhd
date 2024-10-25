library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter32b is
    Port ( clk     : in  STD_LOGIC;          -- 时钟信号
           reset   : in  STD_LOGIC;          -- 清零信号
           pulse_in : in  STD_LOGIC;         -- 输入脉冲
           count_out : out STD_LOGIC_VECTOR(31 downto 0));  -- 计数值
end counter32b;

architecture Behavioral of counter32b is
    signal count : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                count <= (others => '0');  -- 清零
            elsif pulse_in = '1' then
                count <= count + 1;        -- 计数
            end if;
        end if;
    end process;

    count_out <= count;

end Behavioral;