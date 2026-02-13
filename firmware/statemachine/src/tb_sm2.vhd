--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:56:36 01/20/2020
-- Design Name:   
-- Module Name:   C:/Users/edfstudent/Documents/digpr/statemach/tb_sm2.vhd
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
 
ENTITY tb_sm2 IS
END tb_sm2;
 
ARCHITECTURE behavior OF tb_sm2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT statemachtop
    PORT(
         D : IN  std_logic_vector(7 downto 0);
         SEL : IN  std_logic_vector(1 downto 0);
         GPIO15 : IN  std_logic;
         P : OUT  std_logic_vector(7 downto 0);
         LED : OUT  std_logic_vector(7 downto 0);
         GPIO22 : IN  std_logic;
         RstN : IN  std_logic;
         Lid : OUT  std_logic_vector(3 downto 0);
         GPIO18 : IN  std_logic;
         SYSCLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(7 downto 0) := (others => '0');
   signal SEL : std_logic_vector(1 downto 0) := (others => '0');
   signal GPIO15 : std_logic := '0';
   signal GPIO22 : std_logic := '0';
   signal RstN : std_logic := '0';
   signal GPIO18 : std_logic := '0';
   signal SYSCLK : std_logic := '0';

 	--Outputs
   signal P : std_logic_vector(7 downto 0);
   signal LED : std_logic_vector(7 downto 0);
   signal Lid : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant SYSCLK_period : time := 10 ns;
	alias  start : std_logic is GPIO18;
	alias  ready : std_logic is GPIO22;
	alias  data_valid : std_logic is GPIO15;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: statemachtop PORT MAP (
          D => D,
          SEL => SEL,
          GPIO15 => GPIO15,
          P => P,
          LED => LED,
          GPIO22 => GPIO22,
          RstN => RstN,
          Lid => Lid,
          GPIO18 => GPIO18,
          SYSCLK => SYSCLK
        );

   -- Clock process definitions
   SYSCLK_process :process
   begin
		SYSCLK <= '0';
		wait for SYSCLK_period/2;
		SYSCLK <= '1';
		wait for SYSCLK_period/2;		
   end process;
 
	
		

   -- Stimulus process
   stim_proc: process
   begin		
		RstN <='0';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		RstN <='1';
      wait for SYSCLK_period*10;

		SEL <="00";
		D <="00000101";
		data_valid <='1';
		wait for 400ns;
		data_valid <='0';
		wait for 400ns;
		SEL <="01";
		D <="00000111";
		data_valid <='1';
		wait for 400ns;
		data_valid <='0';
		wait for 400ns;
		SEL <="10";
		D <="00000011";
		data_valid <='1';
		wait for 400ns;
		data_valid <='0';
		wait for 400ns;
		start <='1';	

      wait;
   end process;

END;
