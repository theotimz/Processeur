----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2023 13:56:13
-- Design Name: 
-- Module Name: bancRegistre - Behavioral
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

entity bancRegistre is
    Port ( aA : in STD_LOGIC_VECTOR (3 downto 0);
           aB : in STD_LOGIC_VECTOR (3 downto 0);
           aW : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end bancRegistre;



architecture Behavioral of bancRegistre is
    type VECTEUR1 is array (0 to 15) of std_logic_vector(7 downto 0);
    signal regs:VECTEUR1 := ("00001110", "00001000", others => (others => '0')); --"00000111", "00000010", 

    
begin
  

    process(clk)
    begin
        if rising_edge(clk) then
            if RST = '0' then
                regs <= (others => (others => '0'));
            elsif W = '1' then
                regs(to_integer(unsigned(aW))) <= DATA;
            end if;
        end if;
    end process;
    
    -- Bypass D -> Q
    process(clk)
    begin
      if falling_edge(clk) then
          QA <= regs(to_integer(unsigned(aA)));
          QB <= regs(to_integer(unsigned(aB)));
      end if;
        if rising_edge(clk) then
            if W = '1' and (aA = aW) then
                QA <= DATA;
            end if;
            if W = '1' and (aB = aW) then
                QB <= DATA;
            end if;
        end if;
       
    end process;
end Behavioral;
