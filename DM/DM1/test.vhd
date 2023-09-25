library ieee;
use ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;    -- Pour les opérations signées
use ieee.numeric_std.all;

library work; -- Vous pouvez également utiliser une autre bibliothèque si nécessaire.
use work.ALU; -- Utilisez "all" si vous voulez inclure toutes les entités et packages de dm1.vhd.
entity test is
    -- Déclarations de vos ports ici
end entity test;

architecture behavioral of test is
    -- Déclarations de signaux, variables, etc.

    -- Instanciation de DM1_Entity
        signal A , B                        : std_logic_vector(7 downto 0);
        signal Ope                        : std_logic_vector(2 downto 0);

begin

    -- Processus de test
    test_process: process
    begin
        -- Mettez A à 1 pendant 10 ns

        
        Ope <= "111";
        A <= "00000000";
        B <= "00000000";
        wait for 10 ns;
                
        Ope <= "000";
        A <= "00000011";
        B <= "00000010";
        wait for 100 ns;
        
        Ope <= "000";
        A <= "11111111";
        B <= "00000010";
        wait for 100 ns;
        
        Ope <= "000";
        A <= "00000011";
        B <= "00000010";
        wait for 100 ns;
        
        Ope <= "001";
        A <= "00000101";
        B <= "00000010";
        wait for 100 ns;
        
        Ope <= "001";
        A <= "00000010";
        B <= "00000010";
        wait for 100 ns;
       
        Ope <= "001";
        A <= "00000010";
        B <= "00000011";
        wait for 100 ns;
        
        Ope <= "001";
        A <= "00000101";
        B <= "00000010";
        wait for 100 ns;
        
        Ope <= "010";
        A <= "00000011";
        B <= "00000100";
        wait for 100 ns;
        
        Ope <= "010";
        A <= "11111110";
        B <= "00000010";
        wait for 100 ns;
        
        Ope <= "010";
        A <= "00000010";
        B <= "00000010";
        wait for 100 ns;
        
        Ope <= "011";
        A <= "00101010";
        B <= "00100010";
        wait for 100 ns;
        
        Ope <= "100";
        A <= "10101010";
        B <= "00100010";
        wait for 100 ns;
        
        Ope <= "101";
        A <= "10101010";
        B <= "00101010";
        wait for 100 ns;
        
        Ope <= "110";
        A <= "10101010";
        B <= "00000000";
        wait for 100 ns;
        

        
        -- Vous pouvez continuer à personnaliser votre séquence de test ici
        -- Assurez-vous de terminer le processus à la fin de vos tests
        wait;
    end process test_process;

    -- Instanciation de DM1_Entity
    DM1 : entity work.ALU
        port map (
            -- Connectez les ports d'entrée/sortie de DM1_Entity à vos signaux/variables
            A => A,
            B => B,
            Ope => Ope
        );

    -- Le reste de votre architecture
end architecture behavioral;