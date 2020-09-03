library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY compare IS
	PORT 
	( 	
		N : IN STD_LOGIC := '0';
		Q : IN STD_LOGIC := '0';
		D : IN STD_LOGIC := '0';
		price_in, accum_in: IN STD_LOGIC_VECTOR( 5 DOWNTO 0 );
		change : OUT STD_LOGIC_VECTOR ( 5 DOWNTO 0);
		done : OUT STD_LOGIC
	);
END compare;

architecture behaviour of compare is

SIGNAL enough : STD_LOGIC := '0';
SIGNAL done_sig : STD_LOGIC;

begin
	
	done_sig <= '1' WHEN N = '0' AND Q = '0' AND D = '0' ELSE '0';
	
	done <= done_sig;
	
	change <= accum_in - price_in WHEN done_sig = '1' AND accum_in >= price_in ELSE "000000";
	
end behaviour;