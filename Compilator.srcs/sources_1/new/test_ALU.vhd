----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2023 17:27:05
-- Design Name: 
-- Module Name: test_ALU - Behavioral
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

entity test_ALU is
end test_ALU;

architecture Behavioral of test_ALU is

component ual is
  Port (   A, B : in STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (2 downto 0);
           N, O, Z, C : out STD_LOGIC := '0';
           S : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal A, B, S : STD_LOGIC_VECTOR (7 downto 0);
signal Ctrl_Alu : STD_LOGIC_VECTOR (2 downto 0);
signal N, O, Z, C : STD_LOGIC;

begin

ALU_test: ual PORT MAP (
    A => A, 
    B => B,
    Ctrl_Alu => Ctrl_Alu,
    N => N,
    O => O,
    Z => Z,
    C => C,
    S => S
);


-- Stimulus process
    stimulus_proc: process
    begin
        -- Test case 1: Addition
        A <= "00000001";
        B <= "00000011";
        Ctrl_Alu <= "001";
        wait for 10 ns;

        -- Test case 2: Subtraction
        A <= "00000100";
        B <= "00000010";
        Ctrl_Alu <= "011";
        wait for 10 ns;

        -- Test case 3: Multiplication
        A <= "00000011";
        B <= "00000110";
        Ctrl_Alu <= "010";
        wait for 10 ns;

        -- Add more test cases as needed

        -- End simulation
        wait;
    end process;

end Behavioral;
