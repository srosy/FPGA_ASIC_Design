library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY lab4 IS
PORT(
	SW: in std_logic_vector(9 downto 0); --a, b, cin
	LEDR: out std_logic_vector(4 downto 0); -- sum, cout
	HEX0, HEX1: out std_logic_vector(6 downto 0)  -- 7 segment displays for s
);
END lab4;

ARCHITECTURE bacon OF lab4 IS


BEGIN
PROCESS(SW(0), SW(1), SW(2), SW(3), SW(4), SW(5), SW(6), SW(7), SW(8), SW(9)) -- inputs to keep track of
	variable s: integer; -- initialize s
	variable cout1: integer;-- initialize cout1
	variable cout2: integer;-- initialize cout2
	variable cout3: integer;-- initialize cout3
	variable cout4: integer;-- initialize cout4
	
	
	 --Signals vs. Variables:

    --Variables can only be used inside processes, signals can be used inside or outside processes.
    --Any variable that is created in one process cannot be used in another process, signals can be used in multiple processes though they can only be assigned in a single process.
    --Variables need to be defined after the keyword process but before the keyword begin. Signals are defined in the architecture before the begin statement.
    --Variables are assigned using the := assignment symbol. Signals are assigned using the <= assignment symbol.
    --Variables that are assigned immediately take the value of the assignment. Signals depend on if it's combinational or sequential code to know when the signal takes the value of the assignment.
	

	BEGIN
	s := 0;
	cout1 := 0;
	cout2 := 0;
	cout3 := 0;
	cout4 := 0;
	
	 -- S Cases, Cout cases, Special Case	
	 IF ((SW(6) = '1' xor SW(1) = '1') xor SW(0) = '1') THEN
      s := s + 1;
		cout1 := 0;
	 ELSIF (((SW(6) = '1' xor SW(1) = '1') and SW(0) = '1') or (SW(6) = '1' and SW(1) = '1')) THEN
		s := 0;
      cout1 := 1;
	 ELSIF (SW(6) = '1' and SW(1) = '1' and SW(0) = '1') THEN -- special case
		s := s + 1;
		cout1 := 1;
	 end if;
	 
	 IF ((SW(7) = '1' xor SW(2) = '1') or cout1 = 1) THEN
      s := s + 2;
		cout2 := 0;
	 ELSIF (((SW(7) = '1' xor SW(2) = '1') and cout1 = 1) or (SW(7) = '1' and SW(2) = '1')) THEN
		s := s + 0;
      cout2 := 1;
	 ELSIF (SW(7) = '1' and SW(2) = '1' and cout1 = 1) THEN -- special case
		s := s + 2;
		cout2 := 1;
	 end if;
	 
	 IF ((SW(8) = '1' xor SW(3) = '1') xor cout2 = 1) THEN
      s := s + 4;
		cout3 := 0;
	 ELSIF (((SW(8) = '1' xor SW(3) = '1') and cout2 = 1) or (SW(8) = '1' and SW(3) = '1')) THEN
      cout3 := 1;
	   s := s + 0;
	 ELSIF (SW(8) = '1' and SW(3) = '1' and cout2 = 1) THEN -- special case
		s := s + 4;
		cout3 := 1;
	 end if;	
	 
	 IF ((SW(9) = '1' xor SW(4) = '1') xor cout3 = 1) THEN
      s := s + 8;
		cout4 := 0;
	 ELSIF (((SW(9) = '1' xor SW(4) = '1') and cout3 = 1) or (SW(9) = '1' and SW(4) = '1')) THEN
      cout4 := 1;
		s := s + 0;
	 ELSIF (SW(9) = '1' and SW(4) = '1' and cout3 = 1) THEN -- special case
		s := s + 8;
		cout4 := 1;
	 END IF;
	 
	 -- s LEDS turn on/off, 7-Segment display (6543210)
	 IF s = 0 THEN
      LEDR(0) <= '0'; -- "string", 'int'
		LEDR(1) <= '0';
		LEDR(2) <= '0';
		LEDR(3) <= '0';
		HEX0  <= "1000000";  -- '0'
		HEX1  <= "1111111";  -- OFF
		
	 ELSIF s = 1 THEN
	   LEDR(0) <= '1';
		LEDR(1) <= '0';
		LEDR(2) <= '0';
		LEDR(3) <= '0';
		HEX0  <= "1111001";  -- '1'
		HEX1  <= "1111111";  -- OFF
		
	 ELSIF s = 2 THEN
	   LEDR(0) <= '0';
		LEDR(1) <= '1';
		LEDR(2) <= '0';
		LEDR(3) <= '0';
		HEX0  <= "0100100";  -- '2'
		HEX1  <= "1111111";  -- OFF
		
	 ELSIF s = 3 THEN
	   LEDR(0) <= '1';
		LEDR(1) <= '1';
		LEDR(2) <= '0';
		LEDR(3) <= '0';
		HEX0  <= "0110000";  -- '3'
		HEX1  <= "1111111";  -- OFF
		
	 ELSIF s = 4 THEN
		LEDR(0) <= '0';
		LEDR(1) <= '0';
		LEDR(2) <= '1';
		LEDR(3) <= '0';
		HEX0  <= "0011001";  -- '4'
		HEX1  <= "1111111";  -- OFF
		
	 ELSIF s = 5 THEN
	   LEDR(0) <= '1';
		LEDR(1) <= '0';
		LEDR(2) <= '1';
		LEDR(3) <= '0';
		HEX0  <= "0010010";  -- '5'
		HEX1  <= "1111111";  -- OFF
		
	 ELSIF s = 6 THEN
	   LEDR(0) <= '0';
		LEDR(1) <= '1';
		LEDR(2) <= '1';
		LEDR(3) <= '0';
		HEX0  <= "0000010";  -- '6'
		HEX1  <= "1111111";  -- OFF
		
	 ELSIF s = 7 THEN
	   LEDR(0) <= '1';
		LEDR(1) <= '1';
		LEDR(2) <= '1';
		LEDR(3) <= '0';
		HEX0  <= "1111000";  -- '7'
		HEX1  <= "1111111";  -- OFF
		
	 ELSIF s = 8 THEN
		LEDR(0) <= '0';
		LEDR(1) <= '0';
		LEDR(2) <= '0';
		LEDR(3) <= '1';
		HEX0  <= "0000000";  -- '8'
		HEX1  <= "1111111";  -- OFF
		
	 -- A	
	 ELSIF s = 9 THEN
	   LEDR(0) <= '1';
		LEDR(1) <= '0';
		LEDR(2) <= '0';
		LEDR(3) <= '1';
		HEX0  <= "1111111";  -- OFF
		HEX1  <= "0001000";  -- A
	 
	 -- B 
	 ELSIF s = 10 THEN
	   LEDR(0) <= '0';
		LEDR(1) <= '1';
		LEDR(2) <= '0';
		LEDR(3) <= '1';
		HEX1  <= "0000011";  -- B
		HEX0  <= "1111111";  -- OFF
	
	 -- C	
	 ELSIF s = 11 THEN
	   LEDR(0) <= '1';
		LEDR(1) <= '1';
		LEDR(2) <= '0';
		LEDR(3) <= '1';
		HEX1  <= "0100111";  -- C
		HEX0  <= "1111111";  -- OFF

	 -- D	
	 ELSIF s = 12 THEN
		LEDR(0) <= '0';
		LEDR(1) <= '0';
		LEDR(2) <= '1';
		LEDR(3) <= '1';
		HEX1  <= "0100001";  -- D
		HEX0  <= "1111111";  -- OFF
		
	 -- E	
	 ELSIF s = 13 THEN
	   LEDR(0) <= '1';
		LEDR(1) <= '0';
		LEDR(2) <= '1';
		LEDR(3) <= '1';
		HEX1  <= "0000110";  -- E
		HEX0  <= "1111111";  -- OFF
		
	 -- F	
	 ELSIF s = 14 THEN
	   LEDR(0) <= '0';
		LEDR(1) <= '1';
		LEDR(2) <= '1';
		LEDR(3) <= '1';
		HEX1  <= "0001110";  -- F
		HEX0  <= "1111111";  -- OFF
		
	 -- G	
	 ELSIF s = 15 THEN
	   LEDR(0) <= '1';
		LEDR(1) <= '1';
		LEDR(2) <= '1';
		LEDR(3) <= '1';
		HEX1  <= "0010000";  -- G
		HEX0  <= "1111111";  -- OFF
	 
    END IF; 
END PROCESS;
END bacon;