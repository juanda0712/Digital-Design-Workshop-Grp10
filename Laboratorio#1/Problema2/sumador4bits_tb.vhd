LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY sumador4bits_tb IS
END sumador4bits_tb;
 
ARCHITECTURE behavior OF sumador4bits_tb IS 
 
    COMPONENT sumador4bits
    PORT(
         iA : IN  std_logic_vector(3 downto 0);
         iB : IN  std_logic_vector(3 downto 0);
         iCin : IN  std_logic;
         Cout : OUT  std_logic;
			oSum : OUT  std_logic_vector(3 downto 0);
			salida7seg0: out STD_LOGIC_VECTOR(6 downto 0);
			salida7seg1: out STD_LOGIC_VECTOR(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iA : std_logic_vector(3 downto 0) := (others => '0');
   signal iB : std_logic_vector(3 downto 0) := (others => '0');
   signal iCin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal oSum : std_logic_vector(3 downto 0);
	signal salida7seg0: STD_LOGIC_VECTOR(6 downto 0);
	signal salida7seg1: STD_LOGIC_VECTOR(6 downto 0);
 
 
 
BEGIN
 
	--Unit Under Test (UUT)
   uut: sumador4bits PORT MAP (
          iA => iA,
          iB => iB,
          iCin => iCin,
          Cout => Cout,
			 oSum => oSum,
			 salida7seg0 => salida7seg0,
			 salida7seg1 => salida7seg1);

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	

		iA<="0010";
		iB<="0011";
		
      wait for 10 ns;
		
		iA<="1010";
		iB<="0001";
		
     wait for 10 ns;	
	  
	   iA<="1111";
		iB<="1111";
	  
     wait for 10 ns;	
		iA<="1110";
		iB<="0101";

      wait;
   end process;

END;
