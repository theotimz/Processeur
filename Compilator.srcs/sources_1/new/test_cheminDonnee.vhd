----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2023 09:03:32
-- Design Name: 
-- Module Name: test_cheminDonnee - Behavioral
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

entity test_cheminDonnee is
--  Port ( );
end test_cheminDonnee;

architecture Behavioral of test_cheminDonnee is

component cheminDonnees is
  Port ( CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Aout, OPout, Bout, Cout : out STD_LOGIC_VECTOR (7 downto 0));--Bout
end component;

signal CLK, RST : STD_LOGIC := '1';
constant Clock_period: time := 10ns;
signal Aout, OPout, Bout, Cout : STD_LOGIC_VECTOR (7 downto 0);

begin

Label_uut: cheminDonnees PORT MAP (
    CLK => CLK, 
    RST => RST, 
    Aout => Aout, 
    OPout => OPout, 
    Bout => Bout,
    Cout => Cout
);

Clock_process: process
begin
    CLK <= not(CLK);
    wait for Clock_period/2;
end process;

RST <= '1';--, '1' after 60 ns;

end Behavioral;
