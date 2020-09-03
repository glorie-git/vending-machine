library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity program_unit is
	port 
	(	
		clk, rst : IN STD_LOGIC;
		hard_rst : IN STD_LOGIC;
		set : IN STD_LOGIC;
		en : IN STD_LOGIC;
		N, D, Q : IN STD_LOGIC;
		product : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		data_mem : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
		addr_out : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		done : OUT STD_LOGIC := '0';
		wen : OUT STD_LOGIC := '0'
	);
end program_unit;



architecture behaviour of program_unit is

	COMPONENT accumulator IS
		PORT	
		(	
			clk, rst, en : IN STD_LOGIC;
			N, Q, D : IN STD_LOGIC;
			accum_out : OUT STD_LOGIC_VECTOR ( 5 DOWNTO 0 )
		);
	END COMPONENT;

	TYPE state_type IS (idle, adding, mem_writing);
	SIGNAL next_state, current_state: state_type;
	SIGNAL accum_en : STD_LOGIC := '0';
	SIGNAL accum_out_sig : STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL num_cycles : INTEGER := 0;
	SIGNAL cycle_flag : INTEGER := 5;
	
BEGIN

	accum	:	accumulator 
				PORT MAP (clk => clk, rst => rst, en => accum_en, N => N, Q => Q, D => D, accum_out => accum_out_sig);
	
	PROCESS (current_state, en, set)
	BEGIN
		CASE current_state IS
			WHEN idle =>
				--done <= '0';
				--wen <= '0';
				addr_out <= "ZZ";
				data_mem <= "000000";
				IF (en = '1') THEN
					accum_en <= '1';
					next_state <= adding;
				ELSE
					next_state <= idle;
				END IF;
			WHEN adding =>
				IF set = '1' THEN
					accum_en <= '0';				-- here we are disabling the accumulator
					wen <= '1';
					data_mem <= accum_out_sig;	-- accum_out_sig holds the accumulated coins
					addr_out <= product;			-- product is the product that we are setting the price for
					next_state <= mem_writing;	-- next state is mem_writing	
				ELSE
					next_state <= adding;
				END IF;
			WHEN mem_writing =>
				done <= '1';
				IF ( num_cycles >= cycle_flag ) THEN
					done <= '0';
					wen <= '0';
					next_state <= idle;
				END IF;
		END CASE;
	END PROCESS;
	
	PROCESS (clk, rst)
	BEGIN
		IF (rst = '1') THEN
			num_cycles <= 0;
			current_state <= idle;
		ELSIF (RISING_EDGE(clk)) THEN
			IF ( num_cycles < cycle_flag AND set = '1') THEN
				num_cycles <= num_cycles + 1;
			END IF;
			current_state <= next_state;
		END IF;
	END PROCESS;

END behaviour;