-- this circuit implements the complete timestamper function
--
-- entity name: g35_timestamper
--
-- Copyright (C) 2022 Designer Name
-- Version 1.0
-- Author(s): Martin Kruchinski and Menad Kessaci
-- Date: April 09, 2022
library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- needed if you are using unsigned numbers
entity g35_timestamper is
port (  clk, rst, enable : in std_logic;
        message : in std_logic_vector(31 downto 0);
        timestamp : in std_logic_vector(21 downto 0);
        signature : out std_logic_vector(15 downto 0) );
end g35_timestamper;
architecture design of g35_timestamper is


--component declaration modexp
component g35_mod_exp
port (  d : in std_logic_vector(13 downto 0);
        c : in std_logic_vector(9 downto 0);
        start : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        s : out std_logic_vector(15 downto 0);
        ready : out std_logic);
end component;

--component declaration hash10
component g35_HASH10
port (  clk3, rst, enable : in std_logic;
        message : in std_logic_vector(31 downto 0);
        hash10 : out std_logic_vector(9 downto 0) );
end component;

signal hash1: std_logic_vector(9 downto 0);
signal hash2: std_logic_vector(9 downto 0);
signal message_timestamp : std_logic_vector(31 downto 0);
signal interMessage : std_logic_vector(31 downto 0);
signal finalResult: std_logic_vector(15 downto 0);
signal ready_dummy: std_logic;
signal enable2: std_logic;
signal enable3: std_logic;
signal enableFirst: std_logic;
signal enablewait: std_logic;
signal enablewait2: std_logic;
signal enablewait3: std_logic;
signal k: integer := 0;
begin

modexp : g35_mod_exp port map(d => std_logic_vector(to_unsigned(13205,14)),c => hash2,start => enable3, clk => clk,reset => rst,s => finalResult,ready => ready_dummy);

hash_1 : g35_HASH10 port map(clk3 => clk, rst => rst, enable => enableFirst, message => message, hash10 => hash1);
hash_2 : g35_HASH10 port map(clk3 => clk, rst => rst, enable => enable2, message => message_timestamp, hash10 => hash2);

ts : process (clk,rst,enable)
begin
    if rst = '1' then
        message_timestamp <= (others => '0');
        enable2 <= '0';
        enable3 <= '0';
        signature <= (others => '0');
    elsif rising_edge(clk) then
        k <= k +1;
        if k < 3 then
            enableFirst <= '1';
        end if;
        if k = 4 then
            enableFirst <= '0';
        end if;
        if k = 5 then
            message_timestamp <= hash1 & timestamp;
            enable2 <= '1';
        end if;
        if k = 7 then
            enable2 <= '0';
        end if;
        if k = 8 then
            enable3 <= '1';
        end if;
        signature <= finalResult;
    end if;
end process;
end design;