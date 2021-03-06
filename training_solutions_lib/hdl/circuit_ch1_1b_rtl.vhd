--
-- VHDL Architecture training_lib.circuit_ch1_1b.rtl
--
-- Created:
--          by - net.UNKNOWN (KPERSM7467)
--          at - 12:18:40 19.10.2017
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity circuit_ch1_1b is
  port (buttons: in std_logic_vector(3 downto 0);
        sliders: in std_logic_vector(3 downto 0);
        encoder0: in std_logic_vector(1 downto 0);
        encoder1: in std_logic_vector(1 downto 0);
        clk: in std_logic;
        buzzer: out std_logic_vector(1 downto 0);
        leds: out std_logic_vector(3 downto 0)
        );  
end entity circuit_ch1_1b;

--
architecture rtl of circuit_ch1_1b is
begin
  leds(0) <= buttons(3);
  leds(1) <= buttons(2);
  leds(2) <= buttons(1);
  leds(3) <= buttons(0);
end architecture rtl;

