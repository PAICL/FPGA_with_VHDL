library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ftctrl is
    Port ( clk       : in  STD_LOGIC;      -- 时钟信号
           pulse_in  : in  STD_LOGIC;      -- 输入脉冲
           gate      : out STD_LOGIC;       -- 闸门信号
           latch      : out STD_LOGIC;      -- 锁存信号
           reset     : out STD_LOGIC);      -- 清零信号
end ftctrl;

architecture Behavioral of ftctrl is
    signal count       : INTEGER := 0;
    signal gate_signal : STD_LOGIC := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if count = 0 then
                gate_signal <= '1';  -- 开启闸门
                count <= count + 1;
            elsif count < 100000000 then  -- 闸门时间为 1秒（假设时钟频率为100MHz）
                count <= count + 1;
            else
                gate_signal <= '0';  -- 关闭闸门
                latch <= '1';        -- 触发锁存
                reset <= '1';        -- 清零计数器
                count <= 0;          -- 计数器重置
            end if;
        end if;
    end process;

    gate <= gate_signal;

end Behavioral;