library ieee;
use ieee.std_logic_1164.all;

entity MSS is
port(clock,resetn: in std_logic;
start, diezDat,covid,resf,gripe,may3,Q0,nuevo_ing,seg30,seg10,ing,leer_pac,ig_10,reg: in std_logic;
reset_rg,en_cont1,en_reg,en_alt,en_peso,en_edad,en_ced,en_sint,ld_reg,ld_cont1,en_contram,ld_cntram,modo,en_cnt10seg,en_cnt30seg,ld_cnt30seg,ld_cnt10seg: out std_logic;
m1,m2,m3,m4,led_covid,led_resf,led_gri:out std_logic;
estados: out std_logic_vector(4 downto 0));
end MSS;


architecture solve of MSS is
type estado is(Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Tn1,Tp,Tq,Tr,Tg1);
signal y: estado;

begin
process(clock, resetn)
begin
if resetn='0' then y<=Ta;
elsif(clock'event and clock='1') then
	case y is
--ESTADOS
		when Ta=> if start='0' then y<=Ta; else y<=Tb; end if;
		when Tb=> if nuevo_ing='1' then y<=Tc; else y<=Td; end if;
		when Tc=> if ing='1' then y<=Tg1; else y<=Tc; end if;
		when Td=> if leer_pac='1' then y<=Te; else y<=Tb; end if;
		when Te=> if ig_10='1' then y<=Tb; else y<=Te; end if;
		when Tf=> y<=Te;
		when Tg1=> y<=Tg;
		when Tg=> if reg='0' and Q0='0' then y<=Tg; elsif reg='0' and Q0='1' then y<=Tg; elsif reg='1' and Q0='0' then y<=Th;end if;
		when Th=> if may3='1' then y<=Ti; else y<=Tp; end if;
		when Ti=> if covid='1' then y<=Tj; else y<=Tk; end if;
		when Tj=> if seg30='1' then y<=Tm; else y<=Tj; end if;
		when Tk=> if resf='1' then y<= Tq; else y<=Tl; end if;
		when Tl=> if gripe='1' then y<=Tr; else y<=Tp; end if;
		when Tm=> if seg10='1' then y<= Tb; else y<=Tm; end if;
		when Tn=> if seg10='1' then y<= Tb; else y<=Tn; end if;
		when Tn1=> if seg10='1' then y<= Tb; else y<=Tn1; end if;
		when Tp=> if seg30='1' then y<=Tb; else y<=Tp; end if;
		when Tq=> if seg30='1' then y<=Tn; else y<=Tq;end if;
		when Tr=> if seg30='1' then y<=Tn1; else y<=Tr; end if;
	
	end case;
end if;
end process;

--SALIDAS
process(y)
	begin
		reset_rg<='1';en_alt<='0';en_peso<='0';en_edad<='0';en_sint<='0';en_ced<='0';
		en_contram<='0';en_reg<='0';en_cont1<='0';modo<='0';led_covid<='0';en_cnt30seg<='0';
		m1<='0';m2<='0';m4<='0';en_cnt10seg<='0';led_resf<='0';led_gri<='0';ld_reg<='0';ld_cont1<='0';
		m3<='0';
		case y is
		when Ta=> estados<="00000";
		when Tb=> estados <="00001"; reset_rg<='0';
		when Tc=> estados <="00010"; if ing='1' then en_alt<='1';en_peso<='1';en_edad<='1';en_ced<='1';en_sint<='1';end if;
		when Td=> estados <="00011";
		when Te=> estados <="00100";
		when Tf=> estados <="00101"; en_contram<='1';
		when tg1 => estados <="10010";en_reg<='1';ld_reg<='1';
		when Tg=> estados <="00110"; en_reg<='1';if reg='0' and Q0='1' then en_cont1<='1'; end if;
		when Th=> estados <="00111"; 
		when Ti=> estados <="01000"; if covid='1' then modo<='1'; end if;
		when Tj=> estados <="01001"; led_covid<='1';if seg30='0' then en_cnt30seg<='1';end if;
		when Tk=> estados <="01010"; if resf='1' then modo<='1'; end if;
		when Tl=> estados <="01011";	if gripe='1' then modo<='1'; end if;
		when Tm=> estados <="01100"; m1<='1';if seg10='0' then en_cnt10seg<='1';end if;
		when Tn=> estados <="01101"; m2<='1';if seg10='0' then en_cnt10seg<='1';end if;
		when Tn1=> estados<="01110"; m1<='1';if seg10='0' then en_cnt10seg<='1';end if;
		when Tp=> estados <="01111"; led_covid<='1';led_resf<='1';led_gri<='1'; if seg30='0' then en_cnt30seg<='1';end if;
		when Tq=> estados <="10000"; led_resf<='1';if seg30='0' then en_cnt30seg<='1';end if;
		when Tr=> estados <="10001"; led_gri<='1';if seg30='0' then en_cnt30seg<='1';end if;
		
		end case;
	end process;
end solve;