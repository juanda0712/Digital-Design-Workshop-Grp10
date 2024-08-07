library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador4bits is
    Port ( iA : in STD_LOGIC_VECTOR(3 downto 0);
           iB : in STD_LOGIC_VECTOR(3 downto 0);
           iCin : in STD_LOGIC;
           Cout : out STD_LOGIC;
			  oSum : out STD_LOGIC_VECTOR(3 downto 0);
			  salida7seg0: out STD_LOGIC_VECTOR(6 downto 0);
			  salida7seg1: out STD_LOGIC_VECTOR(6 downto 0)
			  );
end sumador4bits;

architecture Behavioral of sumador4bits is

	signal Carry : std_logic_vector(2 downto 0):= "000";
	signal result : std_logic_vector(3 downto 0);
	signal temp_carry : std_logic;

	component sumador1 is
	Port (  A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
			  Sum : out STD_LOGIC);
	end component;


begin

    Sumador_0: sumador1 port map (A => iA(0), B => iB(0), Cin => '0', Cout => Carry(0), Sum => result(0));
    Sumador_1: sumador1 port map (A => iA(1), B => iB(1), Cin => Carry(0), Cout => Carry(1), Sum => result(1));
    Sumador_2: sumador1 port map (A => iA(2), B => iB(2), Cin => Carry(1), Cout => Carry(2), Sum => result(2));
    Sumador_3: sumador1 port map (A => iA(3), B => iB(3), Cin => Carry(2), Cout => temp_carry , Sum => result(3));
	 
	process (result,temp_carry)
		begin
		if temp_carry = '0' then
					salida7seg1 <= "1000000";
		else
			salida7seg1 <= "1111001";
			end if;
			
			case result is
					when "0000" => salida7seg0 <= "1000000"; -- Hex 0
					when "0001" => salida7seg0 <= "1111001"; -- Hex 1
					when "0010" => salida7seg0 <= "0100100"; -- Hex 2
					when "0011" => salida7seg0 <= "0110000"; -- Hex 3
					when "0100" => salida7seg0 <= "0011001"; -- Hex 4
					when "0101" => salida7seg0 <= "0010010"; -- Hex 5
					when "0110" => salida7seg0 <= "0000010"; -- Hex 6
					when "0111" => salida7seg0 <= "1111000"; -- Hex 7
					when "1000" => salida7seg0 <= "0000000"; -- Hex 8
					when "1001" => salida7seg0 <= "0010000"; -- Hex 9
					when "1010" => salida7seg0 <= "0001000"; -- Hex A
					when "1011" => salida7seg0 <= "0000011"; -- Hex B
					when "1100" => salida7seg0 <= "1000110"; -- Hex C
					when "1101" => salida7seg0 <= "0100001"; -- Hex D
					when "1110" => salida7seg0 <= "0000110"; -- Hex E
					when "1111" => salida7seg0 <= "0001110"; -- Hex F
		
			end case;
			
		oSum <= result;
		Cout <= temp_carry;
			
		end process;
end Behavioral;

