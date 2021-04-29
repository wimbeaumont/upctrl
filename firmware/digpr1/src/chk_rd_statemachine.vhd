--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:56:58 09/07/2018
-- Design Name:   
-- Module Name:   C:/Users/edfstudent/Documents/digpr/pract1/chk_rd_statemachine.vhd
-- Project Name:  pract1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rd_state_machine
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
 
ENTITY chk_rd_statemachine IS
END chk_rd_statemachine;
 
ARCHITECTURE behavior OF chk_rd_statemachine IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rd_state_machine
    PORT(
         Start : IN  std_logic;
         timer_done : IN  std_logic;
         rd_done : IN  std_logic;
         rd_start : OUT  std_logic;
         timer_start : OUT  std_logic;
         mux_sel : OUT  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Start : std_logic := '0';
   signal timer_done : std_logic := '0';
   signal rd_done : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal rd_start : std_logic;
   signal timer_start : std_logic;
   signal mux_sel : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
	-- state signals 
	signal timer_stat : std_logic;	
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rd_state_machine PORT MAP (
          Start => Start,
          timer_done => timer_done,
          rd_done => rd_done,
          rd_start => rd_start,
          timer_start => timer_start,
          mux_sel => mux_sel,
          clk => clk,
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
		rst <= '1';
      -- hold reset state for 100 ns.
		Start <= '0';
		
      wait for 100 ns;	
		rst <='0'; 
      wait for clk_period*10;
		Start <='1';	
		wait for clk_period*10;
		Start <='0';	
      wait for clk_period*50;
		rd_done <= '1';
		wait for clk_period*3;
		rd_done <= '0';
		wait for clk_period*50;
		rd_done <= '1';
		wait for clk_period*3;
		rd_done <= '0';
		wait for clk_period*50;
		rd_done <= '1';
		wait for clk_period*3;
		rd_done <= '0';

      wait;
   end process;
	
	timer : process (rst, clk)  
	variable cnt : integer; 
	begin 
	if (rst = '1') then 
		timer_stat <= '0';
		timer_done <= '0';
	elsif rising_edge( clk) then  	
		case timer_stat is
			when '0' =>  cnt := 10;
							 timer_done  <= '0';
							 if( timer_start = '1') then 
								timer_stat <='1'; 
							end if; 
			when '1'  =>   --cnting 
							if ( cnt = 0 ) then 
								timer_done <= '1' ;
								timer_stat <='0';
							else
								cnt := cnt -1; 
							end if; 
			when others =>  	
								timer_stat <= '0';
								timer_done <= '0';
			end case ;
	  end if;		
	end process;

END;
