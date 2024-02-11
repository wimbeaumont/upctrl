----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:39 01/05/2020 
-- Design Name: 
-- Module Name:    pulsegen - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 2.00 - 18/03/2022  differnetial external inputs for counters
-- Additional Comments: 
--
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

-- P1 pulse 1 output 
-- P2 pulse 2 output 
-- PAND  and of P1 and P2
-- zcnt1 is 1 if divider timer  =0
-- zcnt2 is 1 if down cnt  =0

entity pulsegen is
	 generic (NR_PULSES : integer := 4);
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
			  WE : in STD_LOGIC;
           P1 : out  STD_LOGIC;
           P2 : out  STD_LOGIC;
			  zbar1 : out  STD_LOGIC;
			  zbar2 : out  STD_LOGIC;
			  clk : in STD_LOGIC;
           PAND : out  STD_LOGIC;
           RST : in  STD_LOGIC);
end pulsegen;

architecture Behavioral of pulsegen is

component fix_nr_decode is			-- renamed consistant with library's entity
generic ( D_WIDTH : integer :=4 ; 
          FIX_NR  : integer := 0 ;
			 NOPULS_AT_ZERO : integer :=0 
		  	        );
port (
    a 		 : in std_logic_vector(D_WIDTH-1 downto 0);
    y		 : out std_logic 
    
    );

end component fix_nr_decode;


component  gen_down_cnt is		
generic  (C_WIDTH : integer :=4 ; 
          CNT_EN  : integer := 0 ;
          LOAD_EN : integer := 0;		
		  RESET_VALUE : integer :=0;
		  LRSTLVL : std_logic := '0'
		  --CLEAR_EN : integer :=0
		  	        );
port (
	rst		 : in std_logic ;
    d 		 : in std_logic_vector(C_WIDTH-1 downto 0) := (others =>'0');
    zero_bar : out std_logic ;
    q 		 : out std_logic_vector(C_WIDTH-1 downto 0) ;
    load 	 : in std_logic := '0';
    clk 	 : in std_logic ;
    cnt 	 : in std_logic := '1' ;
	clear 	 : in std_logic:= '0';
    one_bar  : out std_logic 
    );
end component gen_down_cnt;
constant T_WIDTH : integer :=12;
signal z1,z1bar, p1int, p2int : std_logic;
signal  p1all, p2all : std_logic_vector( NR_PULSES-1 downto 0);
constant zvect : std_logic_vector( NR_PULSES-1 downto 0) := (others => '0');
signal timer : std_logic_vector(T_WIDTH-1 downto 0);
signal dreg : std_logic_vector( D'LEFT downto D'RIGHT);
type TIMESET is array ( 0 to  NR_PULSES-1 ) of integer;
constant ptimes1 : TIMESET := ( 80, 210 , 400, 2000);
constant ptimes2 : TIMESET := ( 130, 1000 ,  2000 , 4000);
begin

-- load register 
regload : process (clk) 
-- no reset don't care initial state 
begin
	if( rising_edge(clk) )then 
		if ( WE = '1' ) then
			dreg <= d;
		end if;
	end if;
end process regload;



-- this counter always count down from what is in its d input 
divcnt1 : gen_down_cnt 
			generic map ( 
			 C_WIDTH =>  D'LENGTH,
			 CNT_EN => 0,  -- stop at 0 ignore  cnt input 
			 LOAD_EN => 1,
			 LRSTLVL => '1' )
			port map (
				rst => rst,
				d => dreg,
				zero_bar =>z1bar,
				q=> open,
				load => z1,
				clk  => clk,
				one_bar => open
			);
zbar1 <= z1bar;			
z1<= not z1bar;

			
cnt1 : gen_down_cnt 			
			generic map ( 
			 C_WIDTH =>  T_WIDTH ,
			 CNT_EN => 2,  -- run only when cnt =1 
			 LOAD_EN => 0,
			 LRSTLVL => '1' )
			port map (
				rst => rst,
				cnt =>z1, -- count only when divder timer =0 
				zero_bar =>zbar2,
				q=> timer,			
				clk  => clk,
				one_bar => open
			);
			

p1allimp:  for I in 0 to NR_PULSES-1 generate 
pulse_p1 : fix_nr_decode 
			generic map (
			 D_WIDTH => T_WIDTH, 
          FIX_NR  =>  ptimes1(I)
			 )
			port map (
				a=> timer,
				y=> p1all(I)
			);
end generate p1allimp; 			

p2allimp:  for I in 0 to NR_PULSES-1 generate 
pulse_p2 : fix_nr_decode 
			generic map (
			 D_WIDTH => T_WIDTH, 
          FIX_NR  =>  ptimes2(I)
			 )
			port map (
				a=> timer,
				y=> p2all(I)
			);
end generate p2allimp; 			

p1int <= '0'  when p1all = zvect else '1' ;
p2int <= '0'  when p2all = zvect else '1' ;
p1 <= p1int;
p2 <= p2int;
pand <= p1int and p2int;

			

end Behavioral;

