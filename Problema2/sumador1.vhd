library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
			  Cout : out STD_LOGIC;
           Sum : out STD_LOGIC);
end sumador1;

architecture Behavioral of sumador1 is

begin

    Sum <= A xor B xor Cin;
    Cout <= (A and B) or (Cin and A) or (Cin and B);

end Behavioral;