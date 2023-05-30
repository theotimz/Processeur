----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2023 12:43:10
-- Design Name: 
-- Module Name: ual - Behavioral
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
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ual is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (2 downto 0);
           N : out STD_LOGIC := '0';
           O : out STD_LOGIC := '0';
           Z : out STD_LOGIC := '0';
           C : out STD_LOGIC := '0';
           S : out STD_LOGIC_VECTOR (7 downto 0));
end ual;

architecture Behavioral of ual is 
--signal result: STD_LOGIC_VECTOR (8 downto 0);

--signal mult: STD_LOGIC_VECTOR (15 downto 0);
--signal result1: STD_LOGIC_VECTOR (17 downto 0);
--signal coucou: STD_LOGIC_VECTOR (17 downto 0):= (others => '1');
begin

process(A, B, Ctrl_Alu)

variable auxA,auxB: STD_LOGIC_VECTOR (15 downto 0);
variable result: STD_LOGIC_VECTOR (15 downto 0);

begin
    auxA := "00000000" & A;
    auxB := "00000000" & B;
    if Ctrl_Alu = "001" then
       result := auxA + auxB;
    elsif Ctrl_Alu = "011" then
        result := auxA - auxB;
    elsif Ctrl_Alu = "010" then
        --mult <= A * B;
        --result <= mult(8 downto 0);
        result := A * B;
    else
        result := (others => '0');
        
    end if;
    S <= std_logic_vector(result(7 downto 0));
    --S <= X"00";
    
    if result = "000000000" then 
        Z <= '1';
    elsif result < "000000000" then 
        N <= '1';
     elsif result(8) = '1' then 
        O <= '1';
     elsif  Ctrl_Alu = "001" and result(8) = '1' then
        C <= '1';
      end if;
      
end process;


end Behavioral;
