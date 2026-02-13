----------------------------------------------------------------------------------
-- Company: 	Univeristeit Antwerpen
-- Engineer:   Wim Beaumont 
-- 
-- Create Date:    15:15:30 08/28/2019 
-- Design Name: 	 
-- Module Name:    statemachtop - Behavioral 
-- Project Name:   statemachine / programeerbare pulser  
-- Target Devices:  Atlys board 
-- Tool versions: 
-- Description: 
-- Pulser with programable puse width and pulse train length
-- Output goes to the JMOD extention boad  -> RP adaption board (check topdoc.png /svg) 
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--20230308  changed  LedId to the common version
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity statemachtop is
	 generic ( T_WIDTH : integer :=8 ); 
    port ( D : in  STD_LOGIC_VECTOR (T_WIDTH-1 downto 0);
			  SEL : in  STD_LOGIC_VECTOR (1 downto 0);
			  GPIO15 : in 	STD_LOGIC; -- data in valid 
			  P	: out STD_LOGIC_VECTOR(7 downto 0);
			  LED	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
			  GPIO22 :in  STD_LOGIC; -- ready signal 
           RstN	:	IN	STD_LOGIC; 
			  Lid	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
			  GPIO14	:	IN	STD_LOGIC;-- start signal
           SYSCLK	:	IN	STD_LOGIC
			  );
end statemachtop;


architecture Behavioral of statemachtop is
-- 
constant  LIdset  :STD_LOGIC_VECTOR (2 downto 0) := "111";
-- name changes of input pins 
alias  start : std_logic is GPIO14;
alias  ready : std_logic is GPIO22;
alias  data_valid : std_logic is GPIO15;

signal wait_s , Pon_i, LcntWait, LcntPon, LcntNr, load_ptime :STD_LOGIC;
signal ptime, pcnt,  en_ptime, en_pcnt :STD_LOGIC;
signal PulseTime, WaitTime, NrPulses : STD_LOGIC_VECTOR (T_WIDTH-1 downto 0);
signal ptime_set :STD_LOGIC_VECTOR (T_WIDTH-1 downto 0);

signal CLK100, RST, clk4M    : std_logic; 
alias  clk : std_logic is CLK4M;

begin
RST <= not RstN	;

statemach1: entity work.pulse_cntrl 
port map (
  LcntNr => LcntNr,	
  LcntWait => LcntWait,
  LcntPon => LcntPon,
  Pon => Pon_i ,
  wait_s => wait_s,
  Pcnt => pcnt,
  Ptime => ptime,
  Ready =>  ready ,
  clk => clk,
  rst => rst,
  start => start
);



settingsreg : entity work.Reg_4 
	generic map ( D_WIDTH => T_WIDTH , RSTLVL  =>'1'  )
    Port map ( 	
				Q0    => PulseTime,
				Q1    => WaitTime,
				Q2    => NrPulses,
				Q3    => open,
				D     => D,
				S0    => sel,
				load  => data_valid,
				clk   => clk,
				rst   => rst
			);

ptime_set <=  WaitTime  when LcntWait='1' else PulseTime ;

cnt_ptime : entity  work.gen_down_cnt 
		generic map ( 
		  C_WIDTH => T_WIDTH ,
		  CNT_EN => 2 ,
		  LOAD_EN => 1 ,
		  LRSTLVL => '1'
		  )
		port map (
			rst => rst ,
			clk => clk,
			d => ptime_set,
			load => load_ptime,
			cnt => en_ptime,
			zero_bar => ptime
		);

cnt_nrpulses : entity  work.gen_down_cnt 
		generic map ( 
		  C_WIDTH => T_WIDTH ,
		  CNT_EN => 2 ,
		  LOAD_EN => 1 ,
		  LRSTLVL => '1' 
		  )
		port map (
			rst => rst ,
			clk => clk,
			d => NrPulses,
			load => LcntNr,
			cnt => en_pcnt,
			zero_bar => pcnt
		);


		
load_ptime <= LcntWait OR LcntPon;
en_ptime 	  <= wait_s OR Pon_i;
en_pcnt		<= not Pon_i;


P(0) <= Pon_i;
LED(0) <= Pon_i;


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


 
ledid1 : entity work.ledid 
		port map ( Id => LidSet, 
					 clk => clk4M,
					 Lid =>Lid);


LED(1) <= pcnt;
LED(2) <=ptime;
LED(3)  <=LcntWait;
LED(4) <= LcntPon;
LED(5)  <= en_ptime ;
LED(6)  <= en_pcnt	;
LED(7) <= start;

P(1) <= pcnt;
P(2) <=ptime;
P(3)  <=LcntWait;
P(4) <= LcntPon;
P(5)  <= en_ptime ;
P(6)  <= en_pcnt	;
P(7) <= start;


 
-- just more id 
--LED(7 downto 1 ) <= (others =>'1');

end Behavioral;

