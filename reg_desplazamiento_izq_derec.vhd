library ieee;
use ieee.std_logic_1164.all;

entity reg_desplazamiento_izq_derec is
	generic(n : integer:=9);
	port(EntPar :in std_logic_vector (n-1 downto 0);
			Ld, En, R	: in std_logic;
			Resetn: in std_logic;
			Clock: in std_logic;
			Q: buffer std_logic_vector (n-1 downto 0));
end reg_desplazamiento_izq_derec;

architecture solve of reg_desplazamiento_izq_derec is
begin
	process(Resetn, Clock)
	begin
		if Resetn='0' then Q<=(others => '0');
		elsif(Clock'event and Clock = '1') then
		if En = '1' then
			if Ld='1' then Q<=EntPar;
			else desplazamiento: for i in 0 to n-2 loop
				Q(i) <= Q(i+1);
			end loop;
			Q(n-1)<=R;
			end if;
		end if;
		end if;
	end process;
end solve;