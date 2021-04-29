-- Vhdl test bench created from schematic C:\Users\edfstudent\Documents\digpr\pract1\counter4.sch - Fri Feb 14 13:33:01 2020
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY counter4_counter4_sch_tb IS
END counter4_counter4_sch_tb;
ARCHITECTURE behavioral OF counter4_counter4_sch_tb IS 

   COMPONENT counter4
   PORT( Q3	:	OUT	STD_LOGIC; 
          Q1	:	OUT	STD_LOGIC; 
          Q0	:	OUT	STD_LOGIC; 
          Q2	:	OUT	STD_LOGIC; 
          CE	:	IN	STD_LOGIC; 
          clk	:	IN	STD_LOGIC; 
          RST	:	IN	STD_LOGIC; 
          D0	:	IN	STD_LOGIC; 
          D1	:	IN	STD_LOGIC; 
          SEL	:	IN	STD_LOGIC; 
          D2	:	IN	STD_LOGIC; 
          D3	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL Q3	:	STD_LOGIC;
   SIGNAL Q1	:	STD_LOGIC;
   SIGNAL Q0	:	STD_LOGIC;
   SIGNAL Q2	:	STD_LOGIC;
   SIGNAL CE	:	STD_LOGIC;
   SIGNAL clk	:	STD_LOGIC;
   SIGNAL RST	:	STD_LOGIC;
   SIGNAL D0	:	STD_LOGIC;
   SIGNAL D1	:	STD_LOGIC;
   SIGNAL SEL	:	STD_LOGIC;
   SIGNAL D2	:	STD_LOGIC;
   SIGNAL D3	:	STD_LOGIC;

BEGIN

   UUT: counter4 PORT MAP(
		Q3 => Q3, 
		Q1 => Q1, 
		Q0 => Q0, 
		Q2 => Q2, 
		CE => CE, 
		clk => clk, 
		RST => RST, 
		D0 => D0, 
		D1 => D1, 
		SEL => SEL, 
		D2 => D2, 
		D3 => D3
   );
	
	 SYSCLK_process :process
	 begin
		clk <= '0';
		wait for 20ns;
		clk <= '1';
		wait for 20ns;		
   end process;
 
	
-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		Rst <='1';
		SEL <='0';
		CE <='1';
      WAIT for 20ns; -- will wait forever
		Rst <='0';
		WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
