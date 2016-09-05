library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
    port (h1, h2: in unsigned(3 downto 0);
        res: out unsigned(3 downto 0);
        cy: out std_logic);
end adder;

architecture adderwork of adder is
    signal tmp: unsigned(4 downto 0);
begin
    tmp <= ('0' & h1) + h2;
    res <= tmp(3 downto 0);
    cy <= tmp(4);
end adderwork;

use work.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder_tb is
end adder_tb;

architecture adder_tb_work of adder_tb is
    signal a, b: unsigned(3 downto 0);
    type vec_array is array(0 to 15) of integer;
    constant ac : vec_array := (
        8, 3, 2, 1, 5, 7, 11, 13,
        0, 15, 12, 4, 10, 6, 9, 14);
begin
    b <= "0000";
    uut: entity work.adder port map(a, b) ;
    prc: process is
    begin
        for i in 0 to 15 loop
            wait for 10 ns;
            a <= to_unsigned(ac(i), 4);
            b <= b + 1;
        end loop;
    end process prc;
end adder_tb_work;
