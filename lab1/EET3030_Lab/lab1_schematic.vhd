-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"
-- CREATED		"Mon Sep 17 14:42:20 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY lab1_schematic IS 
	PORT
	(
		A :  IN  STD_LOGIC;
		B :  IN  STD_LOGIC;
		AND2OUT :  OUT  STD_LOGIC;
		NAND2OUT :  OUT  STD_LOGIC;
		OR2OUT :  OUT  STD_LOGIC;
		NOR2OUT :  OUT  STD_LOGIC
	);
END lab1_schematic;

ARCHITECTURE bdf_type OF lab1_schematic IS 



BEGIN 



AND2OUT <= A AND B;


NAND2OUT <= NOT(B AND A);


OR2OUT <= B OR A;


NOR2OUT <= NOT(B OR A);


END bdf_type;