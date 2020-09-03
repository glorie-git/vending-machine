library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity accumulator is
	port	
	(	
		clk, rst, en : in std_logic;
		N, Q, D : IN STD_LOGIC;
		accum_out : out STD_LOGIC_VECTOR ( 5 downto 0 )
	);
end accumulator;

architecture behaviour of accumulator is

signal accum_reg : STD_LOGIC_VECTOR (5 downto 0);

begin

PROCESS (clk) BEGIN
		IF (rising_edge(clk)) THEN	
			IF ( rst = '1' ) THEN
				accum_reg <= (OTHERS => '0');
			ELSIF ( en = '1' ) THEN
--				IF ( N = '1' OR D = '1' OR Q = '1' ) THEN
					IF ( N = '1' ) THEN
						accum_reg <= accum_reg + "000001";
					END IF;
					IF ( D = '1' ) THEN
						accum_reg <= accum_reg + "000010";
					END IF;
					IF ( Q = '1' ) THEN
						accum_reg <= accum_reg + "000101";
					END IF;
--				END IF;
			END IF;
		END IF;
	END PROCESS;
	
	accum_out <= accum_reg;

END behaviour;