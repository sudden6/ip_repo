--
-- VHDL Architecture training_lib.circuit_ch2_2j.rtl
--
-- Created:
--          by - net.UNKNOWN (KPERSM7467)
--          at - 12:18:49 21.10.2017
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity circuit_ch2_2j is
  port (buttons: in std_logic_vector(3 downto 0);
        sliders: in std_logic_vector(3 downto 0);
        encoder0: in std_logic_vector(1 downto 0);
        encoder1: in std_logic_vector(1 downto 0);
        clk: in std_logic;
        buzzer: out std_logic_vector(1 downto 0);
        leds: out std_logic_vector(3 downto 0)
        );  
end entity circuit_ch2_2j;

--
architecture rtl of circuit_ch2_2j is
begin
  leds(1 downto 0) <= encoder0;
  leds(3 downto 2) <= encoder1;
end architecture rtl;

