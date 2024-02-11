----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:58:35 01/07/2020 
-- Design Name: 
-- Module Name:    digpr4top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.1 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity digpr4top is

PORT(     SEL:	IN	STD_LOGIC_VECTOR(1 DOWNTO 0); 
        
          GPIO22	:	IN	STD_LOGIC;  -- bit 3 for the output select 
          P	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          LED	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          Lid	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          RstN	:	IN	STD_LOGIC; 
          D	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
			 -- inputs from on board PMOD connector
 			 PextP	:	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 
			 PextN   :	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 			 
          GPIO15	:	IN	STD_LOGIC;  -- data valid for the D input of the pulse generator
			 GPIO18	:	IN	STD_LOGIC;   -- counter reset 
			 --next two names are used for compatibility but select the input source for the counters
			 clk3  	:	IN	STD_LOGIC;
			 GPIO14  	:	IN	STD_LOGIC;
          SYSCLK	:	IN	STD_LOGIC;
			 -- outputs to check the inputs for the pulsers 
          Pout   :  OUT STD_LOGIC_Vector(3 downto 0)
			 );

end digpr4top;

architecture Behavioral of digpr4top is

 
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";

	signal clk4M    : std_logic;
   signal CLK100   : std_logic;
   signal CNTCLR   : std_logic;
   signal D0       : std_logic_vector (15 downto 0);
   signal D1       : std_logic_vector (15 downto 0);
   signal D2       : std_logic_vector (15 downto 0);
   signal D6       : std_logic_vector (7 downto 0);
	signal D0LB      : std_logic_vector (7 downto 0);
	signal D0HB      : std_logic_vector (7 downto 0);
   signal D1LB       : std_logic_vector (7 downto 0);
	signal D1HB       : std_logic_vector (7 downto 0);
   signal D2LB       : std_logic_vector (7 downto 0);
	signal D2HB       : std_logic_vector (7 downto 0);
   signal RST      : std_logic;
	signal CNT1_CE , Qff1_2,Qff1_1: std_logic;
	signal CNT2_CE , Qff2_2,Qff2_1 , COIN: std_logic;
   signal CNT3_CE , Qff3_2,Qff3_1: std_logic;
	signal Pext	:	STD_LOGIC_VECTOR (1 DOWNTO 0); 

-- input select 
	signal Cnt1In, Cnt2In :  std_logic;
	signal InpSel     : std_logic_vector (1 downto 0);

begin

-- the input signals 
-- diff to single 

P0_IBUFDS : IBUFDS
 -- generic map(
 --   IOSTANDARD => "DEFAULT"
 -- )
  port map(
    I  => PextP(0),
    IB => PextN(0),
    O  => Pext(0)
	 );



P1_IBUFDS : IBUFDS
--  generic map(
--    IOSTANDARD => "DEFAULT"
 -- )
  port map(
    I  => PextP(1),
    IB => PextN(1),
    O  => Pext(1)
	 );




RST <= not RstN	;

CNTCLR <= RST OR GPIO18;

clksrc1 : entity  work.clksrc
  port map
   (-- Clock in ports
    CLK_IN1 => SYSCLK,
    -- Clock out ports
    CLK_OUT1 => CLK100,
    CLK_OUT2 => open,
    CLK_OUT3 => clk4M,
    -- Status and control signals
    RESET  => RST,
    LOCKED => open);

InpSel(0) <= clk3;
InpSel(1) <= GPIO14;
Cnt1In <= Pext(0)  when InpSel="11" else  D6(0) when InpSel="01"  else D(0);
Cnt2In <= Pext(1)  when InpSel="11" else  D6(1) when InpSel="01"  else D(1);

Pout(0) <= Cnt1In ;
Pout(1) <= Cnt2In ;	 
Pout(2) <= COIN;

ff1_1 : FD
      port map (C=>CLK100,
                D=>Cnt1In,
                Q=>Qff1_1);
   
ff1_2 : FD
      port map (C=>CLK100,
                D=>Qff1_1,
                Q=>Qff1_2);
					 
CNT1_CE <= (not  Qff1_2 )  and  (Qff1_1 and  D(2));
d6(5) <= CNT1_CE;
count1  : entity work.counter
      port map (C=>CLK100,
                CE=>CNT1_CE,
                CLR=>CNTCLR,
                Q=>D0
              );

COIN <= Cnt1In and Cnt2In;

ff2_1 : FD
      port map (C=>CLK100,
                D=> COIN,
                Q=>Qff2_1);
   
ff2_2 : FD
      port map (C=>CLK100,
                D=>Qff2_1,
                Q=>Qff2_2);
CNT2_CE <= ( NOT Qff2_2)  AND  Qff2_1 AND  D(2);
d6(6) <=CNT2_CE ;

count2  : entity work.counter
      port map (C=>CLK100,
                CE=>CNT2_CE,
                CLR=>CNTCLR,               
                Q=>D1      );

ff3_1 : FD
      port map (C=>CLK100,
                D=>Cnt2In,
                Q=>Qff3_1);
  
ff3_2 : FD
      port map (C=>CLK100,
                D=>Qff3_1,
                Q=>Qff3_2);
CNT3_CE <= ( NOT Qff3_2)  AND  Qff3_1 AND  D(2);
d6(7) <= CNT3_CE;
count3  : entity work.counter
      port map (C=>CLK100,
                CE=>CNT3_CE,
                CLR=>CNTCLR,            
                Q=>D2);




 pulsgen1  : entity work.pulsegen
      port map (clk=>clk4M,
                D=>D,
                RST=>RST,
                WE=>GPIO15,
                PAND=>D6(2),
                P1=>D6(0),
                P2=>D6(1),
                zbar1=>D6(3),
                zbar2=>D6(4));
					 
D0LB <= 	 D0(7 downto 0);
D0HB <= 	 D0(15 downto 8);
D1LB <= 	 D1(7 downto 0);
D1HB <= 	 D1(15 downto 8);
D2LB <= 	 D2(7 downto 0);
D2HB <= 	 D2(15 downto 8);


outmux :  entity work.mux4_8_1 
     port map (D0 =>D0LB,
                D1=>D0HB,
                D2=>D1LB,
                D3=>D1HB,
                D4=>D2LB,
                D5=>D2HB,
                D6=>D6,
                sel0=>SEL(0),
                sel1=>SEL(1),
                sel2=>GPIO22,
                LED=>LED,
                P =>P
					 );
   
ledid1 : entity work.ledid 
		port map ( clk => clk4M,
					 Lid =>Lid);
 





end Behavioral;

