-- 
--
-- VHDL Architecture sdi_hdsd_tx.register_array.rtl
--
-- Created:
--          by  C. Netzberger (KPROJR2611)
--          FH JOANNEUM
--          Werk-VI Str. 46 /Kapfenberg / Austria
--          at - 10:02:43 20.07.2006
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.1 (Build 83)
--
-- 
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;
library work;
use work.busdef.ALL;

entity register_array_be is
   generic( 
      addr_width_g : integer := 8;      --width of address
      data_width_g : integer := 8;      --width of data
      addr_base_g  : std_logic_vector;
      addr_range_g : std_logic_vector;
      nregs_g      : integer := 16      --number of registers
   );
   port( 
      sbus_o   : out    sbus_o_t;
      sbus_i   : in     sbus_i_t;
      reg_din  : in     std_logic_vector ( nregs_g*data_width_g-1 downto 0 );  -- parallel input for readback
      reg_dout : out    std_logic_vector ( nregs_g*data_width_g-1 downto 0 );  -- parallel output of all registers
      we       : out    std_logic_vector ( nregs_g-1 downto 0);                -- active high write strobes
      reset    : in     std_logic;                                             -- synchronous, active high reset
      clk      : in     std_logic                                              -- register clock
   );

-- Declarations

end register_array_be ;

--  
architecture rtl of register_array_be is

signal bus_addr :     std_logic_vector (addr_width_g-1 downto 0);            -- register address
signal reg_addr :     std_logic_vector (log2(nregs_g)-1 downto 0);            -- register address
signal bus_cs   :     std_logic;                                             -- chip select, active high
signal bus_din  :     std_logic_vector (data_width_g-1 downto 0);            -- bus input data
signal bus_be   :     std_logic_vector (data_width_g/8-1 downto 0);            -- byte enable, active high
signal bus_we   :     std_logic;                                             -- write enable, active high
signal bus_rd   :     std_logic;                                             -- write enable, active high
signal bus_dout :     std_logic_vector (data_width_g-1 downto 0);            -- bus output data
signal bus_ack  :     std_logic;

signal reg: std_logic_vector(nregs_g*data_width_g - 1 downto 0);
 
begin
  
  -- connect to slave bus --
  bus_addr    <= sbus_i.addr(bus_addr'range);
  reg_addr    <= sbus_i.addr(reg_addr'range);
  bus_din     <= sbus_i.wdata(bus_din'range);
  bus_be      <= sbus_i.be;
  bus_we      <= sbus_i.we;
  bus_rd      <= sbus_i.rd;
  sbus_o.rdata <= bus_dout;
  sbus_o.ack  <= bus_ack;
  
  -- addr decoder
  bus_cs <= '1' when bus_addr >= addr_base_g and bus_addr < (addr_base_g + addr_range_g) else '0';
  
  --- Write to Register Array ----------------------------------------------------------------
  process(clk)
  begin
     if clk ='1' and clk'event then
       we <= (others => '0'); 
        for i in 0 to nregs_g-1 loop
           if reset = '1' then
              reg((i+1)*data_width_g-1 downto i*data_width_g) <= (others => '0');
           elsif reg_addr = i and bus_cs = '1' and bus_we = '1' then
              for k in bus_be'range loop --byte access
                reg(i*data_width_g+7+ k*8 downto i*data_width_g +k*8) <= bus_din(7 + k*8 downto k*8);
              end loop;
              we(i) <= '1';
           end if;
       end loop;
     end  if;
  end process; 
  
  --Read from Register Array--------------------
  process(reg, bus_addr, bus_cs,reg_din)
  begin
     bus_dout <= (others => '0');
     for i in 0 to nregs_g-1 loop
        if reg_addr = i and bus_cs = '1'  then
             bus_dout <= reg_din((i+1)*data_width_g-1 downto i*data_width_g);
        end if;
     end loop;
  end process;
  
  reg_dout <= reg; 
  
  bus_ack <= bus_cs and (bus_we or bus_rd);
  
end architecture rtl;

