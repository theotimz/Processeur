----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2023 14:33:55
-- Design Name: 
-- Module Name: LC - Behavioral
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

entity LC is
    Port ( OPin : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           OP : out STD_LOGIC);
end LC;

architecture Behavioral of LC is

begin

process(OPin) --synchro
begin
    --if rising_edge(CLK) then
        if OPin = X"01" or OPin = X"02" or OPin = X"03" or OPin = X"05" or OPin = X"06" or OPin = X"07" then
            OP <= '1';
        else 
            OP <= '0';
        end if;
    --end if;
end process;

end Behavioral;
