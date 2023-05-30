----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2023 15:59:10
-- Design Name: 
-- Module Name: MUX - Behavioral
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

entity MUX1 is
    Port ( --CLK : in STD_LOGIC;
           OP : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           QA : in STD_LOGIC_VECTOR (7 downto 0);
           OUTMX : out STD_LOGIC_VECTOR (7 downto 0));
end MUX1;

architecture Behavioral of MUX1 is

begin
    process (OP, B, QA)
    begin
        
        if OP = X"06" or OP = X"07"  then
            OUTMX <= B;
        elsif OP = X"01" or OP = X"02" or OP = X"03" or OP = X"04" or OP = X"05" or OP = X"08" then
            OUTMX <= QA;
        end if;
    end process;
end Behavioral;
