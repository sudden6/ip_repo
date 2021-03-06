--
-- VHDL Architecture training_lib.circuit_ch2_2c.rtl
--
-- Created:
--          by - net.UNKNOWN (KPERSM7467)
--          at - 20:14:10 20.10.2017
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity circuit_ch2_2c is
  port (buttons: in std_logic_vector(3 downto 0);
        sliders: in std_logic_vector(3 downto 0);
        encoder0: in std_logic_vector(1 downto 0);
        encoder1: in std_logic_vector(1 downto 0);
        clk: in std_logic;
        buzzer: out std_logic_vector(1 downto 0);
        leds: out std_logic_vector(3 downto 0)
        );  
end entity circuit_ch2_2c;

--
architecture rtl of circuit_ch2_2c is
  signal cnt: std_logic_vector(31 downto 0):= (others => '0'); -- init to zero for simulation
  signal sliders_q0,sliders_q1,sliders_q2: std_logic_vector(sliders'range);
begin

-- How many Flip Flops are inferred in this circuit? 
-- three stage shift registers for all slider signals 
  process(clk)
  begin
    if rising_edge(clk) then
      sliders_q0 <= sliders;
      sliders_q1 <= sliders_q0;
      sliders_q2 <= sliders_q1;
    end if;
  end process;
  
--synchronous counter with active high reset--
  process(clk)
  begin
    if rising_edge(clk) then
      if sliders_q2(0) = '1' then  ---synchronized signal slider SW0
        cnt <= (others => '0');
      elsif sliders_q2(1) = '1' then
        if sliders_q2(2) = '0' then
           cnt <= cnt+1;
        else
           cnt <= cnt-1;
        end if;
      end if;
    end if;
  end process;
        
-- connect slice of signal cnt to the LEDs
   leds <= cnt(27 downto 24)when sliders_q2(3)  ='0' else
           cnt(28 downto 25);
   
end architecture rtl;

