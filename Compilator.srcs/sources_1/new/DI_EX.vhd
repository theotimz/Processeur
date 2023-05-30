----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2023 11:21:00
-- Design Name: 
-- Module Name: DI_EX - Behavioral
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

entity DI_EX is
    Port ( CLK : in STD_LOGIC;
           Ain, OPin, Bin, Cin: in STD_LOGIC_VECTOR (7 downto 0);
           A, OP, B, C : out STD_LOGIC_VECTOR (7 downto 0));
end DI_EX;

architecture Behavioral of DI_EX is
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            A <= Ain;
            B <= Bin;
            C <= Cin;
            OP <= OPin;
        end if;
    end process;
end Behavioral;

