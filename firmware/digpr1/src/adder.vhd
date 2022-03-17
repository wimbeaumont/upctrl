----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:49 12/12/2019 
-- Design Name: 
-- Module Name:    adder - Behavioral 
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

entity adder is
	 Generic ( SIZE : natural := 8 ) ;
    Port ( A : in  STD_LOGIC_VECTOR (SIZE -1 downto 0);
           B : in  STD_LOGIC_VECTOR (SIZE -1 downto 0);
           Y : out  STD_LOGIC_VECTOR (SIZE -1 downto 0);
           Cout : out   STD_LOGIC_VECTOR (SIZE -1 downto 0)
			);
end  adder;

architecture Behavioral of adder is


component fulladder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Y : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;


signal  Cint : STD_LOGIC_VECTOR (SIZE  downto 0); -- need read write  
begin

Cint(0) <= '0'; 

ADDER : for I in 0 to SIZE-1 generate 
  L: 	fulladder  port map ( A => A(I) , B=>B(I) , C => Cint(I) ,Cout=>Cint(I+1), Y => Y(I)) ;
end generate ADDER; 

Cout <= Cint ( SIZE downto 1); 

end Behavioral;

