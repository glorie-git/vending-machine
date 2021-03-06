LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY tb_accumulator IS
END tb_accumulator;

ARCHITECTURE test OF tb_accumulator IS

COMPONENT accumulator is

port	(	clk, rst, en : in std_logic;
			N, Q, D :  IN STD_LOGIC;
			accum_out : OUT STD_LOGIC_VECTOR ( 5 DOWNTO 0 ));
END COMPONENT;

SIGNAL rst, en : STD_LOGIC;
SIGNAL N, Q, D : STD_LOGIC;
SIGNAL accum_out : STD_LOGIC_VECTOR ( 5 DOWNTO 0 );
SIGNAL clk : STD_LOGIC := '1';
--CONSTANT num_cycles : INTEGER := 400;
CONSTANT clock_period : time := 10 ns;


BEGIN
	DUT: 	accumulator
			port map (clk => clk, rst => rst, en => en, N => N, Q => Q, D => D, accum_out => accum_out);
			
	
clock_process : 

		PROCESS IS
		BEGIN			
			clk <= '0';
			wait for clock_period/2;
			clk <= '1';
			wait for clock_period/2;	
		END PROCESS;

stim_process :
	
	PROCESS
		BEGIN
		
		
		en <= '1';
		N <= '0';
		Q <= '0';
		D <= '0';
		rst <= '1';
		
		wait for 20 ns;
		
		rst <= '0';
		
		wait for 40 ns;
		
		N <= '1';
		Q <= '0';
		D <= '0';
		
		wait for 20 ns;
		
		N <= '0';
		Q <= '0';
		D <= '1';
		
		wait for 20 ns;
		
		N <= '0';
		Q <= '1';
		D <= '0';
		
		wait for 20 ns;
		
		N <= '0';
		Q <= '0';
		D <= '0';
		
		wait for 20 ns;
		
		N <= '1';
		Q <= '1';
		D <= '0';
		
		wait for 20 ns;
		
		N <= '0';
		Q <= '1';
		D <= '1';
		
		wait for 20 ns;
		
		N <= '1';
		Q <= '0';
		D <= '1';
		
		wait for 20 ns;
		
		N <= '1';
		Q <= '1';
		D <= '1';
		
		wait for 20 ns;
		
		N <= '0';
		Q <= '0';
		D <= '0';
		
		wait for 20 ns;
		
		WAIT;
		
	END PROCESS;

END test;