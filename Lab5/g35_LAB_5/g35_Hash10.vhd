-- this circuit implements a simple 10 bit Hash function
--
-- entity name: g35_Hash10
--
-- Copyright (C) 2022 Designer Name
-- Version 1.0
-- Author(s): Martin Kruchinski and Menad Kessaci
-- Date: April 09, 2022
library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- needed if you are using unsigned numbers

entity g35_HASH10 is
port (  clk3, rst, enable : in std_logic;
        message : in std_logic_vector(31 downto 0);
        hash10 : out std_logic_vector(9 downto 0) );
end g35_HASH10;

architecture design of g35_HASH10 is
--intermediate signals
signal oldHash : std_logic_vector(31 downto 0);
signal k : integer :=0;
begin

hash: process (clk3,rst,enable,message)
variable multiplication: unsigned(31 downto 0);
variable hash32: unsigned(31 downto 0);
begin
    if rst = '1' then
        multiplication := to_unsigned(0, 32);
        hash32 := to_unsigned(0, 32);
        oldHash <= std_logic_vector(to_unsigned(5381, 32));
        hash10 <= (others => '0');
    elsif rising_edge(clk3) then
        if enable = '1' then
            k <= k + 1;
            if k = 0 then
                multiplication := shift_left(unsigned(oldHash),5) + unsigned(oldHash);
                hash32 := resize(multiplication + unsigned(message),32); --should we save message in a register first?
                oldHash <= std_logic_vector(hash32);
            end if;
            if k = 1 then
                hash10 <= (oldHash(31) xor oldHash(9)) & (oldHash(30) xor oldHash(8)) & (oldHash(29) xor oldHash(7)) & (oldHash(28) xor oldHash(6)) & (oldHash(27) xor oldHash(5)) & (oldHash(26) xor oldHash(4)) & (oldHash(25) xor oldHash(3)) & (oldHash(24) xor oldHash(2)) & (oldHash(23) xor oldHash(1)) & (oldHash(22) xor oldHash(0));
                k <= k + 1;
            end if;
            if k = 2 then
                multiplication := shift_left(unsigned(oldHash),5) + unsigned(oldHash);
                hash32 := resize(multiplication + unsigned(message),32); --should we save message in a register first?
                oldHash <= std_logic_vector(hash32);
    --k <= k +1;
            end if;
            if k = 3 then
                hash10 <= (oldHash(31) xor oldHash(9)) & (oldHash(30) xor oldHash(8)) & (oldHash(29) xor oldHash(7)) & (oldHash(28) xor oldHash(6)) & (oldHash(27) xor oldHash(5)) & (oldHash(26) xor oldHash(4)) & (oldHash(25) xor oldHash(3)) & (oldHash(24) xor oldHash(2)) & (oldHash(23) xor oldHash(1)) & (oldHash(22) xor oldHash(0));
                k <= k + 1;
            end if;
        end if;
    end if;
end process;
end design;