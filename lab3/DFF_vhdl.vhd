LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DFF_vhdl IS
PORT (
	clk, d: IN std_logic;
	q, notQ: OUT std_logic -- for some reason don't put a semi colon on this one.
);
END DFF_vhdl;

ARCHITECTURE unicorns OF DFF_vhdl IS
BEGIN
	PROCESS(clk, d) -- inputs to keep track of
	BEGIN
	 IF (clk = '1' and d = '0') THEN
      q <= '0';
		notQ <= '1';
	 ELSIF (clk = '1' and d = '1') THEN
      q <= '1';
		notQ <= '0';
    END IF;
	 END PROCESS;
END unicorns;

	
	