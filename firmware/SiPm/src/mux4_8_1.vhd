----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:12:22 08/13/2018 
-- Design Name: 
-- Module Name:    mux4_8_1 - Behavioral 
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
library work ;
use work.all ;

entity mux4_8_1 is
    Port ( D0 : in  STD_LOGIC_VECTOR (7 downto 0);
           D1 : in  STD_LOGIC_VECTOR (7 downto 0);
           D2 : in  STD_LOGIC_VECTOR (7 downto 0);
           D3 : in  STD_LOGIC_VECTOR (7 downto 0);
           D4 : in  STD_LOGIC_VECTOR (7 downto 0);
           D5 : in  STD_LOGIC_VECTOR (7 downto 0);
			  D6 : in  STD_LOGIC_VECTOR (7 downto 0);
			  D7 : in  STD_LOGIC_VECTOR (7 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0);
			  LED : out  STD_LOGIC_VECTOR (7 downto 0);
           sel0 : in  STD_LOGIC;
           sel1 : in  STD_LOGIC;
           sel2 : in  STD_LOGIC);
end mux4_8_1;



architecture Behavioral of mux4_8_1 is


--component outputbuf is
--    Port ( Pin : in  STD_LOGIC_VECTOR (7 downto 0);
--			  Lin : in  STD_LOGIC_VECTOR (7 downto 0);
--           P : out  STD_LOGIC_VECTOR (7 downto 0);
--           LED : out  STD_LOGIC_VECTOR (7 downto 0));
--end component outputbuf;


subtype ADR is STD_LOGIC_VECTOR (2 downto 0);
signal address : ADR ;
signal Dout : STD_LOGIC_VECTOR (7 downto 0);
begin

address(0) <= sel0;
address(1) <= sel1;
address(2) <= sel2;

Mux : with  address select 
	Dout <=	D0 when "000",
				D1 when "001",
				D2 when "010",
				D3 when "011",
				D4 when "100",
				D5 when "101",
				D6 when "110",
				D7 when others;
			

OutBuf1 : entity work.outputbuf port map (
						Dout, Dout, P, LED); 



end Behavioral;

