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

entity memDonn is
    Port ( adr : in STD_LOGIC_VECTOR (7 downto 0);
           INMD : in STD_LOGIC_VECTOR (7 downto 0);
           RW: in STD_LOGIC;
           RST: in STD_LOGIC;
           CLK : in STD_LOGIC;
           OUTMD: out STD_LOGIC_VECTOR (7 downto 0));
end memDonn;

architecture Behavioral of memDonn is
    type VECTEUR1 is array (0 to 63) of STD_LOGIC_VECTOR(7 downto 0);
    signal mDonnees : VECTEUR1 := (X"0a", X"0b", X"0c", others => (others => '0'));
begin
process(CLK)
begin

--LECTURE
if falling_edge(CLK) then
    if RW = '1' then
            OUTMD <= mDonnees(to_integer(unsigned(adr)));
    end if;
end if;

if rising_edge(CLK) then     
    --RESET
    if RST = '0' then
        mDonnees <= (others => (others => '0'));
    end if;
    
    --ECRITURE
    if RW = '0' then
        mDonnees(to_integer(unsigned(adr))) <= INMD;
    end if;
end if;

end process;

end Behavioral;
