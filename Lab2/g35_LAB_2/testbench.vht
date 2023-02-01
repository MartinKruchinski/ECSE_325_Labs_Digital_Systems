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

-- **************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to  
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/16/2022 10:36:16"
                                                           
-- Vhdl Test Bench template for design  :  g35_modulo33401
--
-- Simulation tool : ModelSim-Altera (VHDL)
--

LIBRARY ieee;                                              
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY g35_modulo33401_vhd_tst IS
END g35_modulo33401_vhd_tst;
ARCHITECTURE g35_modulo33401_arch OF g35_modulo33401_vhd_tst IS
-- constants                                                
-- signals                                                  
SIGNAL A : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL Afloor33401 : STD_LOGIC_VECTOR(16 DOWNTO 0);
SIGNAL Amod33401 : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT g35_modulo33401
PORT (
  A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  Afloor33401 : BUFFER STD_LOGIC_VECTOR(16 DOWNTO 0);
  Amod33401 : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END COMPONENT;
BEGIN
	i1 : g35_modulo33401
PORT MAP (
-- list connections between master ports and signals
  A => A,
  Afloor33401 => Afloor33401,
  Amod33401 => Amod33401
);
always : PROCESS
-- optional sensitivity list
-- ( )
-- variable declarations
BEGIN
-- code executes for every event on sensitivity list
	for i in 0 to 255 loop
    	A <= std_logic_vector(to_unsigned(i, 8)) & "000000000000000000000000";
        wait for 8 ns;
    end loop;	
    
WAIT;
END PROCESS always;
END g35_modulo33401_arch;

