LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY puerta_or_de_N_entradas_vhdl IS
GENERIC (n : INTEGER := 4);
PORT (x : IN STD_LOGIC_VECTOR(1 TO n);
		f : OUT STD_LOGIC);
END puerta_or_de_N_entradas_vhdl;

ARCHITECTURE solve_of_puerta_or_de_N_entradas OF puerta_or_de_N_entradas_vhdl IS
SIGNAL tmp : STD_LOGIC_VECTOR(1 TO n);
BEGIN
tmp <= (OTHERS => '0');
f <= '0' WHEN x = tmp ELSE '1';
END solve_of_puerta_or_de_N_entradas;