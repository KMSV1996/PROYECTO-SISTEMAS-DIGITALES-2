library ieee;
use ieee.std_logic_1164.all;

entity Mux8_1 is
port( Sel: in std_logic_vector (2 downto 0);
		D0, D1, D2, D3, D4, D5, D6, D7: in std_logic_vector (6 downto 0);
		Q: out std_logic_vector (6 downto 0));
end Mux8_1;

architecture desarrollo of Mux8_1 is
signal temp: std_logic_vector (6 downto 0);
begin
	process(Sel)
	begin
		case Sel is
			when "000" => temp<=D0;
			when "001" => temp<=D1;
			when "010" => temp<=D2;
			when "011" => temp<=D3;
			when "100" => temp<=D4;
			when "101" => temp<=D5;
			when "110" => temp<=D6;
			when "111" => temp<=D7;
		end case;
	end process;
Q<=temp;
end desarrollo;