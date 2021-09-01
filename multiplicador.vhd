library ieee;
use ieee.std_logic_1164.all;
entity Multiplicador is
port(
		A,B : in std_logic_vector(3 downto 0); -- Valores de ingreso
		m: out std_logic_vector(7 downto 0));  -- Resultado de la multiplicacion

end Multiplicador;

architecture sol of Multiplicador is

-- Declaracion de Señales a utilizar
signal p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16 : std_logic; --resultados de los productos
signal suma1p,suma2p,S_suma1_nuevo,S_suma2_nuevo,suma3p,suma4p : std_logic_vector(3 downto 0);--concatenaciones para luego sumarlas
signal S_suma1,S_suma2,S_suma3 : std_logic_vector (3 downto 0); --salidas de las sumas
signal Co1,Co2,Co3 : std_logic; --acarreos de las sumas


-- Componente de sumador
component sumador	
 PORT (		A : IN std_logic_vector(3 DOWNTO 0);
				B : IN std_logic_vector(3 DOWNTO 0);
				co: out std_logic;	
				s : OUT std_logic_vector(3 DOWNTO 0));
end component;



begin

-- multiplicacion de numero por numero A0
p1 <= A(0) AND B(0);
p2 <= A(0) AND B(1);
p3 <= A(0) AND B(2);
p4 <= A(0) AND B(3);

--concatenar la suma de los primeros productos
suma1p(0) <= p2;
suma1p(1) <= p3;
suma1p(2) <= p4;
suma1p(3) <= '0';


-- multiplicacion de numero por numero A1
p5 <= A(1) AND B(0);
p6 <= A(1) AND B(1);
p7 <= A(1) AND B(2);
p8 <= A(1) AND B(3);


--concatenar la suma de los segundos productos
suma2p(0) <= p5;
suma2p(1) <= p6;
suma2p(2) <= p7;
suma2p(3) <= p8;


suma1 : sumador port map(
			A => suma1p,
			B => suma2p,
			Co => Co1,
			s => S_suma1); -- el menos significativo de esta suma, corresponde a m(1)

-- Organizo para realizar la nueva suma
S_suma1_nuevo(0) <= S_suma1(1);
S_suma1_nuevo(1) <= S_suma1(2);
S_suma1_nuevo(2) <= S_suma1(3);
S_suma1_nuevo(3) <= Co1;


	
-- multiplicacion de numero por numero A2
p9 <= A(2) AND B(0);
p10 <= A(2) AND B(1);
p11 <= A(2) AND B(2);
p12 <= A(2) AND B(3);

--concatenar la suma de los 3eros productos
suma3p(0) <= p9;
suma3p(1) <= p10;
suma3p(2) <= p11;
suma3p(3) <= p12;


suma2 : sumador port map(
			A => S_suma1_nuevo,
			B => suma3p,
			Co => Co2,
			s => S_suma2); -- el menos significativo de esta suma, corresponde a m(2)
	

-- Organizo para realizar la nueva suma
S_suma2_nuevo(0) <= S_suma2(1);
S_suma2_nuevo(1) <= S_suma2(2);
S_suma2_nuevo(2) <= S_suma2(3);
S_suma2_nuevo(3) <= Co2;
	
	

-- multiplicacion de numero por numero A3
p13 <= A(3) AND B(0);
p14 <= A(3) AND B(1);
p15 <= A(3) AND B(2);
p16 <= A(3) AND B(3);

--concatenar la suma de los 3eros productos
suma4p(0) <= p13;
suma4p(1) <= p14;
suma4p(2) <= p15;
suma4p(3) <= p16;


suma3 : sumador port map(
			A => S_suma2_nuevo,
			B => suma4p,
			Co => Co3,
			s => S_suma3);
	
	
m(0) <= p1;
m(1) <= S_suma1(0);
m(2) <= S_suma2(0);
m(3) <= S_suma3(0);
m(4) <= S_suma3(1);
m(5) <= S_suma3(2);
m(6) <= S_suma3(3);
m(7) <= co3;

end sol;
