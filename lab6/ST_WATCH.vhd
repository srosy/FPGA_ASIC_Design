library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY ST_WATCH IS
PORT(
	CLK_50: in std_logic;
	KEY: in std_logic_vector(1 downto 0); --start/stop, reset
	HEX2: out std_logic_vector(6 downto 0)  -- 7 segment displays for seconds
);
END ST_WATCH;

ARCHITECTURE cheetos OF ST_WATCH IS
BEGIN
PROCESS(CLK_50, KEY) -- inputs to keep track of

	VARIABLE s: integer := 9; -- initialize s, start timer at 9 seconds
	VARIABLE stop: integer := 1; -- running is 0
	VARIABLE track: integer := 0; -- keeps track of the rising edge count
	
	BEGIN
	-- main
	IF(rising_edge(CLK_50)) THEN
		-- s 7-Segment display (6543210)
		IF s = 9 	THEN
			HEX2  <= "0010000";  -- '9'
		ELSIF s = 8 THEN
			HEX2  <= "0000000";  -- '8'
		ELSIF s = 7 THEN
			HEX2  <= "1111000";  -- '7'
		ELSIF s = 6 THEN
			HEX2  <= "0000010";  -- '6'
		ELSIF s = 5 THEN
			HEX2  <= "0010010";  -- '5'
		ELSIF s = 4 THEN
			HEX2  <= "0011001";  -- '4'
		ELSIF s = 3 THEN
			HEX2  <= "0110000";  -- '3'
		ELSIF s = 2 THEN
			HEX2  <= "0100100";  -- '2'
		ELSIF s = 1 THEN
			HEX2  <= "1111001";  -- '1'
		ELSIF s <= 0 THEN -- Handle when stopwatch hits 0
			HEX2  <= "1000000";  -- '0'
		END IF;
		
		-- key pressed event start/stop
		IF KEY(0) = '0' THEN
			IF stop = 0 THEN
				stop := 1;
			ELSE stop := 0;
			END IF;
		END IF;
		
		-- reset, running, stopped
		IF KEY(1) = '0' THEN
			s := 9;
      ELSIF KEY(1) = '1' THEN
			IF stop = 1 THEN
				s := s;
			ELSE
				track := track + 1;
				IF track = 25000000 THEN
					s := s - 1;
					track := 0;
				END IF;
			END IF;
		END IF;
		
   END IF;
END PROCESS;
END cheetos;