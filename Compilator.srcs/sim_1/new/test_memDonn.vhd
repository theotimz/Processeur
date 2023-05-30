----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2023 20:42:18
-- Design Name: 
-- Module Name: test_memDonn - Behavioral
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

entity test_memDonn is
--  Port ( );
end test_memDonn;

architecture Behavioral of test_memDonn is

component memDonn is
  Port (   adr, INMD : in STD_LOGIC_VECTOR (7 downto 0);
           RW, RST, CLK: in STD_LOGIC;
           OUTMD: out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal adr, INMD, OUTMD : STD_LOGIC_VECTOR (7 downto 0);
signal RW, RST, CLK : STD_LOGIC;

begin

memD_test: memDonn PORT MAP (
    CLK => CLK, 
    RST => RST,
    RW => RW, 
    adr => adr, 
    INMD => INMD, 
    OUTMD => OUTMD
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
	   adr <= "00000000", "00000001" after 30 ns;  	-- Address of register to write
       INMD <= "00000101", "00000010" after 20 ns; 
	   while now < 1000 ns loop
          RW <= '0';
          wait for 15 ns;
          RW <= '1';
          wait for 15 ns;
       end loop;
       wait;
    end process;

	-- Test scenario
	

end Behavioral;
