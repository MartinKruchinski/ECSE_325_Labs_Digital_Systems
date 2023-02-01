-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions
-- and other software and tools, and its AMPP partner logic
-- functions, and any output files from any of the foregoing
-- (including device programming or simulation files), and any
-- associated documentation or information are expressly subject
-- to the terms and conditions of the Intel Program License
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other
-- applicable license agreement, including, without limitation,
-- that your use is for the sole purpose of programming logic
-- devices manufactured by Intel and sold by Intel or its
-- authorized distributors.  Please refer to the applicable
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to  
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/18/2022 17:06:03"
                                                           
-- Vhdl Test Bench template for design  :  g35_modulo33401
--
-- Simulation tool : ModelSim-Altera (VHDL)
--

LIBRARY ieee;                                              
USE ieee.std_logic_1164.all;                                

ENTITY g35_mod_exp_tst IS
END g35_mod_exp_tst;
ARCHITECTURE g35_mod_exp_arch OF g35_mod_exp_tst IS
-- constants                                                
-- signals  

COMPONENT g35_mod_exp
port (  d : in std_logic_vector(13 downto 0);
       c : in std_logic_vector(9 downto 0);
start : in std_logic;
clk : in std_logic;
reset : in std_logic;
s : out std_logic_vector(15 downto 0);
ready : out std_logic);
END COMPONENT;
signal d :  std_logic_vector(13 downto 0);
signal c :  std_logic_vector(9 downto 0);
signal start : std_logic;
signal clk : std_logic;
signal reset : std_logic;
signal s : std_logic_vector(15 downto 0);
signal ready : std_logic;
begin

  clk_process: process
     begin
      clk <= '0';
      wait for 5 ns;  
      clk <= '1';
      wait for 5 ns;  
  end process;


i1 : g35_mod_exp
PORT MAP (
-- list connections between master ports and signals
d=> d,
c => c,
start=> start,
clk => clk,
reset => reset,
s => s,
ready => ready
);

                                                                                             
always : PROCESS                                                                                
BEGIN                                                        
reset <= '1';
start <= '0';
d <= "00000000000101";
c <= "0000000011";
wait for 10 ns;
reset <= '0';
start <= '1';


wait until ready = '1';
wait for 10 ns;
reset <= '1';
start <= '0';
c <= "0000011111";
wait for 10 ns;
reset <= '0';
start <= '1';

wait until ready = '1';
wait for 10 ns;
reset <= '1';
start <= '0';
c <= "1000011111";
wait for 10 ns;
reset <= '0';
start <= '1';

wait until ready = '1';
wait for 10 ns;
reset <= '1';
start <= '0';
c <= "1100011111";
wait for 10 ns;
reset <= '0';
start <= '1';


wait until ready = '1';
wait for 10 ns;
reset <= '1';
start <= '0';
c <= "1110011111";
wait for 10 ns;
reset <= '0';
start <= '1';


wait until ready = '1';
wait for 10 ns;
reset <= '1';
start <= '0';
c <= "1111011111";
wait for 10 ns;
reset <= '0';
start <= '1';

wait until ready = '1';
wait for 10 ns;
reset <= '1';
start <= '0';
c <= "1110011110";
wait for 10 ns;
reset <= '0';
start <= '1';


wait until ready = '1';
wait for 10 ns;
reset <= '1';
start <= '0';
c <= "0000000000";
wait for 10 ns;
reset <= '0';
start <= '1';


wait until ready = '1';
wait for 10 ns;
reset <= '1';
start <= '0';
c <= "1111111111";
wait for 10 ns;
reset <= '0';
start <= '1';
 
WAIT;                                                        
END PROCESS always;                                          
END g35_mod_exp_arch;