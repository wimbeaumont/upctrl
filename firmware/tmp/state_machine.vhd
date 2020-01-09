----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:51 09/07/2018 
-- Design Name: 
-- Module Name:    rd_state_machine - Behavioral 
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

entity rd_state_machine is
    Port ( Start : in  STD_LOGIC;
           timer_done : in  STD_LOGIC;
           rd_done : in  STD_LOGIC;
           rd_start : out  STD_LOGIC;
           timer_start : out  STD_LOGIC;
			  mux_sel : out STD_LOGIC_VECTOR( 3 downto 0); 
			  clk :in STD_LOGIC;
			  rst : in STD_LOGIC);
			  
end rd_state_machine;

architecture Behavioral of rd_state_machine is

type  STATES  is ( Idle,  Wait_timer ,  Rd0 ,Rd0W, Rd1 ,Rd1W, Rd2 );
signal State : STATES ;

begin

Process (clk, rst)  

Begin 

	if ( rst = '1' ) then 
		State <= Idle ;
		timer_start <= '0';
		rd_start <='0';
		mux_sel <= (others=>'0');

	elsif  rising_edge ( clk) then 
		timer_start <= '0';
		rd_start <='0';
		mux_sel <= (others=>'0');

	case State is 
		when Idle  =>
				mux_sel <= "0000";
				if ( start = '1') then 
					State <= Wait_timer ;
					timer_start <='1';
				end if;
		
	   when Wait_timer =>
					mux_sel <= "0000";
					timer_start <='0';
				if ( timer_done = '1') then 
					State <= Rd0;
					rd_start <='1';
				end if;		
		when Rd0 => 
				mux_sel <= "0000";
				rd_start <='0';
				if ( rd_done = '1') then 
					State <= Rd0W  ;
					mux_sel <= "0001";					
				end if;		
	   when Rd0W =>
				rd_start <='0';
				mux_sel <= "0001";
				if ( rd_done = '0') then 
					State <= Rd1  ;
					rd_start <='1';
				end if;
	   when Rd1 =>
				mux_sel <= "0001";
				rd_start <='0';
				if ( rd_done = '1') then 
					State <= Rd1W  ;
					mux_sel <= "0010";					
				end if;
		when Rd1W =>
					rd_start <='0';
					mux_sel <= "0010";
				if ( rd_done = '0') then 
					State <= Rd2  ;
					rd_start <='1';
				end if;		
		when Rd2 =>
				mux_sel <= "0010";
				rd_start <='0';
				if ( rd_done = '1') then 
					State <= Idle   ;
					rd_start <='1';
				end if;
		end case ;
	end if ;  -- if rst
	end process;
end Behavioral;

