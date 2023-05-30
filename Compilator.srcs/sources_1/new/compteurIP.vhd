----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.05.2023 20:17:01
-- Design Name: 
-- Module Name: compteurIP - Behavioral
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

entity compteurIP is
    Port ( CLK, diAlea, exAlea : in STD_LOGIC;
           IPcmp : inout STD_LOGIC_VECTOR (7 downto 0);
           IP: out STD_LOGIC_VECTOR (7 downto 0));
end compteurIP;

architecture Behavioral of compteurIP is
begin

process(CLK)
variable compteur : integer :=0;
begin
    
    if rising_edge(CLK) then
        if diAlea = '0' and exAlea = '0' and compteur = 0 then
            IPcmp <= std_logic_vector(unsigned(IPcmp) + 1);
            IP <= IPcmp;            
            
        elsif diAlea = '1' then
            compteur :=2;
            IP <= (others => '0');
            
        elsif exAlea = '1' then
            compteur :=1;
            IP <= (others => '0');
        --else
           --IP <= (others => '0'); 
        end if;
    end if;
    if compteur > 0 then compteur := compteur - 1; end if;
end process;

end Behavioral;
