LIBRARy IEEE ;
USE IEEE.STD_LOGIC_1164.all ;
USE IEEE.NUMERIC_STD.all;

-- testbench entities are always empty
ENTITY tb_SRAM IS
END tb_SRAM ;

ARCHITECTURE test of tb_SRAM IS

--1)------------------------------------------------
--copy and paste the entity and change to component
COMPONENT SRAM IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
	);
END COMPONENT;

--this component will be used as a DUT (Device under test), ou will apply stimulus to the DUT's inputs
--verifies the correct/expected functionality at the outputs


--2) inputs and outputs for stimulus
			
SIGNAL addressSig	: STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL clk			: STD_LOGIC  := '1';
SIGNAL dataSig		: STD_LOGIC_VECTOR (5 DOWNTO 0);
SIGNAL rdenSig		: STD_LOGIC  := '1';
SIGNAL wrenSig		: STD_LOGIC;
SIGNAL qSig			: STD_LOGIC_VECTOR (5 DOWNTO 0);
CONSTANT clock_period : time := 10 ns;
			
--3) Instantiate the DUT and bind the signals to the IOs (port map) 
	BEGIN
	DUT : SRAM
			PORT MAP (	
							address => addressSig, 
							clock	=> clk,
							data => dataSig,
							rden => rdenSig,
							wren => wrenSig,
							q => qSig					
						);

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
		
		rdenSig <= '0';
		wrensig <= '0';
		
		addresssig <= "00";
		dataSig <= "000000";
		
		-- writing to data
		rdenSig <= '0';
		wrensig <= '1';
		
		wait for 20 ns;
		
		addresssig <= "00";
		dataSig <= "010100";
		
		wait for 20 ns;
		
		addresssig <= "01";
		dataSig <= "011100";
		
		wait for 20 ns;
		
		addresssig <= "10";
		dataSig <= "001111";
		
		wait for 20 ns;
		
		addresssig <= "11";
		dataSig <= "110101";
		
		wait for 20 ns;
		
		-- reading data
		
		rdenSig <= '1';
		wrensig <= '0';
		
		wait for 20 ns;
		
		addresssig <= "00";
		
		wait for 20 ns;
		
		addresssig <= "01";
		
		wait for 20 ns;
		
		addresssig <= "10";
		
		wait for 20 ns;
		
		addresssig <= "11";
		
		wait for 20 ns;
			
		wait;
			
		END PROCESS;
			

END test;