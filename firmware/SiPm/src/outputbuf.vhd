----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:37:12 01/04/2020 
-- Design Name: 
-- Module Name:    outputbuf - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity outputbuf is
    Port ( Pin : in  STD_LOGIC_VECTOR (7 downto 0);
		     Lin :  in  STD_LOGIC_VECTOR (7 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0);
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end outputbuf;

architecture Behavioral of outputbuf is

begin

outbuffers :  for LC in 0 to 7  generate 
	
	LO : obuf port map ( LED(LC) , Lin(LC));
	LP : obuf port map(P(LC) , Pin(LC));
end generate outbuffers; 


end Behavioral;

