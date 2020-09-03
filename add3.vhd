library ieee;
use ieee.std_logic_1164.all;

ENTITY add3 IS
	PORT(	a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			b : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); 
END add3;

architecture behaviour of add3 is

begin
	process (a) begin
		
		case a is
			when "0000" =>
				b <= "0000";
			
			when "0001" =>
				b <= "0001";
			
			when "0010" =>
				b <= "0010";
			
			when "0011" =>
				b <= "0011";
			
			when "0100" =>
				b <= "0100";
			
			when "0101" =>
				b <= "1000";
		
			when "0110" =>
				b <= "1001";
			
			when "0111" =>
				b <= "1010";
			
			when "1000" =>
				b <= "1011";
			
			when "1001" =>
				b <= "1100";
		
			when others =>
				b <= "XXXX";--(others => 'x');
		end case;
	
	end process;

end behaviour;