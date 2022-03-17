----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:43 12/12/2019 
-- Design Name: 
-- Module Name:    adderinput - Behavioral 
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

entity adderinput is
    Generic ( SIZE : natural := 8 ) ;
    Port ( D : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);
           sel : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  SUBTR : in STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (SIZE-1 downto 0);
           Cout : out  STD_LOGIC_VECTOR (SIZE-1 downto 0));
end adderinput;

architecture Behavioral of adderinput is


signal  A, B : STD_LOGIC_VECTOR (SIZE-1 downto 0);


component  adder 
	 Generic ( SIZE : natural := 8 ) ;
    Port ( A : in  STD_LOGIC_VECTOR (SIZE -1 downto 0);
           B : in  STD_LOGIC_VECTOR (SIZE -1 downto 0);
           Y : out  STD_LOGIC_VECTOR (SIZE -1 downto 0);
           Cout : out   STD_LOGIC_VECTOR (SIZE -1 downto 0)
			);
end  component;

begin

process ( clk) is
	begin 
		if( rising_edge(clk) ) then 
			if ( sel = '0' ) then A <=D ;
			else B <= D ;
			end if ;
		end if;
end process ;--InSel

add1: adder 
		generic map ( SIZE => SIZE )
		port map ( A => A, B => B, Y => Y , Cout => Cout);
		

end Behavioral;

