library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter is
    Port (
        R       : in  STD_LOGIC;        -- 复位信号，低电平有效
        CLK     : in  STD_LOGIC;        -- 时钟信号
        load    : in  STD_LOGIC;        -- 预置信号
        up_down : in  STD_LOGIC;        -- 加/减控制信号 (1: 加, 0: 减)
        data_in : in  STD_LOGIC_VECTOR (3 downto 0); -- 输入预置数据
        Q       : out STD_LOGIC_VECTOR (3 downto 0); -- 输出计数值
        C       : out STD_LOGIC          -- 进位/借位输出信号
    );
end Counter;

architecture Behavioral of Counter is
    signal count : STD_LOGIC_VECTOR (3 downto 0) := "0000"; -- 4位计数器寄存器
begin
    process (R, CLK)
    begin
        if (R = '0') then           -- 复位信号低电平有效，置零
            count <= "0000";
        elsif rising_edge(CLK) then -- 在时钟上升沿处理
            if (load = '0') then    -- load信号低电平时加载数据
                count <= data_in;
            elsif (up_down = '1') then -- 加计数
                count <= count + 1;
            else                      -- 减计数
                count <= count - 1;
            end if;
        end if;
    end process;
    
    Q <= count; -- 输出当前计数值
    C <= '1' when (count = "1111" and up_down = '1') else  -- 满位时输出进位信号
         '1' when (count = "0000" and up_down = '0') else  -- 借位时输出信号
         '0'; 
end Behavioral;
