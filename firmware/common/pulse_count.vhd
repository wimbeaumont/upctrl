----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:49 03/18/2022 
-- Design Name: 
-- Module Name:    pulse_count - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:  
--    up counter with two enable inputs ( both to be high) 
--    with pulse detection input ( to FD in series) 
--    two clear input  
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
-- 20230323  added OVLDET becomes 1 when Q = all one 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
use ieee.numeric_std.all;

entity pulse_count is
	generic ( CWIDTH : integer :=16 );
   Port ( D : in  STD_LOGIC; -- pulse input
           EnA : in  STD_LOGIC;
           EnB : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           CLK : in  STD_LOGIC; --sync clk iput
			  CNTE_out : out STD_LOGIC; -- count enable status
			  Pout: out STD_LOGIC; --  pulse detect output 1 clock high
			  OVLDET: out  std_logic;
           Q : out  STD_LOGIC_VECTOR (CWIDTH-1 downto 0));
end pulse_count;

architecture Behavioral of pulse_count is

   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";

----- component FDC -----
component FDC
  generic (     INIT : bit := '0'  );
  port (
     Q : out std_logic;
     C : in std_logic;
     CLR : in std_logic;
     D : in std_logic
  );
end component;
attribute BOX_TYPE of  FDC : component is "BLACK_BOX";
signal qcnt  :  STD_LOGIC_VECTOR (CWIDTH-1 downto 0);
signal qcntu : unsigned (CWIDTH-1 downto 0);
signal CNT1_CE , Qff1_2,Qff1_1,Qff1_3 , OVLDET_chk: std_logic;
constant all_one : unsigned (CWIDTH-1 downto 0 ) := (others => '1');
begin

ff_ovl : FDC 
port map (C=>CLK,
          D=>OVLDET_chk,
          Q=>OVLDET,
			 CLR => CLR
			);
			

ff1_1 : FD
      port map (C=>CLK,
                D=>D,
                Q=>Qff1_1);
   
ff1_2 : FD
      port map (C=>CLK,
                D=>Qff1_1,
                Q=>Qff1_2);
					 

ff1_3 : FD  -- cp[[ied from digpr4diff, not so clear why needed
      port map (C=>CLK,
                D=>Qff1_2,
                Q=>Qff1_3);

Pout <= (not  Qff1_3 )  and  (Qff1_1 and Qff1_2);					 
					 					 
					 
CNT1_CE <= (not  Qff1_2 )  and  (Qff1_1 and  EnA and EnB );
CNTE_out <= CNT1_CE;

count1  : entity work.counter
      generic map ( CWIDTH => CWIDTH)
      port map (C=>CLK,
                CE=>CNT1_CE,
                CLR=>CLR,
                Q=>qcnt
              );

Q<= qcnt; 
qcntu <= unsigned(qcnt);
OVLDET_chk  <= '1' when ( qcntu= all_one)  else '0';

end Behavioral;

