library ieee;
use ieee.std_logic_1164.all;

entity codificador8a3 is
	port(T: in std_logic_vector(7 downto 0);
			Q: out std_logic_vector(2 downto 0));
end codificador8a3;

architecture proceso of codificador8a3 is
	begin
	process(T)
	begin
		case T is
			when "00000001"=> Q<="000";
			when "00000010"=> Q<="001";
			when "00000100"=> Q<="010";
			when "00001000"=> Q<="011";
			when "00010000"=> Q<="100";
			when "00100000"=> Q<="101";
			when "01000000"=> Q<="110";
			when "10000000"=> Q<="111";
			when others => Q<="000";
		end case;
	end process;
end proceso;