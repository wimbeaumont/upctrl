--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:59:36 05/01/2021
-- Design Name:   
-- Module Name:   C:/Users/edfstudent/Documents/github/upctrl/firmware/SiPm/src/TBpulsestrecher.vhd
-- Project Name:  SiPm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pulse_strecher
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
 
ENTITY TBpulsestrecher IS
END TBpulsestrecher;
 
ARCHITECTURE behavior OF TBpulsestrecher IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pulse_strecher
	 generic ( START_DELAY : natural :=0;  -- wait before the pulse goes high 
			 PULSE_LENGTH: natural := 10; 
			 RETURN_ZERO : natural :=0; -- if 1 output will 0 after PULSE_LENGTH  even if input is still zero ,
												 -- otherwise ouput will stay  PULSE_LENGTH after d goes low 
			 NOT_OUT  : natural :=0; 
			 LATCHED : natural :=0;  -- if set none 0 , input will be latched instead of clocked in 
		   LRSTLVL: std_logic := '0'
			
		);
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         d : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RstN : std_logic := '0';
   signal clk : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
 
	-- Instantiate the Unit Under Test (UUT)
	
   uut: pulse_strecher
	generic  map ( PULSE_LENGTH => 5 , RETURN_ZERO =>1 , LATCHED => 0)
	 PORT MAP (
          rst => RstN,
          clk => clk,
          d => d,
          q => q
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
	   RstN <= '0'; 
      
      wait for 20 ns;	
		RstN <= '1'; 
      wait for clk_period*10;
		d <= '1'; 
      wait for clk_period*2;
		d <= '0'; 
		wait for clk_period*60;
		d <= '1'; 
      wait for clk_period*15;
		d <= '0'; 
		wait for clk_period*60;
		

      wait;
   end process;

END;
