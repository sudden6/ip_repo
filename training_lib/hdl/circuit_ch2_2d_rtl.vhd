--
-- VHDL Architecture training_lib.circuit_ch2_2d.rtl
--
-- Created:
--          by - net.UNKNOWN (KPERSM7467)
--          at - 20:26:21 20.10.2017
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity circuit_ch2_2d is
  port (buttons: in std_logic_vector(3 downto 0);
        sliders: in std_logic_vector(3 downto 0);
        encoder0: in std_logic_vector(1 downto 0);
        encoder1: in std_logic_vector(1 downto 0);
        clk: in std_logic;
        buzzer: out std_logic_vector(1 downto 0);
        leds: out std_logic_vector(3 downto 0)
        );  
end entity circuit_ch2_2d;

--
architecture rtl of circuit_ch2_2d is
begin
  
end architecture rtl;

