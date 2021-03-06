LIBRARy IEEE ;
USE IEEE.STD_LOGIC_1164.all ;
USE IEEE.NUMERIC_STD.all;

-- testbench entities are always empty
ENTITY tb_vending_machine IS
END tb_vending_machine ;

ARCHITECTURE test of tb_vending_machine IS

--1)------------------------------------------------
--copy and paste the entity and change to component
COMPONENT vending_machine is

port 
	( 
		 clock_1, reset_1, hard_reset, set, Start, N, D, Q : in std_logic;
		 funct, prod: in std_logic_vector(1 downto 0); 
		 change_0 : out std_logic_vector(11 downto 0); -- , change_1, change_2
		 runTotal_0 : out std_logic_vector(11 downto 0); -- , runTotal_1, runTotal_2
		 total_0 : out std_logic_vector(11 downto 0); --, total_1, total_2 : out std_logic_vector(11 downto 0); 
		 finished : out std_logic
	);

end COMPONENT;
--this component will be used as a DUT (Device under test), ou will apply stimulus to the DUT's inputs
--verifies the correct/expected functionality at the outputs


--2) inputs and outputs for stimulus
			
signal clk, rst, hard_rst_sig, set_sig, startSig : std_logic;
signal N_sig : STD_LOGIC := 'X';
signal D_sig : STD_LOGIC := 'X';
signal Q_sig : STD_LOGIC := 'X';
signal product_sig, funct_sig : STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL change_Sig, runTotal_sig, total_sig : STD_LOGIC_VECTOR (11 DOWNTO 0);
SIGNAL finished_sig : STD_LOGIC;
constant clock_period : time := 10 ns;
			
--3) Instantiate the DUT and bind the signals to the IOs (port map) 
	BEGIN
	DUT : vending_machine
			PORT MAP(	clock_1 => clk, reset_1 => rst, hard_reset => hard_rst_sig, Start => startSig, D => D_sig, N => N_sig,
							Q => Q_sig, funct => funct_sig, prod => product_sig, change_0 => change_sig,
							runTotal_0 => runTotal_sig, total_0 => total_sig, finished => finished_sig, set => set_sig );

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
		
		hard_rst_sig <= '0';
		N_sig <= '0'; 
		D_sig <= '0';
		Q_sig <= '0';
		set_sig <= '0';
		funct_sig <= "ZZ";
		product_sig <= "ZZ";
		startsig <= '1';
		rst <= '1';
		
		wait for 50 ns;
		
		-- enter program mode
		-- set price for product one
		--startsig <= '1';
		rst <= '0';
		funct_sig <= "00";
		
		wait for 20 ns;
		
		product_sig <= "00";
		
		wait for 10 ns;
		
		D_sig <= '1';
		N_sig <= '0';
		Q_sig	<= '0';
		
		wait for 40 ns;
		
		D_sig <= '0';
		N_sig <= '0';
		Q_sig	<= '1';
		
		wait for 40 ns;
		
		D_sig <= '0';
		N_sig <= '1';
		Q_sig	<= '0';
		
		wait for 20 ns;
		
		D_sig <= '0';
		N_sig <= '0';
		Q_sig	<= '1';
		
		wait for 20 ns;
		
		set_sig <= '1';
		D_sig <= '0';
		N_sig <= '0';
		Q_sig	<= '0';
		
		wait for 50 ns;
		
		set_sig <= '0';
		--rst <= '0';
		
		wait for 50 ns;
		
		rst <= '1';
		--startsig <= '0';
		
		wait for 20 ns;
		
		rst <= '0';
		
		--- vending mode
		--funct_sig <= "11";
		--wait for 10 ns;
		
		funct_sig <= "10";
		product_sig <= "00";
		D_sig <= '1';
		N_sig <= '0';
		Q_sig	<= '0';
		
		wait for 40 ns;
		
		D_sig <= '0';
		N_sig <= '0';
		Q_sig	<= '1';
		
		wait for 40 ns;
		
		D_sig <= '0';
		N_sig <= '1';
		Q_sig	<= '0';
		
		wait for 20 ns;
		
		D_sig <= '0';
		N_sig <= '0';
		Q_sig	<= '1';
		
		wait for 20 ns;
		
		D_sig <= '0';
		N_sig <= '0';
		Q_sig	<= '0';
		
		wait for 50 ns;
		
		rst <= '0';
		
		WAIT;
			
		END PROCESS;
			

END test;
