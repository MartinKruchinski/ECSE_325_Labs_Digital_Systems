--
-- entity name: g35_modulo33401
--
-- Version 1.0
-- Authors: Martin Kruchinski and Menad Kessaci
-- Date: March 11, 2022


library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- needed if you are using unsigned numbers
entity g35_modulo33401 is
port ( A : in std_logic_vector(31 downto 0);
Amod33401 : out std_logic_vector(15 downto 0);
Afloor33401 : out std_logic_vector(16 downto 0)
);
end g35_modulo33401;

architecture design of g35_modulo33401 is
--first sum for A*32147
signal interA: std_logic_vector (47 downto 0);
signal sumOne : unsigned(47 downto 0);
signal sumTwo : unsigned(47 downto 0);
signal substraction : unsigned(47 downto 0);
signal sumOneFloor : unsigned(47 downto 0);
signal substractionFloor : unsigned(47 downto 0);
signal floor : unsigned(47 downto 0);
--2^15+2^9+2^6+2^5+2^4+2^3+2^0=33401
begin
	interA <= "0000000000000000" & A;
	sumOne <= shift_left(unsigned(interA), 15) + shift_left(unsigned(interA),4) + shift_left(unsigned(interA),1) + unsigned(interA);
	sumtwo <= shift_left(unsigned(interA), 9) + shift_left(unsigned(interA),7);
	substraction <= sumOne - sumTwo;
    
	floor <= shift_right(substraction, 30);
    
	Afloor33401 <= std_logic_vector(floor (16 downto 0));
	sumOneFloor <= shift_left(floor, 15) + shift_left(floor,9) + shift_left(floor,6) + shift_left(floor, 5) + shift_left(floor, 4) + 	shift_left(floor, 3) + floor;

	substractionFloor <= unsigned(interA) - sumOneFloor;

	Amod33401 <= std_logic_vector(substractionFloor (15 downto 0));
end design;