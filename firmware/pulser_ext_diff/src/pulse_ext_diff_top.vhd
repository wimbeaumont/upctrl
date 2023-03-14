----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:33:36 02/20/2020 
-- Design Name: 
-- Module Name:    pulse_ext_top - Behavioral 
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

entity pulse_ext_diff_top is
    Port ( sw : in  STD_LOGIC_VECTOR (7 downto 0);
           LED : out  STD_LOGIC_VECTOR (7 downto 0);
           p : out  STD_LOGIC_VECTOR(6 downto 3);        
			  p0P : out  STD_LOGIC;
			  p0N : out  STD_LOGIC;
			  p1P : out  STD_LOGIC;
			  p1N : out  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           rstN : in  STD_LOGIC);
end pulse_ext_diff_top;

architecture Behavioral of pulse_ext_diff_top is
signal zbar1int, zbar2int, P0int, P1int, p3int, rst : std_logic;
begin

--diff output 

P1_OBUFDS : OBUFDS
  generic map(
    IOSTANDARD => "DEFAULT"
  )
  port map(
    O  =>  p1P,
    OB =>  p1N,
    I  => P1int
  );

P0_OBUFDS : OBUFDS
  generic map(
    IOSTANDARD => "DEFAULT"
  )
  port map(
    O  =>  p0P,
    OB =>  p0N,
    I  => P0int
  );

rst <= not rstN;

p(3) <= p3int;
p(4) <= zbar1int;
p(5) <= zbar2int;
p(6) <= P0int;

Led(0) <= P0int;
Led(1) <= P1int;
Led(2) <= P1int;
Led(3) <=zbar1int;
Led(4) <=zbar2int;
Led(5) <= '0';
Led(6) <= '0';
Led(7) <= '1';
pulser:  entity  work.pulsegen 
	 generic map (NR_PULSES => 4)
     Port  map ( 
			  D => sw ,
			  WE =>  '1' ,
           P1 => P0int,
			  P2 => P1int,
			  zbar1 => zbar1int, 
			  zbar2 => zbar2int, 
			  clk  => sysclk,
			  PAND => p3int ,
           RST => rst
			);



end Behavioral;

