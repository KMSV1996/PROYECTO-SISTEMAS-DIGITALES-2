library ieee;
use ieee.std_logic_1164.all;

entity Comparador8bits_1 is
port(A, B: in std_logic_vector(8 downto 0);
		AigualB, AmenorB, AmayorB: out std_logic);
end comparador8bits_1;

architecture solve of Comparador8bits_1 is
begin
AigualB<='1' when A=B else '0';
AmenorB<='1' when A<B else '0';
AmayorB<='1' when A>B else '0';
end solve;