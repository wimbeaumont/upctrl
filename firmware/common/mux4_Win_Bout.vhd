----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:12:22 08/13/2018 
-- Design Name: 
-- Module Name:    mux4_Win_Bout - Behavioral 
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

-- this is a 4 input mux  with data size input == DSIZE (max 32) 
--  sel selects the input used 
--  byte_sel selects the byte of the input connected to the output


entity mux4_Win_Bout is
	 Generic ( DSIZE : integer :=8) ;
    Port ( D0 : in  STD_LOGIC_VECTOR (DSIZE-1 downto 0);
           D1 : in  STD_LOGIC_VECTOR (DSIZE-1 downto 0);
           D2 : in  STD_LOGIC_VECTOR (DSIZE-1 downto 0);
           D3 : in  STD_LOGIC_VECTOR (DSIZE-1 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0);
			  LED : out  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR ( 1 downto 0);
			  byte_sel : in STD_LOGIC_VECTOR ( 1 downto 0)
			 );
end mux4_Win_Bout;



architecture Behavioral of mux4_Win_Bout is


component outputbuf is
    Port ( Pin : in  STD_LOGIC_VECTOR (7 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0);
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end component outputbuf;



signal DSel : STD_LOGIC_VECTOR (DSIZE-1 downto 0);
signal DSMax : STD_LOGIC_VECTOR (32  downto 0); -- 32 so always > DSIZE-1 
signal Dout  : STD_LOGIC_VECTOR (7 downto 0);
begin




MuxSel : with  sel select 
	DSel <=	D0 when "00",
				D1 when "01",
				D2 when "10",
				D3 when others;

DSMax ( DSIZE-1 downto 0) <=  DSel;
DSMax ( 32 downto DSIZE) <=(others => '0') ;

Muxbyte : with byte_sel select 
	Dout <=  DSMax(7 downto 0) when "00",				
				DSMax(15 downto 8) when "01",				
				DSMax(23 downto 16) when "10",				
				DSMax(31 downto 24) when others;

OutBuf1 :outputbuf port map (
						Dout, P, LED); 



end Behavioral;

