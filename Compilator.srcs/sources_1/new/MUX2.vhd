----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2023 16:43:22
-- Design Name: 
-- Module Name: MUX2 - Behavioral
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

entity MUX2 is
    Port ( B : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (7 downto 0);
           OP : in STD_LOGIC_VECTOR (7 downto 0);
           OUTMX : out STD_LOGIC_VECTOR (7 downto 0));
end MUX2;

architecture Behavioral of MUX2 is

begin
    process (OP, S, B)
    begin
    
        if OP = X"05" or OP = X"06" or OP = X"07" or OP = X"08" then
            OUTMX <= B;
        else
            OUTMX <= S;
        end if;
    end process;

end Behavioral;
