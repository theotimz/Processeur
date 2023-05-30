----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2023 11:11:02
-- Design Name: 
-- Module Name: LI_DI - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LI_DI is
    Port ( CLK, diAlea, exAlea : in STD_LOGIC;
           INS : in STD_LOGIC_VECTOR (31 downto 0);
           A, OP, B, C : out STD_LOGIC_VECTOR (7 downto 0));
end LI_DI;

architecture Behavioral of LI_DI is
signal cmpt : integer;
begin
    process(CLK)
    variable compteur : integer :=0;
    begin      
        
    if rising_edge(CLK) then
        if diAlea = '0' and exAlea = '0' and compteur = 0 then
            C <= INS(7 downto 0);
            B <= INS(15 downto 8);
            A <= INS(23 downto 16);
            OP <= INS(31 downto 24);
            
        elsif diAlea = '1' then
            compteur :=6;
            C <= (others => '0');
            B <= (others => '0');
            A <= (others => '0');
            OP <= (others => '0');
            
        elsif exAlea = '1' then
            compteur :=4;
            C <= (others => '0');
            B <= (others => '0');
            A <= (others => '0');
            OP <= (others => '0');
        end if;
    end if;
    cmpt <= compteur;
    if compteur > 0 then compteur := compteur - 1; end if;
end process;
end Behavioral;

















