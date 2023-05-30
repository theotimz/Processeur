----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.05.2023 12:29:11
-- Design Name: 
-- Module Name: gestionAlea - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gestionAlea is
    Port ( diOP, exOP : in STD_LOGIC_VECTOR (7 downto 0);
           diA, exA : in STD_LOGIC_VECTOR (7 downto 0);
           liINS : in STD_LOGIC_VECTOR (31 downto 0);
           alea_di, alea_ex : out STD_LOGIC);
end gestionAlea;

architecture Behavioral of gestionAlea is

signal read_li1, write_di1, write_ex1 : STD_LOGIC := '0';

begin

process(liINS, diOP, exOP)
variable read_li, write_di, write_ex : STD_LOGIC := '0';
variable liB, liC, liOP: STD_LOGIC_VECTOR (7 downto 0);
begin
    --alea_di <= '0';
    --alea_ex <= '0';
    liC := liINS(7 downto 0);
    liB := liINS(15 downto 8);
    liOP := liINS(31 downto 24);
    
    if liOP = X"01" or liOP = X"02" or liOP = X"03" or liOP = X"04" or liOP = X"05" or liOP = X"08" then read_li := '1'; else read_li := '0'; end if;
    if diOP = X"01" or diOP = X"02" or diOP = X"03" or diOP = X"04" or diOP = X"05" or diOP = X"06" or diOP = X"07" then write_di := '1'; else write_di := '0'; end if;
    if exOP = X"01" or exOP = X"02" or exOP = X"03" or exOP = X"04" or exOP = X"05" or exOP = X"06" or exOP = X"07" then write_ex := '1'; else write_ex := '0'; end if;
    
    if read_li = '1' and write_di = '1' and (diA = liB or diA = liC) then 
        alea_di <= '1';
    else alea_di <= '0';
    end if;
    
    if read_li = '1' and write_ex = '1' and (exA = liB or exA = liC) then--  
            alea_ex <= '1';
    else alea_ex <= '0';
    end if;
    
    read_li1 <= read_li;
    write_di1 <= write_di;
    write_ex1 <= write_ex;

end process;

end Behavioral;
