LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY tb_compare IS
END tb_compare;

ARCHITECTURE test OF tb_compare IS 

COMPONENT compare IS
	PORT 
	( 	
		N, Q, D : IN STD_LOGIC;
		price_in, accum_in: IN STD_LOGIC_VECTOR( 5 DOWNTO 0 );
		change : OUT STD_LOGIC_VECTOR ( 5 DOWNTO 0);
		done : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL price_sig, accum_sig, change_sig : STD_LOGIC_VECTOR ( 5 DOWNTO 0 );
SIGNAL done_sig : STD_LOGIC;
SIGNAL NSig, QSig, DSig : STD_LOGIC;

BEGIN

	DUT: 	compare
			port map ( 	price_in => price_sig, accum_in => accum_sig, change => change_sig, done => done_sig,
							N => NSig, Q => QSig, D => DSig);
			
	PROCESS 
		BEGIN
		
		NSig <= '1';
		DSig <= '1';
		QSig <= '1';
		
		price_sig <= "000101";
		accum_sig <= "000010";

		
		price_sig <= "000101";
		accum_sig <= "000001";
		wait for 20 ns;
		
		price_sig <= "000101";
		accum_sig <= "000010";
		wait for 20 ns;
		
		price_sig <= "000101";
		accum_sig <= "000011";
		wait for 20 ns;
		
		price_sig <= "000101";
		accum_sig <= "000100";
		wait for 20 ns;
		
		price_sig <= "000101";
		accum_sig <= "000101";
		wait for 20 ns;
		
		price_sig <= "000101";
		accum_sig <= "000101";
		wait for 20 ns;
		
		price_sig <= "000101";
		accum_sig <= "000111";
		wait for 20 ns;
		
		price_sig <= "000101";
		accum_sig <= "001000";
		wait for 20 ns;
		
		price_sig <= "000101";
		accum_sig <= "001001";
		wait for 20 ns;
		
		price_sig <= "000101";
		accum_sig <= "001010";
		wait for 20 ns;
		
		NSig <= '0';
		DSig <= '0';
		QSig <= '0';

		wait for 20 ns;
		
		DSig <= '1';
		price_sig <= "001111";
		accum_sig <= "000010";
		
		price_sig <= "001111";
		accum_sig <= "000001";
		wait for 20 ns;
		
		price_sig <= "001111";
		accum_sig <= "000010";
		wait for 20 ns;
		
		price_sig <= "001111";
		accum_sig <= "000011";
		wait for 20 ns;
		
		price_sig <= "001111";
		accum_sig <= "000100";
		wait for 20 ns;
		
		price_sig <= "001111";
		accum_sig <= "000101";
		wait for 20 ns;
		
		price_sig <= "001111";
		accum_sig <= "000101";
		wait for 20 ns;
		
		price_sig <= "001111";
		accum_sig <= "000111";
		wait for 20 ns;
		
		price_sig <= "001111";
		accum_sig <= "001000";
		wait for 20 ns;
		
		price_sig <= "001111";
		accum_sig <= "001111";
		wait for 20 ns;
		
		price_sig <= "001111";
		accum_sig <= "011010";
		wait for 20 ns;
		
		NSig <= '0';
		DSig <= '0';
		QSig <= '0';
		wait for 20 ns;
		
		--price_sig <= "111111";
		--accum_sig <= "111111";
		--wait for 20 ns;
		
		QSig <= '1';
		price_sig <= "010000";
		accum_sig <= "000010";

		
		price_sig <= "010000";
		accum_sig <= "000001";
		wait for 20 ns;
		
		price_sig <= "010000";
		accum_sig <= "000010";
		wait for 20 ns;
		
		price_sig <= "010000";
		accum_sig <= "000011";
		wait for 20 ns;
		
		price_sig <= "010000";
		accum_sig <= "000100";
		wait for 20 ns;
		
		price_sig <= "010000";
		accum_sig <= "000101";
		wait for 20 ns;
		
		price_sig <= "010000";
		accum_sig <= "000101";
		wait for 20 ns;
		
		price_sig <= "010000";
		accum_sig <= "000111";
		wait for 20 ns;
		
		price_sig <= "010000";
		accum_sig <= "001000";
		wait for 20 ns;
		
		price_sig <= "010000";
		accum_sig <= "001111";
		wait for 20 ns;
		
		price_sig <= "010000";
		accum_sig <= "010000";
		wait for 20 ns;
		
		NSig <= '0';
		DSig <= '0';
		QSig <= '0';
		wait for 20 ns;
		
		WAIT;
		
	END PROCESS;

END test;

