LIBRARy IEEE ;
USE IEEE.STD_LOGIC_1164.all ;

-- testbench entities are always empty
ENTITY tb_convert2bcd IS
END tb_convert2bcd ;

ARCHITECTURE test of tb_convert2bcd IS

--1)------------------------------------------------
--copy and paste the entity and change to component
COMPONENT convert2bcd IS
	PORT(	binary : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			bcd : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)); 
END COMPONENT;
--this component will be used as a DUT (Device under test), ou will apply stimulus to the DUT's inputs
--verifies the correct/expected functionality at the outputs


--2) inputs and outputs for stimulus
SIGNAL 	bin_sig					: STD_LOGIC_VECTOR(7 DOWNTO 0) ;
SIGNAL	bcd_sig						: STD_LOGIC_VECTOR(11 DOWNTO 0) ;
			
			
--3) Instantiate the DUT and bind the signals to the IOs (port map) 
	BEGIN
	DUT : convert2bcd
			PORT MAP(binary => bin_sig, bcd => bcd_sig);

--4) Apply the stimulus ------------------------------------
--Must wait for xx ns between applying stimulus to allow time for output to settle (Tpd)
--appropriate timing (xx ns) is determined in timing simulations
		PROCESS IS
		BEGIN
		
				bin_sig <= "00000000";
				wait for 20 ns;
				
				bin_sig <= "00000001";
				
				wait for 20 ns;
				
				bin_sig <= "00000010";
				wait for 20 ns;
				
				bin_sig <= "00000011";
				wait for 20 ns;
				
				bin_sig <= "00000100";
				wait for 20 ns;
				
				bin_sig <= "00000101";
				wait for 20 ns;
				
				bin_sig <= "00000110";
				wait for 20 ns;
				
				bin_sig <= "00000111";
				wait for 20 ns;
				
				bin_sig <= "00001000";
				wait for 20 ns;
				
				bin_sig <= "00001001";
				wait for 20 ns;
				
				bin_sig <= "00001010";
				wait for 20 ns;
				
				bin_sig <= "00001011";
				wait for 20 ns;
				
				bin_sig <= "00001100";
				wait for 20 ns;
				
				bin_sig <= "00001101";
				wait for 20 ns;
				
				bin_sig <= "00001110";
				wait for 20 ns;
				
				bin_sig <= "00001111";
				wait for 20 ns;
				
				bin_sig <= "00010000";
				wait for 20 ns;
				
				bin_sig <= "00010001";
				wait for 20 ns;
				
				bin_sig <= "00010010";
				wait for 20 ns;
				
				bin_sig <= "00010001";
				wait for 20 ns;
				
				bin_sig <= "11110110";
				wait for 20 ns;
				
				bin_sig <= "11111011";
				wait for 20 ns;
				
				bin_sig <= "11111100";
				wait for 20 ns;
				
				bin_sig <= "11111101";
				wait for 20 ns;
				
				bin_sig <= "11111110";
				wait for 20 ns;
				
				bin_sig <= "11111111";
				wait for 20 ns;
		
				WAIT;
		
		END PROCESS;

END test;