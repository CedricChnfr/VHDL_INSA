library ieee;
use ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;    -- Pour les opérations signées
use ieee.numeric_std.all;


entity ALU is
    port(
        A, B        : in std_logic_vector(7 downto 0);  --entrées de l'ALU : opérandes
        Ope         : in std_logic_vector(2 downto 0);  --code d'opération de 3 bits

        Flag        : out std_logic_vector(1 downto 0); --informations sur le résultat de l'opération
        S           : out std_logic_vector(7 downto 0)  --sortie de l'ALU
    );
end ALU;

architecture struct of ALU is
        --signal
        signal resultat                         : std_logic_vector(7 downto 0);
        signal carry, negatif, zero, overflow   : boolean;
        signal retenu                           : std_logic_vector (8 downto 0);
        signal over                             : std_logic_vector (15 downto 0);
begin
process(A, B, Ope)
begin
    carry <= false;
    overflow <= false;
    negatif <= false;

    case Ope is
        when "000" =>
            retenu <= ('0' & A) + ('0' & B);
            resultat <= A + B;
            if (retenu <= "100000000") then
                carry <= true;
            else
                carry <= false;
            end if;

        when "001" =>
            resultat <= A - B;
            if (A > B) then
                negatif <= false;
            else
                negatif <= true;
            end if;

        when "010" =>
            over <= A * B;
            resultat <= over(7 downto 0);
            if (over(15 downto 8) /= "00000000") then
                overflow <= false;
            else 
                overflow <= true;
            end if;

        when "011" =>
            resultat <= A and B;

        when "100" =>
            resultat <= A or B;

        when "101" =>
            resultat <= A xor B;

        when "110" =>
            resultat <= not A;

        when others =>
            resultat <= (others => '0');  -- Par défaut, résultat nul
    end case;

    end process;
           
    

    Flag <= "00" when carry     else
            "01" when negatif   else
            "10" when zero      else
            "11" when overflow  else
            "00";

    S <= resultat;
        
end architecture;