-- VHDL Entity training_lib.tb_chapter1.symbol
--
-- Created:
--          by - net.UNKNOWN (KPERSM7467)
--          at - 13:08:06 19.10.2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2017.1a (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity tb_chapter1 is
-- Declarations

end tb_chapter1 ;

--
-- VHDL Architecture training_lib.tb_chapter1.struct
--
-- Created:
--          by - net.UNKNOWN (KPERSM7467)
--          at - 12:41:39 05.10.2018
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2017.1a (Build 5)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

library training_lib;

architecture struct of tb_chapter1 is

   -- Architecture declarations

   -- Internal signal declarations
   signal buttons   : std_logic_vector(3 downto 0);
   signal clk       : std_logic;
   signal encoder0  : std_logic_vector(1 downto 0);
   signal encoder1  : std_logic_vector(1 downto 0);
   signal leds_1_1a : std_logic_vector(3 downto 0);
   signal leds_1_1b : std_logic_vector(3 downto 0);
   signal leds_1_1c : std_logic_vector(3 downto 0);
   signal leds_1_1d : std_logic_vector(3 downto 0);
   signal leds_2f   : std_logic_vector(3 downto 0);
   signal sliders   : std_logic_vector(3 downto 0);


   -- Component Declarations
   component bhv_zybo_tester3
   generic (
      commands_g           : string  := "commands.txt";
      clk_period_g         : time    := 8 ns;
      strobe0_clk_cycles_g : integer := 10;
      strobe1_clk_cycles_g : integer := 10;
      reset_clk_cycles_g   : integer := 10
   );
   port (
      buttons  : out    std_logic_vector (3 downto 0);
      clk      : out    std_logic ;
      reset    : out    std_logic ;
      strobe0  : out    std_logic ;
      strobe1  : out    std_logic ;
      encoder0 : out    std_logic_vector (1 downto 0);
      encoder1 : out    std_logic_vector (1 downto 0);
      sliders  : out    std_logic_vector (3 downto 0)
   );
   end component;
   component circuit_ch1_1a
   port (
      buttons  : in     std_logic_vector (3 downto 0);
      clk      : in     std_logic;
      encoder0 : in     std_logic_vector (1 downto 0);
      encoder1 : in     std_logic_vector (1 downto 0);
      sliders  : in     std_logic_vector (3 downto 0);
      buzzer   : out    std_logic_vector (1 downto 0);
      leds     : out    std_logic_vector (3 downto 0)
   );
   end component;
   component circuit_ch1_1b
   port (
      buttons  : in     std_logic_vector (3 downto 0);
      clk      : in     std_logic;
      encoder0 : in     std_logic_vector (1 downto 0);
      encoder1 : in     std_logic_vector (1 downto 0);
      sliders  : in     std_logic_vector (3 downto 0);
      buzzer   : out    std_logic_vector (1 downto 0);
      leds     : out    std_logic_vector (3 downto 0)
   );
   end component;
   component circuit_ch1_1c
   port (
      buttons  : in     std_logic_vector (3 downto 0);
      clk      : in     std_logic;
      encoder0 : in     std_logic_vector (1 downto 0);
      encoder1 : in     std_logic_vector (1 downto 0);
      sliders  : in     std_logic_vector (3 downto 0);
      buzzer   : out    std_logic_vector (1 downto 0);
      leds     : out    std_logic_vector (3 downto 0)
   );
   end component;
   component circuit_ch1_1d
   port (
      buttons  : in     std_logic_vector (3 downto 0);
      clk      : in     std_logic;
      encoder0 : in     std_logic_vector (1 downto 0);
      encoder1 : in     std_logic_vector (1 downto 0);
      sliders  : in     std_logic_vector (3 downto 0);
      buzzer   : out    std_logic_vector (1 downto 0);
      leds     : out    std_logic_vector (3 downto 0)
   );
   end component;
   component circuit_ch1_2e
   port (
      buttons  : in     std_logic_vector (3 downto 0);
      clk      : in     std_logic;
      encoder0 : in     std_logic_vector (1 downto 0);
      encoder1 : in     std_logic_vector (1 downto 0);
      sliders  : in     std_logic_vector (3 downto 0);
      buzzer   : out    std_logic_vector (1 downto 0);
      leds     : out    std_logic_vector (3 downto 0)
   );
   end component;
   component circuit_ch1_2f
   port (
      buttons  : in     std_logic_vector (3 downto 0);
      clk      : in     std_logic;
      encoder0 : in     std_logic_vector (1 downto 0);
      encoder1 : in     std_logic_vector (1 downto 0);
      sliders  : in     std_logic_vector (3 downto 0);
      buzzer   : out    std_logic_vector (1 downto 0);
      leds     : out    std_logic_vector (3 downto 0)
   );
   end component;

   -- Optional embedded configurations
   -- pragma synthesis_off
   for all : bhv_zybo_tester3 use entity training_lib.bhv_zybo_tester3;
   for all : circuit_ch1_1a use entity training_lib.circuit_ch1_1a;
   for all : circuit_ch1_1b use entity training_lib.circuit_ch1_1b;
   for all : circuit_ch1_1c use entity training_lib.circuit_ch1_1c;
   for all : circuit_ch1_1d use entity training_lib.circuit_ch1_1d;
   for all : circuit_ch1_2e use entity training_lib.circuit_ch1_2e;
   for all : circuit_ch1_2f use entity training_lib.circuit_ch1_2f;
   -- pragma synthesis_on


begin

   -- Instance port mappings.
   U_4 : bhv_zybo_tester3
      generic map (
         commands_g           => "commands.txt",
         clk_period_g         => 8 ns,
         strobe0_clk_cycles_g => 10,
         strobe1_clk_cycles_g => 10,
         reset_clk_cycles_g   => 10
      )
      port map (
         buttons  => buttons,
         clk      => clk,
         reset    => open,
         strobe0  => open,
         strobe1  => open,
         encoder0 => encoder0,
         encoder1 => encoder1,
         sliders  => sliders
      );
   U_0 : circuit_ch1_1a
      port map (
         buttons  => buttons,
         sliders  => sliders,
         encoder0 => encoder0,
         encoder1 => encoder1,
         clk      => clk,
         buzzer   => open,
         leds     => leds_1_1a
      );
   U_1 : circuit_ch1_1b
      port map (
         buttons  => buttons,
         sliders  => sliders,
         encoder0 => encoder0,
         encoder1 => encoder1,
         clk      => clk,
         buzzer   => open,
         leds     => leds_1_1b
      );
   U_2 : circuit_ch1_1c
      port map (
         buttons  => buttons,
         sliders  => sliders,
         encoder0 => encoder0,
         encoder1 => encoder1,
         clk      => clk,
         buzzer   => open,
         leds     => leds_1_1c
      );
   U_3 : circuit_ch1_1d
      port map (
         buttons  => buttons,
         sliders  => sliders,
         encoder0 => encoder0,
         encoder1 => encoder1,
         clk      => clk,
         buzzer   => open,
         leds     => leds_1_1d
      );
   U_6 : circuit_ch1_2e
      port map (
         buttons  => buttons,
         sliders  => sliders,
         encoder0 => encoder0,
         encoder1 => encoder1,
         clk      => clk,
         buzzer   => open,
         leds     => open
      );
   U_5 : circuit_ch1_2f
      port map (
         buttons  => buttons,
         sliders  => sliders,
         encoder0 => encoder0,
         encoder1 => encoder1,
         clk      => clk,
         buzzer   => open,
         leds     => leds_2f
      );

end struct;
