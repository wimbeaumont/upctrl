--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:19:56 04/27/2021
-- Design Name:   
-- Module Name:   C:/Users/edfstudent/Documents/digpr/SiPm/TB_regbank.vhd
-- Project Name:  SiPm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registers_bank
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
library work ;
--use work.all; 
use work.RegType.all ;
 
ENTITY TB_regbank IS
END TB_regbank;
 
ARCHITECTURE behavior OF TB_regbank IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registers_bank
    PORT(
         clk : IN  std_logic;
         Rst : IN  std_logic;
         we : IN  std_logic;
         reg_set_sel : IN  std_logic;
         D : IN  std_logic_vector(7 downto 0);
         Y : OUT  RegType
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal we : std_logic := '0';
   signal reg_set_sel : std_logic := '0';
   signal D : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Y : RegType;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registers_bank PORT MAP (
          clk => clk,
          Rst => Rst,
          we => we,
          reg_set_sel => reg_set_sel,
          D => D,
          Y => Y
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		  we <= '0';reg_set_sel <='1' ; D <= "00000001"; 
		  wait for 10 ns;	
        we <= '1';reg_set_sel <='1' ; D <= "00000001"; 
		  wait for 400 ns;	
		  we <= '0';reg_set_sel <='1' ; D <= "00000001"; 
		  wait for 400 ns;	
		  we <= '0';reg_set_sel <='1' ; D <= "00010011"; 
		  wait for 400 ns;	
		  we <= '0';reg_set_sel <='0' ; D <= "00010011"; 
		  wait for 400 ns;	
		  we <= '1';reg_set_sel <='0' ; D <= "00010011"; 
		  wait for 400 ns;		
		  we <= '0';reg_set_sel <='0' ; D <= "00010011"; 
		  wait for 400 ns;		
		  we <= '0';reg_set_sel <='0' ; D <= "11010011"; 
		  wait for 400 ns;	
		  we <= '0';reg_set_sel <='1' ; D <= "00000000"; 
		  wait for 10 ns;	
        we <= '1';reg_set_sel <='1' ; D <= "00000000"; 
		  wait for 400 ns;	
		  we <= '0';reg_set_sel <='1' ; D <= "00000000"; 
		  wait for 400 ns;	
		  we <= '0';reg_set_sel <='1' ; D <= "10010001"; 
		  wait for 400 ns;	
		  we <= '0';reg_set_sel <='0' ; D <= "10010001"; 
		  wait for 400 ns;	
		  we <= '1';reg_set_sel <='0' ; D <= "10010001"; 
		  wait for 400 ns;		
		  we <= '0';reg_set_sel <='0' ; D <= "10010001"; 
		  wait for 400 ns;		
		  we <= '0';reg_set_sel <='0' ; D <= "11110011"; 
		  wait for 400 ns;			  
      wait;
   end process;

END;
