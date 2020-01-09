----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:27 12/13/2019 
-- Design Name: 
-- Module Name:    dbounce - Behavioral 
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

-- debounce a signal for debounce time  
-- output is a puse of the time pulse time , pulse time should be lower then debounce time 

entity dbounce is
	 Generic (RSTLVL : std_logic := '0' ; debouncetime : natural :=300000  );
    Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;	
           A : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end dbounce;

architecture Behavioral of dbounce is

begin
		process (clk, rst) 
			variable dbtime : natural;
		begin 
			
			if ( rst = RSTLVL ) then 
				dbtime :=0;				
			elsif ( rising_edge(clk)) then
				if ( A = '1' ) then	
						dbtime := debouncetime;
				else 	
					if (dbtime /= 0) then 
						dbtime := dbtime -1;				
					end if;
				end if ;  -- if A=1
			end if; -- if rst 
			if ( dbtime = 0 ) then  Y<='0'  ; else 	Y <= '1' ; end if;
			
		end process ;

end Behavioral;

