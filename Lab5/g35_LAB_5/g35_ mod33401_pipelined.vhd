--
-- entity name: g35_modulo33401_pipelined
--
-- Version 1.0
-- Authors: Martin Kruchinski and Menad Kessaci
-- Date: March 25, 2022


library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- needed if you are using unsigned numbers
entity g35_modulo33401_pipelined is
    port (  A : in std_logic_vector(31 downto 0);
            clk2 : in std_logic;
            Amod33401 : out std_logic_vector(15 downto 0);
            Afloor33401 : out std_logic_vector(16 downto 0)
);
end g35_modulo33401_pipelined;

architecture design of g35_modulo33401_pipelined is
--Intermediate signals
signal floor : unsigned(47 downto 0);'
--13 registers to hold A
signal interA : std_logic_vector (47 downto 0);
signal interA2 : std_logic_vector (47 downto 0);
signal interA3 : std_logic_vector (47 downto 0);
signal interA4 : std_logic_vector (47 downto 0);
signal interA5 : std_logic_vector (47 downto 0);
signal interA6 : std_logic_vector (47 downto 0);
signal interA7 : std_logic_vector (47 downto 0);
signal interA8 : std_logic_vector (47 downto 0);
signal interA9 : std_logic_vector (47 downto 0);
signal interA10 : std_logic_vector (47 downto 0);
signal interA11 : std_logic_vector (47 downto 0);
signal interA12 : std_logic_vector (47 downto 0);
signal interA13 : std_logic_vector (47 downto 0);
--Registers holding the sums
signal sumOne : unsigned(47 downto 0);
signal sumTwo : unsigned(47 downto 0);
signal sumThree : unsigned(47 downto 0);
signal bigSum_2 : unsigned(47 downto 0);
signal BigSum_1 : unsigned(47 downto 0);
signal substraction : unsigned(47 downto 0);
signal sumOneFloor : unsigned(47 downto 0);
signal sumTwoFloor : unsigned(47 downto 0);
signal sumThreeFloor : unsigned(47 downto 0);
signal sumFourFloor : unsigned(47 downto 0);
signal sumFiveFloor : unsigned(47 downto 0);
signal sumSixFloor : unsigned(47 downto 0);
signal bigFloor_1 : unsigned(47 downto 0);
signal bigFloor_2 : unsigned(47 downto 0);
signal bigFloor_3 : unsigned(47 downto 0);
signal substractionFloor : unsigned(47 downto 0);

begin

pipelined: process (clk2)

begin
    if rising_edge(clk2) then
        interA <= "0000000000000000" & A;
        sumOne <= shift_left(unsigned(interA), 15) + shift_left(unsigned(interA),4);
        interA2 <= interA;
        sumTwo <= sumOne + shift_left(unsigned(interA2),1);
        interA3 <= interA2;
        sumThree <= sumTwo + unsigned(interA3);
        interA4 <= interA3;
        bigSum_2 <= shift_left(unsigned(interA4), 9) + shift_left(unsigned(interA4),7);
        interA5 <= interA4;
        substraction <= sumThree - bigSum_2;
        interA6 <= interA5;
        floor <= shift_right(substraction, 30);
        interA7 <= interA6;
        sumOneFloor <= shift_left(floor, 15) + shift_left(floor,9);
        interA8 <= interA7;
        sumTwoFloor <= shift_left(floor,6) + sumOneFloor;
        interA9 <= interA8;
        sumThreeFloor <= shift_left(floor, 5) + sumTwoFloor;
        interA10 <= interA9;
        sumFourFloor <= shift_left(floor, 4) + sumThreeFloor;
        interA11 <= interA10;
        sumFiveFloor <=  sumFourFloor + shift_left(floor, 3);
        interA12 <= interA11;
        sumSixFloor <= sumFiveFloor + floor;
        interA13 <= interA12;
        substractionFloor <=  unsigned(interA13) - sumSixFloor;

    end if;
end process;

Amod33401 <= std_logic_vector(substractionFloor (15 downto 0));
Afloor33401 <= std_logic_vector(floor (16 downto 0)); --has to hold
end design;