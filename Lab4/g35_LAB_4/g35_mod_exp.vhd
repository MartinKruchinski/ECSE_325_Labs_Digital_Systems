--
-- entity name: g35_mod_exp
-- implements s = c^d modulo 33401
--
-- Version 1.0
-- Authors: (Martin Kruchinski and Menad Kessaci)
-- Date: March 28, 2022
library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g35_mod_exp is
    port (  d : in std_logic_vector(13 downto 0);
            c : in std_logic_vector(9 downto 0);
            start : in std_logic;
            clk : in std_logic;
            reset : in std_logic;
            s : out std_logic_vector(15 downto 0);
            ready : out std_logic);
end g35_mod_exp;


architecture design of g35_mod_exp is
--component declaration
component g35_modulo33401_pipelined
    port (
        A : in std_logic_vector(31 downto 0);
        clk2 : in std_logic;
        Amod33401 : out std_logic_vector(15 downto 0);
        Afloor33401 : out std_logic_vector(16 downto 0)
    );
end component;

--intermediate signals declaration
signal k : integer := 0;
signal cnt : integer := 0;
signal interS: std_logic_vector(15 downto 0);
signal multiplication: std_logic_vector(31 downto 0);
signal floor: std_logic_vector(16 downto 0);

begin
modulo : g35_modulo33401_pipelined port map(A => multiplication, clk2 => clk, Amod33401 => interS, Afloor33401 => floor);

algorithm: process(d, c, reset, start, clk)
--variable declaration  
variable interS2 : std_logic_vector(15 downto 0);
begin
    if reset = '1' then
        ready <= '0';
        interS2 := std_logic_vector(to_unsigned(1, 16));
        k <= 0;
        cnt <= 0;
    elsif rising_edge(clk) then
        if start = '1' then
            cnt <= cnt + 1;
                if cnt = 0 then
                    if k < to_integer(unsigned(d)) then      
                        if k = 0 then
                            interS2 := std_logic_vector(to_unsigned(1, 16));
                        else
                            interS2 := interS;
                        end if;

                        multiplication <= std_logic_vector(resize(unsigned(interS2) * unsigned(c),32));
                        k <= k +1;
                    else
                        ready <= '1';
                    end if;
                elsif cnt = 26 then
                    if k = to_integer(unsigned(d)) then
                        ready <= '1';
                    end if;
                    cnt <= 0;
                end if;

        end if;
    end if;
end process;
s <= interS;
end design;