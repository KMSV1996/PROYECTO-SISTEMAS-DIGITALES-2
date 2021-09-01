library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

Entity BinarytoBCD is
port(I: in std_logic_vector(7 downto 0);
	  Unidad,Decena,Centena: out std_logic_vector(3 downto 0));
end BinarytoBCD;

Architecture BTB of BinarytoBCD is
signal temporal_decena: std_logic_vector(7 downto 0);
signal temporal_unidad: std_logic_vector(7 downto 0);

Begin
	process(I)
	Begin
		if (I<"01100100") then 
			Centena<="0000"; temporal_decena<=I;
		elsif ((I>="01100100") and (I<"11001000")) then 
			Centena<="0001"; temporal_decena<=(I-"01100100");
		else 
			Centena<="0010"; temporal_decena<=(I-"11001000");
		end if;
		
		if (temporal_decena<"00001010") then 
			Decena<="0000"; temporal_unidad<=temporal_decena;
		elsif ((temporal_decena>="00001010") and (temporal_decena<"00010100")) then
			Decena<="0001"; temporal_unidad<=(temporal_decena-"00001010");
		elsif ((temporal_decena>="00010100") and (temporal_decena<"00011110")) then
			Decena<="0010"; temporal_unidad<=(temporal_decena-"00010100");
		elsif ((temporal_decena>="00011110") and (temporal_decena<"00101000")) then
			Decena<="0011"; temporal_unidad<=(temporal_decena-"00011110");
		elsif ((temporal_decena>="00101000") and (temporal_decena<"00110010")) then
			Decena<="0100"; temporal_unidad<=(temporal_decena-"00101000");
		elsif ((temporal_decena>="00110010") and (temporal_decena<"00111100")) then
			Decena<="0101"; temporal_unidad<=(temporal_decena-"00110010");
		elsif ((temporal_decena>="00111100") and (temporal_decena<"01000110")) then
			Decena<="0110"; temporal_unidad<=(temporal_decena-"00111100");
		elsif ((temporal_decena>="01000110") and (temporal_decena<"01010000")) then
			Decena<="0111"; temporal_unidad<=(temporal_decena-"01000110");
		elsif ((temporal_decena>="01010000") and (temporal_decena<"01011010")) then
			Decena<="1000"; temporal_unidad<=(temporal_decena-"01010000");
		else
			Decena<="1001"; temporal_unidad<=(temporal_decena-"01011010");
		end if;
	end process;
unidad<=temporal_unidad(3 downto 0);
end BTB;