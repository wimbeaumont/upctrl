--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : 
--  /   /         Filename : xil_872_30
-- /___/   /\     Timestamp : 12/11/2019 16:01:56
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
--library UNISIM;
--use UNISIM.Vcomponents.ALL;

entity Mux_8_4 is
   port ( A  : in    std_logic_vector (7 downto 0); 
          B  : in    std_logic_vector (7 downto 0); 
          C  : in    std_logic_vector (7 downto 0); 
          D  : in    std_logic_vector (7 downto 0); 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          Y  : out   std_logic_vector (7 downto 0));
end Mux_8_4;

architecture BEHAVIORAL of Mux_8_4 is
signal Sel : STD_LOGIC_VECTOR (1 downto 0);
begin
Sel(0) <= S0 ;
Sel(1) <= S1 ;

LUT  : with  Sel select 
	Y <=	A when "00",
			B when "01",
			C when "10",
			C when "11",
				
			"00000000" when others;

end Behavioral;




