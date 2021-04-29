----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:19 09/25/2018 
-- Design Name: 
-- Module Name:    Mux_8_4 - Behavioral 
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

entity Mux_8_2 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);       
           Y : out  STD_LOGIC_VECTOR (7 downto 0);        
           S0 : in  STD_LOGIC);
end Mux_8_2;

architecture Behavioral of Mux_8_2 is
signal Sel : STD_LOGIC_VECTOR (0 downto 0);

begin 
Sel(0) <= S0 ;


LUT  : with  Sel select 
	Y <=	A when "0",
			B when "1",
				
			"00000000" when others;

end Behavioral;

