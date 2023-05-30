----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.05.2023 16:42:31
-- Design Name: 
-- Module Name: test_gestionAlea - Behavioral
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

entity test_gestionAlea is
--  Port ( );
end test_gestionAlea;

architecture Behavioral of test_gestionAlea is

component gestionAlea
    Port ( diOP, exOP : in STD_LOGIC_VECTOR (7 downto 0);
           diA, exA : in STD_LOGIC_VECTOR (7 downto 0);
           liINS : in STD_LOGIC_VECTOR (31 downto 0);
           alea_di, alea_ex : out STD_LOGIC);
end component;

signal diOP, exOP, diA, exA : STD_LOGIC_VECTOR (7 downto 0);
signal liINS : STD_LOGIC_VECTOR (31 downto 0);
signal alea_di, alea_ex : STD_LOGIC;

begin

GAlea : gestionAlea port map (
liINS => liINS, 
diOP => diOP, 
exOP => exOP,  
diA => diA, 
exA => exA, 
alea_di => alea_di, 
alea_ex => alea_ex
);

stimulGA_proc: process
    begin
        -- Test 1;
        liINS <= (X"05120100");
        diOP <= X"06";
        diA <= X"01";
        
        wait for 10 ns;        
        liINS <= (others => '0');
        diOP <= X"00";
        exOP <= X"00";
        diA <= X"00";
        exA <= X"00";
        wait for 10 ns;
        
        -- Test 2
        liINS <= X"05120200";
        diOP <= X"00";
        exOP <= X"06";
        diA <= X"00";
        exA <= X"02";
        wait for 10 ns;
        
        liINS <= (others => '0');
        diOP <= X"00";
        exOP <= X"00";
        diA <= X"00";
        exA <= X"00";
                
        wait;
    end process;

end Behavioral;
