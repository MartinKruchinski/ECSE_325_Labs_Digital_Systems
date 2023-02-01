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
-- Generated on "04/04/2022 19:40:22"
                                                            
-- Vhdl Test Bench template for design  :  g35_timestamper
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
use ieee.numeric_std.all; -- needed if you are using unsigned numbers
ENTITY g35_timestamper_vhd_tst IS
END g35_timestamper_vhd_tst;
ARCHITECTURE g35_timestamper_arch OF g35_timestamper_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL message : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
SIGNAL signature : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL timestamp : STD_LOGIC_VECTOR(21 DOWNTO 0);
COMPONENT g35_timestamper
	PORT (
	clk : IN STD_LOGIC;
	enable : IN STD_LOGIC;
	message : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	rst : IN STD_LOGIC;
	signature : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	timestamp : IN STD_LOGIC_VECTOR(21 DOWNTO 0)
	);
END COMPONENT;
BEGIN

	init : PROCESS                                              
     begin
      clk <= '0';
      wait for 5 ns;  
      clk <= '1';
      wait for 5 ns;  
	end process; 

	i1 : g35_timestamper
	PORT MAP (
-- list connections between master ports and signals
		clk => clk,
		enable => enable,
		message => message,
		rst => rst,
		signature => signature,
		timestamp => timestamp
	);
                                         
always : PROCESS                                              
                                    
BEGIN                                                         
		enable <= '0';
		message <= "00000000000000000000000000010110";
		timestamp <= std_logic_vector(to_unsigned(19794,22));
		rst <= '1';
		wait for 10 ns;
		rst <= '0';
		enable <= '1';
		wait for 30 ns;
		message <= "00000000000111000000000000010100";
WAIT;                                                        
END PROCESS always;                                          
END g35_timestamper_arch;
