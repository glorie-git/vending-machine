library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY convert2bcd IS
	PORT(	binary : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			bcd : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)); 
END convert2bcd;

architecture behaviour of convert2bcd is

	COMPONENT add3 IS
		PORT(	a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				b : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); 
	END COMPONENT;
	
	SIGNAL a1, a2, a3, a4, a5, a6, a7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL b1, b2, b3, b4, b5, b6, b7 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	
begin

	ad1 : add3
			port map (a => a1, b => b1);
	
	ad2 : add3
			port map (a => a2, b => b2);
	
	ad3 : add3
			port map (a => a3, b => b3);
	
	ad4 : add3
			port map (a => a4, b => b4);
	
	ad5 : add3
			port map (a => a5, b => b5);
	
	ad6 : add3
			port map (a => a6, b => b6);
	
	ad7 : add3
			port map (a => a7, b => b7);
		
		a1(3) <= '0';
		a4(2) <= b1(3);
		a6(3) <= b4(2);
		a4(3) <= '0';
		
		--bcd assigning
		
		bcd(0) <= binary(0);
		
		-- binary(1)
		a7(0) <= binary(1);
		bcd(1) <= b7(0);
		
		-- binary(2)
		a5(0) <= binary(2);
		a7(1) <= b5(0);
		bcd(2) <= b7(1);
		
		--binary(3)
		a3(0) <= binary(3);
		a5(1) <= b3(0);
		a7(2) <= b5(1);
		bcd(3) <= b7(2);
		
		--binary(4)
		a2(0) <= binary(4);
		a3(1) <= b2(0);
		a5(2) <= b3(1);
		a7(3) <= b5(2);
		bcd(4) <= b7(3);
		
		--binary(5)
		a1(0) <= binary(5);
		a2(1) <= b1(0);
		a3(2) <= b2(1);
		a5(3) <= b3(2);
		a6(0) <= b5(3);
		bcd(5) <= b6(0);
		bcd(6) <= b6(1);
		
		--binary(6)
		a1(1) <= binary(6);
		a2(2) <= b1(1);
		a3(3) <= b2(2);
		a4(0) <= b3(3);
		a6(1) <= b4(0);
		bcd(7) <= b6(2);
		bcd(8) <= b6(3);
		
		--binary(7)
		a1(2) <= binary(7);
		a2(3) <= b1(2);
		a4(1) <= b2(3);
		a6(2) <= b4(1);
		bcd(9) <= b4(3);
		
		bcd(10) <= '0';
		
		bcd(11) <= '0';

end behaviour;