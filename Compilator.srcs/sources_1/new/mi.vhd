----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2023 14:03:23
-- Design Name: 
-- Module Name: mi - Behavioral
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

entity mi is
    Port (  
        ip : in STD_LOGIC_VECTOR (7 downto 0);
        outA : out STD_LOGIC_VECTOR (7 downto 0);
       outOP : out STD_LOGIC_VECTOR (7 downto 0);
       outB : out STD_LOGIC_VECTOR (7 downto 0);
       outC : out STD_LOGIC_VECTOR (7 downto 0)
    );
   
    
end mi;

architecture Behavioral of mi is

begin
    variable ip1 : integer;
    variable ip2 : integer;
    ip1 := 0;
    ip2 := ip;
    
    subtype INDEX1 is INTEGER range 0 to 63;
        type VECTEUR1 is array (INDEX1) of STD_LOGIC_VECTOR(3 downto 0);
        signal memIns : VECTEUR1(INDEX1);
    memIns[ip2-ip1]

end Behavioral;
