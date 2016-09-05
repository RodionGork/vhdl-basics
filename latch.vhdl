entity latch is
    port (d, e: in bit; q: out bit);
end latch;

architecture latchwork of latch is
    signal q0 : bit := '0';
begin
    q0 <= (not e and q0) or (e and d);
    q <= q0;
end latchwork;

entity tester is
end tester;

architecture dotesting of tester is
    signal d, q: bit;
begin
    pmap: entity work.latch port map (d, q);
    proc: process is
    begin
        d <= '0';
        q <= '0';
        wait for 10 ns;
        q <= '1';
        wait for 10 ns;
        q <= '0';
        wait for 10 ns;
        d <= '1';
        wait for 10 ns;
        q <= '1';
        wait for 10 ns;
        q <= '0';
        wait for 10 ns;
    end process proc;
end dotesting;
