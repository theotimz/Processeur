----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2023 09:29:04
-- Design Name: 
-- Module Name: memIns - Behavioral
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

entity memIns is
    Port ( CLK, diAlea, exAlea : in STD_LOGIC;
           adr : in STD_LOGIC_VECTOR (7 downto 0);
           OUTMI: out STD_LOGIC_VECTOR (31 downto 0));
end memIns;

architecture Behavioral of memIns is
    type VECTEUR1 is array (0 to 63) of STD_LOGIC_VECTOR(31 downto 0);
    signal mInstructions : VECTEUR1;


begin
mInstructions <= (X"06000c00", X"05010000", others => (others => '0'));
--X"07030b00", X"08110200", X"07040a00", 
--X"07000000", X"07010100", X"07000200", 

process(CLK)    
variable compteur : integer :=0;
begin
    if rising_edge(CLK) then
    if to_integer(unsigned(adr)) <= 40 and diAlea = '0' and exAlea = '0' then
        OUTMI <= mInstructions(to_integer(unsigned(adr)));
        
    elsif diAlea = '1' then --to_integer(unsigned(adr)) = 0 and 
        compteur :=6;
        OUTMI <= (others => '0');
        
    elsif exAlea = '1' then --to_integer(unsigned(adr)) = 0 and 
        compteur :=4;
        OUTMI <= (others => '0');
        
    else --to_integer(unsigned(adr)) = 0 
        OUTMI <= (others => '0');
    end if;
    end if;
    if compteur > 0 then compteur := compteur - 1; end if;
end process;

end Behavioral;
