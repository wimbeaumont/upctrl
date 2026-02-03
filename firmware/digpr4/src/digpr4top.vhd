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
-- Revision 1.0 - with differential inputs  mrt 2022
-- Revision 1.1 - introduced pulse counter
-- Additional Comments: 
-- registers :( 8 bits) 
-- 00 : timewindowLow 
-- 01 : timewindowHigh
-- 10 : Settings
-- 11 : internal  pulser divider 
-- settings ( register Q2 output ) 
-- S0 == cnt2 (the and)  input  if  S0=0 cnt1 and cnt 2 , else Pand ( Pulse And)
-- S1,S2  :  cnt 1, 3 input x0 : RP input , 11 Pext  , 01 :internal pulser
-- S3 =1  : timewindow always 1 
-- S4 =1  invert Pext0 
-- S5 =1  invert Pext1  
-- diff connections : 

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
GENERIC ( COUNTSIZE : integer := 16);
PORT(    
	-- output MUX 
	SEL:	IN	STD_LOGIC_VECTOR(1 DOWNTO 0); -- select signals for  the output mux 
   GPIO22	:	IN	STD_LOGIC; --byte_sel(0) for the out mux 
	clk1    :  IN	STD_LOGIC; -- byte_sel(1) for out mux 
	
	P	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);  -- output port to the RP
   LED	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); -- output port to the LED
	---------------
	
	D	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0);  -- data input 
	-- pulse inputs from on board PMOD connector
	PextP	:	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 
	PextN   :	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 
	--------------		 
   GPIO15	:	IN	STD_LOGIC;   -- counter reset 
	--next two names are used for compatibility but select the input source for the counters
	clk3  	:	IN	STD_LOGIC; --  start the time window
	GPIO14  	:	IN	STD_LOGIC; --  data valild for writing to the register
	
	RstN	:	IN	STD_LOGIC; 			
	SYSCLK	:	IN	STD_LOGIC;
			 
			 -- outputs to check the inputs for the pulsers  on PMOD JA 
   Pout   :  OUT STD_LOGIC_Vector(3 downto 0);
	Lid	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0);  -- ID LEDS 
	-- debug sigals on PMOD JE 
	PoutAdd  : OUT STD_LOGIC_Vector(5 downto 0)
	 );

end digpr4top;



architecture Behavioral of digpr4top is

	signal CLK4    : std_logic;
   signal CLK100   : std_logic;
   signal CNTCLR   : std_logic;
	signal COIN		 : std_logic;
   signal D0       : std_logic_vector (COUNTSIZE-1 downto 0);-- cnt1
   signal D1       : std_logic_vector (COUNTSIZE-1 downto 0);-- cnt2
   signal D2       : std_logic_vector (COUNTSIZE-1 downto 0);-- coin cnt
   signal D6       : std_logic_vector (COUNTSIZE-1 downto 0);-- status bits 
   signal RST      : std_logic;
	signal Pext	:	STD_LOGIC_VECTOR (1 DOWNTO 0);  -- eventual inverted 
	signal Pext_D	:	STD_LOGIC_VECTOR (1 DOWNTO 0); -- direct from diff input 
	signal byte_sel : STD_LOGIC_VECTOR(1 downto 0);
	signal TimeWinHigh ,TimeWinLow ,Settings,PulsgenIn  :  STD_LOGIC_VECTOR (7 downto 0);
	signal CntWinEn, Pulse1, Pulse2, Pand ,TWinAct: STD_LOGIC;
-- input select 
	signal Cnt1In, Cnt2In :  std_logic;
	signal InpSel     : std_logic_vector (1 downto 0);
	alias start  	:	STD_LOGIC is clk3  ;
	alias datavalid 	:	STD_LOGIC is GPIO14  ;
	alias CNTCLK : STD_LOGIC is CLK100  ;
begin

D6(15 downto 11) <= "00001";

byte_sel(0) <= GPIO22;
byte_sel(1) <=clk1 ;

-- the input signals 
-- diff to single 

P0_IBUFDS : IBUFDS
 -- generic map(   IOSTANDARD => "DEFAULT" )
  port map(  I  => PextP(0),IB => PextN(0), O  => Pext_D(0) );

Pext(0) <=  Pext_D(0) when settings(4) = '0' else  not Pext_D(0);


P1_IBUFDS : IBUFDS
--  generic map( IOSTANDARD => "DEFAULT")
  port map( I  => PextP(1), IB => PextN(1), O  => Pext_D(1) );

Pext(1) <=  Pext_D(1) when settings(5) = '0' else  not Pext_D(1);


RST <= not RstN	;

CNTCLR <= RST OR GPIO15;

clksrc1 : entity  work.clksrc
  port map
   (-- Clock in ports
    CLK_IN1 => SYSCLK,
    -- Clock out ports
    CLK_OUT1 => CLK100,
    CLK_OUT2 => open,
    CLK_OUT3 => CLK4,
    -- Status and control signals
    RESET  => RST,
    LOCKED => open);




InpSel(0) <= settings(1);
InpSel(1) <= settings(2);
-- Pext=extern diff pulse ,  D6 intern pulser , Dx is RP generated pulse
Cnt1In <= Pext(0)  when InpSel="11" else  D6(0) when InpSel="01"  else D(0);
Cnt2In <= Pext(1)  when InpSel="11" else  D6(1) when InpSel="01"  else D(1);



Pout(0) <= Cnt1In ;
Pout(1) <= Cnt2In ;	 
Pout(2) <= COIN;
pout(3) <= Pext(0); 
PoutAdd(0) <= CntWinEn;
PoutAdd(1) <= d6(5); --cnt 1 enable 
PoutAdd(2) <= d6(6); --cnt 2 enable 
PoutAdd(3) <= d6(7); --coinc enable 
PoutAdd(4) <= Pulse1;
PoutAdd(5) <= D0(0);

CntWinEn <= TWinAct or settings(3);

pcount1  : entity work.pulse_count
	generic map ( CWIDTH =>  COUNTSIZE)
   port map( 	D => Cnt1In,
					EnA => D(2) ,
					EnB => CntWinEn,
					CLR => CNTCLR,
					CLK => CNTCLK,
					CNTE_out => d6(5), 
					Pout=> Pulse1,
					OVLDET => d6(8),
					Q => D0
					);

Pand <= Pulse1 and Pulse2;
COIN <= (Cnt1In and Cnt2In)  when Settings(0) ='0' else Pand;


pcount2  : entity work.pulse_count 
	generic map ( CWIDTH =>  COUNTSIZE)
   port map( 	D => COIN,
					EnA => D(2) ,
					EnB => CntWinEn,
					CLR => CNTCLR,
					CLK => CNTCLK,
					Pout => open,
					CNTE_out => d6(9), 
					OVLDET => open,
					Q => D1
					);

pcount3  : entity work.pulse_count 
	generic map ( CWIDTH =>  COUNTSIZE)
   port map( 	D => Cnt2In,
					EnA => D(2) ,
					EnB => CntWinEn,
					CLR => CNTCLR,
					CLK => CNTCLK,
					CNTE_out => d6(7), 
					OVLDET => d6(10),
					Pout=> Pulse2,
					Q => D2
					);



 pulsgen1  : entity work.pulsegen
      port map (clk=>CLK4,
                D=>PulsgenIn,
                RST=>RST,
                WE=>'1', -- PulsegenIn is "stable input "
                PAND=>D6(2),
                P1=>D6(0),
                P2=>D6(1),
                zbar1=>D6(3),
                zbar2=>D6(4));



outmux: entity work.mux4_Win_Bout 
	 Generic map ( DSIZE => COUNTSIZE  )   
    Port map ( D0 => D0,
           D1 => D1,
           D2 => D2,
           D3 => D6,
           P => P,
			  LED => LED,
           sel => SEL ,
			  byte_sel => byte_sel 
			 );


settingsreg : entity work.Reg_4 
	generic map ( D_WIDTH => D'LENGTH, RSTLVL  =>'1'  )
    Port map ( 	
				Q0    => TimeWinLow,
				Q1    => TimeWinHigh,
				Q2    => Settings,
				Q3    => PulsgenIn,
				D     => D,
				S0    => SEL, -- shared with the ouput mux !!! 
				load  => datavalid,
				clk   => CLK4,
				rst   => RST
			);




timewindow1 : entity work.timewindow
   Port map  ( clk  => CLK4,
					rst =>  RST,
					TwHigh =>  TimeWinHigh ,
					TwLow => TimeWinLow ,
					start => start,
					WinActive => TWinAct
				);	



ledid1 : entity work.ledid 
		port map (	Id =>  "100",  
						clk => CNTCLK,
						Lid =>Lid);
 





end Behavioral;

