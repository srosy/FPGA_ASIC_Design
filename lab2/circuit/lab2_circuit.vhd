ENTITY lab2_circuit IS
PORT (
	a, b, c: IN BIT;
	and2, inst, or2, and1, and3, orF: INOUT BIT;
	z: OUT BIT -- for some reason don't put a semi colon on this one.
);
END lab2_circuit;

ARCHITECTURE arch OF lab2_circuit IS
BEGIN
	and2 <= a AND b; -- inputs
	or2  <= a OR c;
	and1 <= a AND c;
	
	and3 <= or2 AND and1; -- inouts
	orF  <= and2 OR and3;
	
	z    <= orF; -- output
END arch;

	
	
	