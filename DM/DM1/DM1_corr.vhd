library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use	ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;    -- Pour les opérations signées
use ieee.numeric_std.all;


entity DM1_corr is
    port(
        A, B        : in std_logic_vector(7 downto 0);  --entrées de l'ALU : opérandes
        Ope         : in std_logic_vector(2 downto 0);  --code d'opération de 3 bits

        Flag        : out std_logic_vector(1 downto 0); --informations sur le résultat de l'opération
        S           : out std_logic_vector(7 downto 0)  --sortie de l'ALU
       );
end DM1_corr;

architecture Behavioral of DM1_corr is
        signal A16, B16, S16                         : std_logic_vector(15 downto 0);
        signal carry, negatif, zero, overflow        : std_logic;
begin

    A16 <= x"00" & A;
    B16 <= x"00" & B;
    
    S16 <=  A16 + B16 when Ope="000" else 
            A16 - B16 when Ope="001" else
            A * B when Ope="010" else
            A16 and B16 when Ope="011" else 
            A16 or B16 when Ope="100" else
            not A16 when Ope="101";
            
     carry <= S16(8);
     overflow <= '0' when S16(15 downto 8)=x"00" else '1';
     zero <= '1' when S16(7 downto 0) <= x"00" else '0';
     negatif <= '1' when Ope="001" and B16>A16 else '0';
            
     S <= S16(7 downto 0);
     
     
    Flag <= "00" when carry='1'     else
            "01" when negatif='1'   else
            "10" when zero='1'      else
            "11" when overflow='1'  else
            "00";

end Behavioral;
