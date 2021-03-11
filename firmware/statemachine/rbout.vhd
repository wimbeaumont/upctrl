--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:10:20 09/27/2019
-- Design Name:   
-- Module Name:   C:/Users/edfstudent/Documents/digpr/statemach/rpbout.vhd
-- Project Name:  statemach
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: statemachtop
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
 
ENTITY rpbout IS
END rpbout;
 
ARCHITECTURE behavior OF rpbout IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT statemachtop
    PORT(
         Settings : IN  std_logic_vector(7 downto 0);
         sel : IN  std_logic_vector(1 downto 0);
         setting_valid : IN  std_logic;
         Pon : OUT  std_logic;
         clk : IN  std_logic;
         start : IN  std_logic;
         ready : IN  std_logic;
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Settings : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');
   signal setting_valid : std_logic := '0';
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal ready : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal Pon : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: statemachtop PORT MAP (
          Settings => Settings,
          sel => sel,
          setting_valid => setting_valid,
          Pon => Pon,
          clk => clk,
          start => start,
          ready => ready,
          rst => rst
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
      rst<='1';
		Settings <= x"00";
		Sel <= b"00";
		start <='0';
		ready <='0';
		setting_valid <='0';
      wait for 100 ns;	
		rst<='0';
		-- load the settings  
      wait for clk_period*2;
		setting_valid <='1';	
		wait for clk_period*1;
		setting_valid <='0';	
		Settings <= x"04";
		Sel <= b"01";
		wait for clk_period*2;
		setting_valid <='1';	
		wait for clk_period*2;
		setting_valid <='0';	
		Settings <= x"12";
		Sel <= b"10";
		wait for clk_period*2;
		setting_valid <='1';	
		wait for clk_period*2;
		setting_valid <='0';	
		wait for clk_period*10;
		start <='1';
		wait for clk_period*40;
		start <='0';
		
		     
      wait;
   end process;

END;
