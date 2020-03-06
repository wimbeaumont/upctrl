----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:58:35 01/07/2020 
-- Design Name: 
-- Module Name:    digpr3top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

use work.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity digpr4difftop is

PORT(     SEL:	IN	STD_LOGIC_VECTOR(1 DOWNTO 0); 
        
          GPIO22	:	IN	STD_LOGIC; --sel for out mux 
			 clk1    :  IN	STD_LOGIC; -- sel for out mux 
          P	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          LED	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          Lid	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          RstN	:	IN	STD_LOGIC; 
          D	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
			 -- inputs from on board PMOD connector
			 PextP	:	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 
			 PextN   :	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 
          GPIO15	:	IN	STD_LOGIC; 
			 GPIO18	:	IN	STD_LOGIC;
			 --next two names are used for compatibility but select the input source for the counters
			 clk3  	:	IN	STD_LOGIC;  --aliased to start 
			 GPIO14  	:	IN	STD_LOGIC; -- aliased to data valid 
			 Mon :  		OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- monitor signals 
          SYSCLK	:	IN	STD_LOGIC);
          

end digpr4difftop;

architecture Behavioral of digpr4difftop is
	
	constant CSIZE : integer :=16;
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
   signal D0       : std_logic_vector (CSIZE-1 downto 0);
   signal D1       : std_logic_vector (CSIZE-1 downto 0);
   signal D2       : std_logic_vector (CSIZE-1 downto 0);
   signal D6       : std_logic_vector (CSIZE-1 downto 0);
	
   signal RST      : std_logic;
	signal CNT1_CE , Qff1_2,Qff1_1: std_logic;
	signal CNT2_CE , Qff2_2,Qff2_1 , COIN: std_logic;
   signal CNT3_CE , Qff3_2,Qff3_1: std_logic;
   signal CountEn :std_logic;

	signal Cnt1In, Cnt2In :  std_logic;

	signal Pext	:	STD_LOGIC_VECTOR (1 DOWNTO 0); 
	alias datavalid 	:	STD_LOGIC is GPIO14  ;
	alias start  	:	STD_LOGIC is clk3  ;
	signal TimeWinHigh ,TimeWinLow ,Settings  :  STD_LOGIC_VECTOR (7 downto 0);
	signal byte_sel : STD_LOGIC_VECTOR(1 downto 0);
   signal Qff3_3 ,Qff1_3 , Pulse1, Pulse2, Pand : STD_LOGIC;  
begin


byte_sel(0) <= GPIO22;
byte_sel(1) <=clk1 ;

-- system setup 

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



settingsreg : entity work.Reg_4 
	generic map ( D_WIDTH => D'LENGTH, RSTLVL  =>'1'  )
    Port map ( 	
				Q0    => TimeWinLow,
				Q1    => TimeWinHigh,
				Q2    => Settings,
				Q3    => open,
				D     => D,
				S0    => SEL, -- shared with the ouput mux !!! 
				load  => datavalid,
				clk   => CLK100,
				rst   => rst
			);

timewindow1 : entity work.timewindow
   Port map  ( clk  => clk4M,
					rst =>  RST,
					TwHigh =>  TimeWinHigh ,
					TwLow => TimeWinLow ,
					start => start,
					WinActive => CountEn
				);	
Mon(3) <=CountEn;
D6(4) <= CountEn;

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


Cnt1In <=  Pext(0);  
Cnt2In <= not Pext(1);  --invert as it is mirrored on the connectors
Mon(0) <= Cnt1In;
Mon(1) <= Cnt2In;
-- the counters 
	 
ff1_1 : FD
      port map (C=>CLK100,
                D=>Cnt1In,
                Q=>Qff1_1);
   
ff1_2 : FD
      port map (C=>CLK100,
                D=>Qff1_1,
                Q=>Qff1_2);


ff1_3 : FD
      port map (C=>CLK100,
                D=>Qff1_2,
                Q=>Qff1_3);

Pulse1 <= (not  Qff1_3 )  and  (Qff1_1 and Qff1_2);					 
					 
CNT1_CE <= (not  Qff1_2 )  and  (Qff1_1 and  CountEn);
d6(5) <= CNT1_CE;
count1  : entity work.counter
		generic map ( CWIDTH  => CSIZE)
      port map (C=>CLK100,
                CE=>CNT1_CE,
                CLR=>CNTCLR,
                Q=>D0
              );

COIN <= (Cnt1In and Cnt2In)  when Settings(0) ='0' else Pand;
Mon(2) <= COIN;

ff2_1 : FD
      port map (C=>CLK100,
                D=> COIN,
                Q=>Qff2_1);
   
ff2_2 : FD
      port map (C=>CLK100,
                D=>Qff2_1,
                Q=>Qff2_2);
					 
					 
CNT2_CE <= ( NOT Qff2_2)  AND  Qff2_1 AND  CountEn;
d6(6) <=CNT2_CE ;

count2  : entity work.counter
		generic map( CWIDTH  => CSIZE)
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
					 
ff3_3 : FD
      port map (C=>CLK100,
                D=>Qff3_2,
                Q=>Qff3_3);					 
					 
Pulse2 <= (not  Qff3_3 )  and  (Qff3_1 and Qff3_2);					 					 
Pand <= Pulse1 and Pulse2;

CNT3_CE <= ( NOT Qff3_2)  AND  Qff3_1 AND  CountEn;

d6(7) <= CNT3_CE;

count3  : entity work.counter
		generic map ( CWIDTH  => CSIZE)
      port map (C=>CLK100,
                CE=>CNT3_CE,
                CLR=>CNTCLR,            
                Q=>D2);




D6(3 downto 0) <= "0101"; -- use as version 
D6(CSIZE-1 downto 8) <= (others => '0');

outmux :  entity work.mux4_8_1 
	  Generic map ( DSIZE => CSIZE ) 
     port map (D0 =>D0,
                D1=>D1,
                D2=>D2,
                D3=>D6,                				
                sel=>SEL,
                byte_sel => byte_sel,             
                LED=>LED,
                P =>P
					 );
   
ledid1 : entity work.ledid 
		port map ( clk => clk4M,
					 Lid =>Lid);
 





end Behavioral;

