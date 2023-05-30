----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2023 18:15:06
-- Design Name: 
-- Module Name: test_bancRegistre - Behavioral
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

entity test_bancRegistre is
--  Port ( );
end test_bancRegistre;

architecture Behavioral of test_bancRegistre is

component bancRegistre is
  Port ( aA, aB, aW : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST, CLK : in STD_LOGIC;
           QA, QB : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal CLK, RST : STD_LOGIC;
constant Clock_period: time := 10ns;
signal aA, aB, aW : STD_LOGIC_VECTOR (3 downto 0);
signal DATA, QA, QB : STD_LOGIC_VECTOR (7 downto 0);
signal W : STD_LOGIC;

begin

Label_uut: bancRegistre PORT MAP (
    CLK => CLK, 
    RST => RST, 
    aA => aA, 
    aB => aB, 
    aW => aW,
    W => W,
    DATA => DATA,
    QA => QA,
    QB => QB
);

-- Clock generation
	process
	begin
    	while now < 1000 ns loop
        	CLK <= '0';
        	wait for 5 ns;
        	CLK <= '1';
        	wait for 5 ns;
    	end loop;
    	wait;
	end process;
	
	process
	begin
	   RST<= '1', '0' after 60 ns;
	   while now < 1000 ns loop
          W <= '0';
          wait for 15 ns;
          W <= '1';
          wait for 15 ns;
       end loop;
       wait;
    end process;

	-- Test scenario
	stimulus_proc: process
	begin
    	--RST<= '0', '1' after 20 ns; -- Deactivate reset
    	--W <= '0', '1' after 20 ns;   -- Enable write

    	-- Write data to register 0
    	aW <= "0000";  	-- Address of register to write
    	DATA <= "00000101"; -- Data to write
    	wait for 10 ns;

    	-- Write data to register 1
    	aW <= "0001";  	-- Address of register to write
    	DATA <= "00000010"; -- Data to write
    	wait for 10 ns;

    	-- Read data from registers
    	--W <= '0';     	-- Disable write
    	aA <= "0000"; 	-- Address of register to read from QA
    	aB <= "0001"; 	-- Address of register to read from QB

	end process;



end Behavioral;
