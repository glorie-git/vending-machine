LIBRARy IEEE ;
USE IEEE.STD_LOGIC_1164.all ;

-- testbench entities are always empty
ENTITY tb_add3 IS
END tb_add3 ;

ARCHITECTURE test of tb_add3 IS

--1)------------------------------------------------
--copy and paste the entity and change to component
COMPONENT add3 IS
	PORT(	a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			b : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); 
END COMPONENT add3;
--this component will be used as a DUT (Device under test), ou will apply stimulus to the DUT's inputs
--verifies the correct/expected functionality at the outputs


--2) inputs and outputs for stimulus
SIGNAL 	a_sig						: STD_LOGIC_VECTOR(3 DOWNTO 0) ;
SIGNAL	b_sig						: STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			
			
--3) Instantiate the DUT and bind the signals to the IOs (port map) 
	BEGIN
	DUT : add3
			PORT MAP(a => a_sig, b => b_sig);

--4) Apply the stimulus ------------------------------------
--Must wait for xx ns between applying stimulus to allow time for output to settle (Tpd)
--appropriate timing (xx ns) is determined in timing simulations
		PROCESS IS
		BEGIN
		
				a_sig <= "0000";
				wait for 20 ns;
				
				a_sig <= "0001";
				
				wait for 20 ns;
				
				a_sig <= "0010";
				wait for 20 ns;
				
				a_sig <= "0011";
				wait for 20 ns;
				
				a_sig <= "0100";
				wait for 20 ns;
				
				a_sig <= "0101";
				wait for 20 ns;
				
				a_sig <= "0110";
				wait for 20 ns;
				
				a_sig <= "0111";
				wait for 20 ns;
				
				a_sig <= "1000";
				wait for 20 ns;
				
				a_sig <= "1001";
				wait for 20 ns;
				
				a_sig <= "1010";
				wait for 20 ns;
				
				a_sig <= "1011";
				wait for 20 ns;
				
				a_sig <= "1100";
				wait for 20 ns;
				
				a_sig <= "1101";
				wait for 20 ns;
				
				a_sig <= "1110";
				wait for 20 ns;
				
				a_sig <= "1111";
				wait for 20 ns;
		
				WAIT;
		
		END PROCESS;

END test;