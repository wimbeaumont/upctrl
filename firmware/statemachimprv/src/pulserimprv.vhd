-- Created by fizzim.pl version 5.20 on 2023:03:10 at 13:54:22 (www.fizzim.com)

library ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity pulse_cntrl is
port (
  LcntNr : out STD_LOGIC;
  LcntPon : out STD_LOGIC;
  LcntWait : out STD_LOGIC;
  Pon : out STD_LOGIC;
  wait_s : out STD_LOGIC;
  Pcnt : in STD_LOGIC;
  Ptime : in STD_LOGIC;
  Ready : in STD_LOGIC;
  clk : in STD_LOGIC;
  rst : in STD_LOGIC;
  start : in STD_LOGIC
);
end pulse_cntrl;

architecture fizzim of pulse_cntrl is

-- state bits
subtype state_type is STD_LOGIC_VECTOR(2 downto 0);

constant iddle    : state_type:="000"; 
constant load_wati_cnt: state_type:="001"; 
constant loadpulse_time_cnt: state_type:="010"; 
constant pulse_off: state_type:="011"; 
constant pulse_on : state_type:="100"; 
constant wait_t   : state_type:="101"; 

signal state,nextstate: state_type;
signal LcntNr_internal: STD_LOGIC;
signal LcntPon_internal: STD_LOGIC;
signal LcntWait_internal: STD_LOGIC;
signal Pon_internal: STD_LOGIC;
signal wait_s_internal: STD_LOGIC;

-- comb always block
begin
  COMB: process(state,Pcnt,Ptime,Ready,start,LcntNr_internal,LcntPon_internal,LcntWait_internal,Pon_internal,wait_s_internal) begin
    nextstate <= state; -- default to hold value because implied_loopback is set
    LcntNr_internal <= '0'; -- default
    LcntPon_internal <= '0'; -- default
    LcntWait_internal <= '0'; -- default
    Pon_internal <= '0'; -- default
    wait_s_internal <= '0'; -- default
    case state is
      when iddle              =>
        if (start='1') then
          nextstate <= loadpulse_time_cnt;
        else
          nextstate <= iddle;
        end if;

      when load_wati_cnt      =>
        LcntWait_internal <= '1';
        nextstate <= wait_t;

      when loadpulse_time_cnt =>
        LcntNr_internal <= '1';
        LcntPon_internal <= '1';
        nextstate <= pulse_on;

      when pulse_off          =>
        LcntPon_internal <= '1';
        if (Pcnt='1') then
          nextstate <= pulse_on;
        else
          nextstate <= load_wati_cnt;
        end if;

      when pulse_on           =>
        Pon_internal <= '1';
        if (Ptime='0') then
          nextstate <= pulse_off;
        else
          nextstate <= pulse_on;
        end if;

      when wait_t             =>
        wait_s_internal <= '1';
        if (Ready='1') then
          nextstate <= iddle;
        elsif (Ptime='0') then
          nextstate <= loadpulse_time_cnt;
        else
          nextstate <= wait_t;
        end if;

      when others =>

    end case;
  end process;

  -- Assign reg'd outputs to state bits

  -- Port renames for vhdl
  LcntNr <= LcntNr_internal;
  LcntPon <= LcntPon_internal;
  LcntWait <= LcntWait_internal;
  Pon <= Pon_internal;
  wait_s <= wait_s_internal;

  -- sequential always block
  FF: process(clk,rst,nextstate) begin
    if (rising_edge(clk)) then
      if (rst='1') then
        state <= iddle;
      else
        state <= nextstate;
      end if;
    end if;
  end process;
end fizzim;
