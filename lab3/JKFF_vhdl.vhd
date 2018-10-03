LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY JKFF_vhdl IS
PORT (
	clk, j, k: IN std_logic;
	temp, q, notQ : INOUT std_logic
	--q, notQ: OUT std_logic -- for some reason don't put a semi colon on this one.
);
END JKFF_vhdl;

ARCHITECTURE waifus OF JKFF_vhdl IS
BEGIN
	PROCESS(clk, j, k) -- inputs to keep track of
	BEGIN
	 IF (clk = '1' and j = '0' and k = '1') THEN
      q <= '1';
		notQ <= '0';
	 ELSIF (clk = '1' and k = '1' and j = '0') THEN
      q <= '0';
		notQ <= '1';
	 ELSIF (clk = '1' and k = '1' and j = '1') THEN
		temp <= q;
		q <= notQ;
		notQ <= temp;
    END IF;
	 END PROCESS;
END waifus;

	
	