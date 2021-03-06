LIBRARy IEEE ;
USE IEEE.STD_LOGIC_1164.all ;
USE IEEE.NUMERIC_STD.all;

-- testbench entities are always empty
ENTITY tb_van_unit IS
END tb_van_unit ;

ARCHITECTURE test of tb_van_unit IS

--1)------------------------------------------------
--copy and paste the entity and change to component
COMPONENT vend_unit IS
	PORT 
	( 	
		clock, reset, enable, N, D, Q : in std_logic;
		price_in : in STD_LOGIC_VECTOR ( 5 downto 0);
		change, insert_out : out STD_LOGIC_VECTOR ( 11 downto 0);
		done : out std_logic
	);
END COMPONENT;
--this component will be used as a DUT (Device under test), ou will apply stimulus to the DUT's inputs
--verifies the correct/expected functionality at the outputs


--2) inputs and outputs for stimulus
			
signal clk, rst, en, N, D, Q : STD_LOGIC;
signal price_in : STD_LOGIC_VECTOR ( 5 downto 0);
signal change : STD_LOGIC_VECTOR ( 11 downto 0 );
SIGNAL insert_out : STD_LOGIC_VECTOR ( 11 DOWNTO 0 );
signal done_sig : std_logic;
constant clock_period : time := 10 ns;
			
--3) Instantiate the DUT and bind the signals to the IOs (port map) 
	BEGIN
	DUT : vend_unit
			PORT MAP(	clock => clk, reset => rst, enable => en, N => N, D => D, Q => Q,
							price_in => price_in, change => change, insert_out => insert_out,
							done => done_sig);

--4) Apply the stimulus ------------------------------------
--Must wait for xx ns between applying stimulus to allow time for output to settle (Tpd)
--appropriate timing (xx ns) is determined in timing simulations

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
			--done_sig <= '0';
			price_in <= "000000";
			rst <= '1';
			
			wait for 10 ns;
			
			rst <= '0';
			
			wait for 10 ns;
						
			price_in <= "010000";
			N <= '0';
			D <= '1';
			Q <= '0';
			
			wait for 100 ns;
			
			N <= '0';
			D <= '0';
			Q <= '0';
			
			wait for 50 ns;
			
			en <= '0';
			
			wait for 50 ns;
			
			rst <= '1';
			
			wait for 10 ns;
			
			rst <= '0';
			
			wait for 50 ns;
			
			en <= '1';
			price_in <= "001000";
			N <= '0';
			D <= '1';
			Q <= '0';
			
			wait for 15 ns;
			
			N <= '1';
			D <= '0';
			Q <= '0';
			
			wait for 15 ns;
			
			N <= '0';
			D <= '0';
			Q <= '1';
			
			wait for 15 ns;
			
			N <= '0';
			D <= '0';
			Q <= '0';
			
			wait for 50 ns;
			
			en <= '0';
			
			wait for 50 ns;
			
			rst <= '1';
			
			wait for 20 ns;
			
			wait;
			
		END PROCESS;
			
END test;