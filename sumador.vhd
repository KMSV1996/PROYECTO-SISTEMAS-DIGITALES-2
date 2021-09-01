library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sumador is
port(A, B: in std_logic_vector(3 downto 0);
		R: out std_logic_vector(3 downto 0));
end sumador;

architecture arq of sumador is
signal temp: std_logic_vector(3 downto 0);
begin
temp<=A+B;
R<=temp;
end arq;