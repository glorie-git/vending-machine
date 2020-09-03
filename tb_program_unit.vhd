LIBRARy IEEE ;
USE IEEE.STD_LOGIC_1164.all ;
USE IEEE.NUMERIC_STD.all;

-- testbench entities are always empty
ENTITY tb_program_unit IS
END tb_program_unit ;

ARCHITECTURE test of tb_program_unit IS

--1)------------------------------------------------
--copy and paste the entity and change to component
COMPONENT program_unit is
	PORT
	(	
		clk, rst, hard_rst, set, en : IN STD_LOGIC;
		N, D, Q : IN STD_LOGIC;
		product : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		data_mem : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);		
		addr_out : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		done, wen : OUT STD_LOGIC
	);
END COMPONENT;
			
signal clk, rst, hard_rst_sig, set_sig, en_sig : std_logic;
signal N_sig, D_sig, Q_sig : STD_LOGIC;
signal data_mem_sig : STD_LOGIC_VECTOR (5 DOWNTO 0);
signal product_sig : STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL addr_out_sig : STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL done_sig, wen_sig : STD_LOGIC;
constant clock_period : time := 10 ns;
			
	BEGIN
	DUT : program_unit
			PORT MAP(	clk => clk, rst => rst, hard_rst => hard_rst_sig, set => set_sig, en => en_sig, D => D_sig, N => N_sig,
							Q => Q_sig, data_mem => data_mem_sig, product => product_sig, addr_out => addr_out_sig,
							done => done_sig, wen => wen_sig);

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
		
		N_sig <= '0';
		D_sig <= '0';
		Q_sig <= '0';
		set_sig <= '0';
		hard_rst_sig <= '0';
		product_sig <= "ZZ";
		en_sig <= '0';
		rst <= '1';
		
		wait for 10 ns;
		
		rst <= '0';
		
		wait for 20 ns;
		
		-- product 00
		en_sig <= '1';
		product_sig <= "00";
		
		wait for 10 ns;
		
		N_sig <= '1';
		D_sig<= '0';
		Q_sig<= '0';
		
		wait for 10 ns;
		
		N_sig <= '0';
		D_sig<= '0';
		Q_sig<= '1';
		
		wait for 10 ns;
		
		N_sig <= '0';
		D_sig<= '1';
		Q_sig<= '0';
		
		wait for 10 ns;
		
		N_sig <= '0';
		D_sig<= '1';
		Q_sig<= '0';
		
		wait for 10 ns;
		
		N_sig <= '0';
		D_sig<= '0';
		Q_sig<= '1';
		
		wait for 10 ns;
		
		N_sig<= '1';
		D_sig<= '0';
		Q_sig<= '0';
		
		wait for 10 ns;
		
		N_sig<= '1';
		D_sig<= '0';
		Q_sig<= '0';
		
		wait for 10 ns;
		
		set_sig <= '1';
		N_sig<= '0';
		D_sig<= '0';
		Q_sig<= '0';
		
		wait for 50 ns;
		
		set_sig <= '0';
		
		wait for 20 ns;
		
		rst <= '1';
		
		wait for 50 ns;
		
		rst <= '0';
		product_sig <= "11";
		
		wait for 10 ns;
		
		N_sig <= '0';
		D_sig<= '1';
		Q_sig<= '0';
		
		wait for 10 ns;
		
		N_sig <= '0';
		D_sig<= '0';
		Q_sig<= '1';
		
		wait for 10 ns;
		
		N_sig <= '1';
		D_sig<= '0';
		Q_sig<= '0';
		
		wait for 10 ns;
		
		N_sig <= '0';
		D_sig<= '1';
		Q_sig<= '0';
		
		wait for 10 ns;
		
		N_sig <= '0';
		D_sig<= '0';
		Q_sig<= '1';
		
		wait for 10 ns;
		
		N_sig<= '0';
		D_sig<= '0';
		Q_sig<= '1';
		
		wait for 10 ns;
		
		N_sig<= '1';
		D_sig<= '0';
		Q_sig<= '0';
		
		wait for 10 ns;
		
		set_sig <= '1';
		N_sig<= '0';
		D_sig<= '0';
		Q_sig<= '0';
		
		wait for 50 ns;
		
		set_sig <= '0';
		
		wait for 20 ns;
		
		rst <= '1';
		
		wait for 50 ns;
			
		wait;
			
		END PROCESS;
			

END test;