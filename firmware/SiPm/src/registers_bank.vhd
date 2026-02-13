----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:33:16 04/27/2021 
-- Design Name: 
-- Module Name:    registers_bank - Behavioral 
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
--   when We is 1 and Regsel is one the register address is written 
--   when we is 0 and RegSel  is zero  then the regiter is written 
--   Y  is a array  so mulitple  std_logic_vector  outputs 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.RegType.all ;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registers_bank is
	 generic ( R_WIDTH 	: integer :=RegDataWidth;
				  N_Reg_MSB : integer :=Nr_reg_MSB 	
	 );

    Port ( clk : in  STD_LOGIC;
			  Rst 	: in  STD_LOGIC;
           we : in  STD_LOGIC;
           reg_set_sel : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (R_WIDTH-1 downto 0);
           Y : out  RegType);
end registers_bank;

architecture Behavioral of registers_bank is

signal reg_sel  : STD_LOGIC_VECTOR  (N_Reg_MSB-1 downto 0);
signal registers_loc : RegType;
begin

set_reg_sel :  process (clk, Rst) is 
begin 
	if (  rising_edge(clk) ) then 
		if ( reg_set_sel = '1' and we= '1'  ) then 
			reg_sel <= D( N_Reg_MSB-1 downto 0) ;
		end if;
	end if; 
end process set_reg_sel; 

set_reg :  process (clk) is 

begin 
	if ( Rst = '1' ) then 
		registers_loc  <=  (others => (others => '0'));
	elsif (  rising_edge(clk) ) then 
		if ( reg_set_sel = '0' and we= '1' ) then 
			registers_loc ( to_integer( unsigned(reg_sel))) <= D;
		end if;
	end if; 
end process set_reg; 

Y <=registers_loc;


end Behavioral;

