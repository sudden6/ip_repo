--
-- VHDL Architecture training_lib.bhv_zybo_tester1.bhv
--
-- Created:
--          by - net.UNKNOWN (KPERSM7467)
--          at - 14:06:49 19.10.2017
--
-- using Mentor Graphics HDL Designer(TM) 2016.2 (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
Library std;
use std.textio.all;

entity bhv_zybo_tester1 is
   generic( 
      commands_g   : string := "commands.txt";
      clk_period_g : time   := 8 ns
   );
   port( 
      buttons  : out    std_logic_vector (3 downto 0);
      clk      : out    std_logic;
      encoder0 : out    std_logic_vector (1 downto 0);
      encoder1 : out    std_logic_vector (1 downto 0);
      sliders  : out    std_logic_vector (3 downto 0)
   );

-- Declarations

end bhv_zybo_tester1 ;

--
architecture bhv of bhv_zybo_tester1 is
  signal halt, stop: std_logic;
  signal clk_tmp: std_logic := '0';
  signal buttons_tmp: std_logic_vector(buttons'range) := (others => '0');
  signal sliders_tmp: std_logic_vector(sliders'range) := (others => '0');
  signal encoder0_tmp: std_logic_vector(encoder0'range) := (others => '1'); -- inactive '1'
  signal encoder1_tmp: std_logic_vector(encoder1'range) := (others => '1'); -- inactive '1'
  
  signal encoder0_cmd, encoder1_cmd: std_logic := '0';
  signal encoder0_dir, encoder0_val: integer;
  signal encoder1_dir, encoder1_val: integer;
  constant encoder_steptime: time := 5 us;
  
  -- convert ascii string into std_logic_vector-----------------------
  function ascii_vec4(binval: string(1 to 4)) return std_logic_vector is
     variable tmp: std_logic_vector(3 downto 0);
  begin
      tmp := (others => '0');
      if binval(1)='1' then
        tmp(3) := '1';
      end if;
      if binval(2)='1' then
        tmp(2) := '1';
      end if;
      if binval(3)='1' then
        tmp(1) := '1';
      end if;
      if binval(4)='1' then
        tmp(0) := '1';
      end if;
      return tmp;  
  end function ascii_vec4;
  
begin
  
       clk_tmp <= not clk_tmp after clk_period_g/2;
       clk <= clk_tmp;
       
       buttons <= buttons_tmp;
       sliders <= sliders_tmp;
       encoder0 <= encoder0_tmp;
       encoder1 <= encoder1_tmp;
       
  ------------------------------------------------------------------------------
   ---Read Command File
   ------------------------------------------------------------------------------
   
       readcmd:process
       file textfile:  text open read_mode is commands_g;
       variable l: line;
       variable cmd:  string(1 to 4);
       variable binval:  string(1 to 4);
       variable num: integer;
       variable separator: character;
       variable timestamp_v, waittime_v: time;
       variable dir: integer;
       begin
          while not endfile(textfile) loop
            wait until clk_tmp'event;  
            readline(textfile, l);
            read(l, cmd);
            case cmd is
               when "enc0" =>    read(l,separator);
                                 read(l,dir);
                                 encoder0_dir <= dir;
                                 read(l,separator);
                                 read(l,num);
                                 encoder0_val <= num;
                                 encoder0_cmd <= not encoder0_cmd;
               when "enc1" =>    read(l,separator);
                                 read(l,dir);
                                 encoder1_dir <= dir;
                                 read(l,separator);
                                 read(l,num);
                                 encoder1_val <= num;
                                 encoder1_cmd <= not encoder1_cmd;
                when "butn" =>    read(l,separator);
                                 read(l,binval);
                                 buttons_tmp <= ASCII_VEC4(binval);
               when "but0" =>    read(l,separator);
                                 read(l,num);
                                 if num = 0 then
                                   buttons_tmp(0) <= '0';
                                 else
                                   buttons_tmp(0) <= '1';
                                 end if;
               when "but1" =>    read(l,separator);
                                 read(l,num);
                                 if num = 0 then
                                   buttons_tmp(1) <= '0';
                                 else
                                   buttons_tmp(1) <= '1';
                                 end if;
               when "but2" =>    read(l,separator);
                                 read(l,num);
                                 if num = 0 then
                                   buttons_tmp(2) <= '0';
                                 else
                                   buttons_tmp(2) <= '1';
                                 end if;
               when "but3" =>   read(l,separator);
                                 read(l,num);
                                 if num = 0 then
                                   buttons_tmp(3) <= '0';
                                 else
                                   buttons_tmp(3) <= '1';
                                 end if;
               when "sldn" =>    read(l,separator);
                                 read(l,binval);
                                 sliders_tmp <= ASCII_VEC4(binval);
               when "sld0" =>    read(l,separator);
                                 read(l,num);
                                 if num = 0 then
                                   sliders_tmp(0) <= '0';
                                 else
                                   sliders_tmp(0) <= '1';
                                 end if;
               when "sld1" =>    read(l,separator);
                                 read(l,num);
                                 if num = 0 then
                                   sliders_tmp(1) <= '0';
                                 else
                                   sliders_tmp(1) <= '1';
                                 end if;
               when "sld2" =>    read(l,separator);
                                 read(l,num);
                                 if num = 0 then
                                   sliders_tmp(2) <= '0';
                                 else
                                   sliders_tmp(2) <= '1';
                                 end if;
               when "sld3" =>    read(l,separator);
                                 read(l,num);
                                 if num = 0 then
                                   sliders_tmp(3) <= '0';
                                 else
                                   sliders_tmp(3) <= '1';
                                 end if;
               when "time" =>   read(l,separator);
                                read(l,timestamp_v);
                                waittime_v := timestamp_v - now;
                                halt <= '1';
                                wait for waittime_v;  
                                halt <= '0';
               when "wait" =>   read(l,separator);
                                read(l,waittime_v);
                                halt <= '1';
                                wait for waittime_v;  
                                halt <= '0';
               when "----" =>   -- used for comments
    
   
                when others =>   assert false report "Unrecognised Instruction"
                                 severity failure;
            end case;                    
         
         end loop;
         stop <= '1';
         assert false report "Simulation complete" severity note;
   
         wait;
   
       end process readcmd;
  
        process
        begin
          wait until (encoder0_cmd'event);
          for i in 1 to encoder0_val loop
              if encoder0_dir = 0 then
                  encoder0_tmp <= "11";
                  wait for encoder_steptime;
                  encoder0_tmp <= "10";
                  wait for encoder_steptime;
                  encoder0_tmp <= "00";
                  wait for encoder_steptime;
                  encoder0_tmp <= "01";
                  wait for encoder_steptime;
                  encoder0_tmp <= "11";
              else
                  encoder0_tmp <= "11";
                  wait for encoder_steptime;
                  encoder0_tmp <= "01";
                  wait for encoder_steptime;
                  encoder0_tmp <= "00";
                  wait for encoder_steptime;
                  encoder0_tmp <= "10";
                  wait for encoder_steptime;
                  encoder0_tmp <= "11";
              end if; 
          end loop;
        end process;
        
        process 
        begin
          wait until (encoder1_cmd'event);
          for i in 1 to encoder1_val loop
              if encoder1_dir = 0 then
                  encoder1_tmp <= "11";
                  wait for encoder_steptime;
                  encoder1_tmp <= "10";
                  wait for encoder_steptime;
                  encoder1_tmp <= "00";
                  wait for encoder_steptime;
                  encoder1_tmp <= "01";
                  wait for encoder_steptime;
                  encoder1_tmp <= "11";
              else
                  encoder1_tmp <= "11";
                  wait for encoder_steptime;
                  encoder1_tmp <= "01";
                  wait for encoder_steptime;
                  encoder1_tmp <= "00";
                  wait for encoder_steptime;
                  encoder1_tmp <= "10";
                  wait for encoder_steptime;
                  encoder1_tmp <= "11";
              end if; 
          end loop;
          
        end process;
          
end architecture bhv;

