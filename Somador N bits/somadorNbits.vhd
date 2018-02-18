LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY somadorNbits IS
	GENERIC(N: positive := 4);
	PORT(
		cin : IN STD_LOGIC;
		a, b : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		s : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		cout : OUT STD_LOGIC
	);
END;
ARCHITECTURE comportamento OF somadorNbits IS
	SIGNAL c : STD_LOGIC_VECTOR (N DOWNTO 0);
   COMPONENT somador1bit
	PORT(
		cin, a, b : IN  STD_LOGIC;
		s, cout : OUT  STD_LOGIC
	);
END COMPONENT;
BEGIN
	c(0) <= cin;
	cout <= c(N);
	f1: for i in a'range generate
		SC0: somador1bit PORT MAP (c(i), a(i), b(i), s(i), c(i+1)); 
	end generate; 
END comportamento;