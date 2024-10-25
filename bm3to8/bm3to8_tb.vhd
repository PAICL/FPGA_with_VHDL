library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bm3to8_tb is
end bm3to8_tb;

architecture Behavioral of bm3to8_tb is
    signal G1, G2, G3: STD_LOGIC := '1';
    signal A2, A1, A0: STD_LOGIC := '0';
    signal Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0: STD_LOGIC;

    component bm3to8
        port(
            G1, G2, G3: in STD_LOGIC;
            A2, A1, A0: in STD_LOGIC;
            Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0: out STD_LOGIC
        );
    end component;
begin
    uut: bm3to8 port map (G1 => G1, G2 => G2, G3 => G3, A2 => A2, A1 => A1, A0 => A0, Y7 => Y7, Y6 => Y6, Y5 => Y5, Y4 => Y4, Y3 => Y3, Y2 => Y2, Y1 => Y1, Y0 => Y0);

    process
    begin
        G1 <= '1'; G2 <= '0'; G3 <= '0';
        A2 <= '0'; A1 <= '0'; A0 <= '0'; wait for 10 ns;
        A2 <= '0'; A1 <= '0'; A0 <= '1'; wait for 10 ns;
        A2 <= '0'; A1 <= '1'; A0 <= '0'; wait for 10 ns;
        A2 <= '0'; A1 <= '1'; A0 <= '1'; wait for 10 ns;
        A2 <= '1'; A1 <= '0'; A0 <= '0'; wait for 10 ns;
        A2 <= '1'; A1 <= '0'; A0 <= '1'; wait for 10 ns;
        A2 <= '1'; A1 <= '1'; A0 <= '0'; wait for 10 ns;
        A2 <= '1'; A1 <= '1'; A0 <= '1'; wait for 10 ns;
        wait;
    end process;
end Behavioral;

