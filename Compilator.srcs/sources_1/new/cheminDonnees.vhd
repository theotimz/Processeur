----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2023 10:17:10
-- Design Name: 
-- Module Name: cheminDonnees - Behavioral
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

entity cheminDonnees is
  Port ( CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Aout, OPout, Bout, Cout : out STD_LOGIC_VECTOR (7 downto 0));--Bout
end cheminDonnees;

architecture struct of cheminDonnees is

component compteurIP
    Port ( CLK, diAlea, exAlea : in STD_LOGIC;
           IPcmp : inout STD_LOGIC_VECTOR (7 downto 0);
           IP: out STD_LOGIC_VECTOR (7 downto 0));
end component;
component memIns
port( adr : in STD_LOGIC_VECTOR (7 downto 0);
       CLK, diAlea, exAlea : in STD_LOGIC;
       OUTMI: out STD_LOGIC_VECTOR (31 downto 0));
end component;
component memDonn
    Port ( adr, INMD: in STD_LOGIC_VECTOR (7 downto 0);
       RW, RST, CLK: in STD_LOGIC;
       OUTMD: out STD_LOGIC_VECTOR (7 downto 0));
end component;
component ual
    Port ( A, B : in STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (2 downto 0);
           N, O, Z, C : out STD_LOGIC := '0';
           S : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component bancRegistre
    Port ( aA, aB, aW : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST, CLK : in STD_LOGIC;
           QA, QB : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component LI_DI
    Port ( CLK, diAlea, exAlea: in STD_LOGIC;
           INS : in STD_LOGIC_VECTOR (31 downto 0);
           A, OP, B, C : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component DI_EX
    Port ( CLK: in STD_LOGIC;
           Ain, OPin, Bin, Cin: in STD_LOGIC_VECTOR (7 downto 0);
           A, OP, B, C : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component etageMem
    Port ( CLK: in STD_LOGIC;
           Ain, OPin, Bin : in STD_LOGIC_VECTOR (7 downto 0);
           A, OP, B : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component LC
    Port ( CLK: in STD_LOGIC;
           OPin : in STD_LOGIC_VECTOR (7 downto 0);
           OP : out STD_LOGIC );
end component;
component MUX1
    Port ( OP, B, QA : in STD_LOGIC_VECTOR (7 downto 0);
           OUTMX : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component MUX2
    Port ( OP, B, S : in STD_LOGIC_VECTOR (7 downto 0);
           OUTMX : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component MUX3
    Port ( A, B, OP : in STD_LOGIC_VECTOR (7 downto 0);
           OUTMux : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component MUX4 is
    Port ( B, OP, OUTMD : in STD_LOGIC_VECTOR (7 downto 0);
           OUTMux : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component gestionAlea
    Port ( diOP, exOP : in STD_LOGIC_VECTOR (7 downto 0);
           diA, exA : in STD_LOGIC_VECTOR (7 downto 0);
           liINS : in STD_LOGIC_VECTOR (31 downto 0);
           alea_di, alea_ex : out STD_LOGIC);
end component;


--signal CLK, RST : STD_LOGIC:='1';
signal Ali, OPli, Bli, Cli : STD_LOGIC_VECTOR(7 downto 0);
signal Adi, OPdi, Bdi, Cdi : STD_LOGIC_VECTOR(7 downto 0);
signal Ame, OPme, Bme : STD_LOGIC_VECTOR(7 downto 0);
signal Are, OPre, Bre : STD_LOGIC_VECTOR(7 downto 0);
signal OPlc1 : STD_LOGIC;

signal INS : STD_LOGIC_VECTOR(31 downto 0);
signal IP, IPcmp : STD_LOGIC_VECTOR(7 downto 0) := "00000000";


signal QA, QB, SAlu : STD_LOGIC_VECTOR(7 downto 0);
signal OUTMX1, OUTMX2, OUTMD,OUTMUX3, OUTMUX4 : STD_LOGIC_VECTOR(7 downto 0);

signal diAlea, exAlea : STD_LOGIC;


signal cmpt : integer;
begin


MemInstr : memIns port map(CLK => CLK, diAlea => diAlea, exAlea => exAlea, adr => IP, OUTMI => INS);

LiDi : LI_DI port map(CLK => CLK, diAlea => diAlea, exAlea => exAlea, INS => INS, A => Ali, OP => OPli, B => Bli, C => Cli);

bRegistre : bancRegistre port map (CLK => CLK, RST => RST, aA => Bli(3 downto 0), aB => Cli(3 downto 0), aW => Are(3 downto 0), W => OPlc1, DATA=>Bre, QA => QA, QB => QB);

multiplex1 : MUX1 port map (OP => OPli, B => Bli, QA => QA, OUTMX => OUTMX1);

DiEx : DI_EX port map (CLK => CLK, Ain => Ali, OPin => OPli, Bin => OUTMX1, Cin => QB, A => Adi, OP => OPdi, B => Bdi, C => Cdi);

ALU : ual port map (A => Bdi, B => Cdi, Ctrl_Alu => OPdi(2 downto 0), S => SAlu);

multiplex2 : MUX2 port map (OP => OPdi, B => Bdi, S => SAlu, OUTMX => OUTMX2);

ExMem : etageMem port map (CLK => CLK, Ain => Adi, OPin => OPdi, Bin => OUTMX2, A => Ame, OP => OPme, B => Bme);

multiplex3 : MUX3 port map (A => Ame, OP => OPme, B => Bme, OUTMux => OUTMUX3);

MDonne :memDonn port map (CLK => CLK, RST => RST, adr => OUTMUX3, INMD => Bme, RW => OPme(0), OUTMD => OUTMD);

multiplex4 : MUX4 port map (OP => OPme, B => Bme, OUTMD => OUTMD, OUTMux => OUTMUX4);

MemRE : etageMem port map (CLK => CLK, Ain => Ame, OPin => OPme, Bin => OUTMUX4, A => Are, OP => OPre, B => Bre);

LCop1 : LC port map ( CLK => CLK, OPin => OPre, OP => OPlc1);

GAlea : gestionAlea port map (liINS => INS, diOP => OPli, exOP => OPdi, diA => Ali, exA => Adi, alea_di => diAlea, alea_ex => exAlea);



IP_process: process(CLK)    
variable compteur : integer :=0;
begin
    
    if rising_edge(CLK) then
        if diAlea = '0' and exAlea = '0' and compteur = 0 then

            IP <= std_logic_vector(unsigned(IP) + 1);            
            
        elsif diAlea = '1' then
            compteur :=6;
            IP <= std_logic_vector(unsigned(IP) - 1); 
            
        elsif exAlea = '1' then
            compteur :=4;
            IP <= std_logic_vector(unsigned(IP) - 1); 
           
        end if;
    end if;
    cmpt <= compteur;
    if compteur > 0 then compteur := compteur - 1; end if;
end process;


end struct;
