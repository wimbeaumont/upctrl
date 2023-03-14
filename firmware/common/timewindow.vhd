----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:00 02/28/2020 
-- Design Name: 
-- Module Name:    timewindow - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timewindow is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           TwHigh : in  STD_LOGIC_VECTOR (7 downto 0);
           TwLow : in  STD_LOGIC_VECTOR (7 downto 0);
           start : in  STD_LOGIC;
           WinActive : out  STD_LOGIC);
end timewindow;

architecture Behavioral of timewindow is
constant CNT_LENGTH : integer := 28;
signal Dset : STD_LOGIC_VECTOR (CNT_LENGTH-1 downto 0);
signal WinActiveTime :STD_LOGIC;

begin

Dset( CNT_LENGTH-17 downto 0) <= (others => '1' );
Dset (CNT_LENGTH-9  downto CNT_LENGTH-16)  <=  TwLow;
Dset (CNT_LENGTH-1 downto CNT_LENGTH-8)  <=  TwHigh;

windowcnt1 : entity work.gen_down_cnt 
			generic map ( 
			 C_WIDTH =>  Dset'LENGTH,
			 CNT_EN => 0,  -- stop at 0 ignore  cnt input 
			 LOAD_EN => 1,
			 LRSTLVL => '1' )
			port map (
				rst => rst,
				d => Dset,
				zero_bar => WinActiveTime,
				q=> open,
				load => start,
				clk  => clk,
				one_bar => open
			);

WinActive <= WinActiveTime OR start; -- if start is high the window is always active !! 
end Behavioral;

