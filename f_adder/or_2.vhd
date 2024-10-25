LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY or_2a IS
    PORT(
        a, b: IN STD_LOGIC;
        y: OUT STD_LOGIC
    );
END ENTITY or_2a;

ARCHITECTURE behav OF or_2a IS
BEGIN
    y <= a OR b;
END ARCHITECTURE behav;
