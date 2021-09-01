library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult is
	generic(N: positive :=3);
	port( a: in std_logic_vector(N-1 downto 0);
			b: in std_logic_vector(N-1 downto 0);
			p: out std_logic_vector(2*N-1 downto 0)
	);
end entity mult;

architecture solve of mult is
begin
	p<= std_logic_vector(signed(a) * signed(b));

end architecture solve;