----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:38:51 12/13/2019 
-- Design Name: 
-- Module Name:    ledid - Behavioral 
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

entity ledid is
    Port ( clk : in  STD_LOGIC;
           Lid : out  STD_LOGIC_VECTOR(3 downto 0) 
          );
end ledid;

architecture Behavioral of ledid is
 signal Id :STD_LOGIC_VECTOR(2 downto 0) ;
 signal T_n, T : STD_LOGIC;


begin

  Id <=  "101";
  Lid(2 downto 0 ) <= not Id; -- 0 == LED on 
-- T FF 
FDCE_inst : FDCE generic map ( INIT => '0') -- Initial value of register ('0' or '1')
port map (Q => T,C => clk, CE=>'1', CLR =>'0', D=>  T_n);
T_n <= not T;
Lid(3) <= T;
end Behavioral;

