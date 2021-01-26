library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity dds_tb is
end dds_tb;

architecture Behavioral of dds_tb is

constant PERIOD : time := 20 ns;

signal clk : STD_LOGIC := '0';
signal ctrl_word : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
signal data_out : STD_LOGIC_VECTOR(15 downto 0) := (others=>'0');


component dds
port (
   clk : in STD_LOGIC;
   ctrl_word : in STD_LOGIC_VECTOR (7 downto 0);
   data_out : out STD_LOGIC_VECTOR(15 downto 0)
   
);
end component;

begin

dds_1 : dds
port map (
   clk => clk,
   ctrl_word => ctrl_word,
   data_out => data_out 
);

clk <= not clk after PERIOD/2;

-- Test the DDS using several different control words (ctrl_word). Want to see several
-- cycles of the sine wave for each ctrl_word. Since the LUT has a depth of 255, need to 
-- wait 255 * PERIOD / ctrl_word to get one cycle.

process
begin
    ctrl_word <= (others=>'0');
    wait for 10 us;
    ctrl_word <= std_logic_vector(to_unsigned(2, ctrl_word'length));
    wait for 10 us;
    ctrl_word <= std_logic_vector(to_unsigned(5, ctrl_word'length));
    wait for 10 us;
    ctrl_word <= std_logic_vector(to_unsigned(10, ctrl_word'length));
    wait for 10 us;
    ctrl_word <= std_logic_vector(to_unsigned(20, ctrl_word'length));
    wait for 10 us;
    ctrl_word <= std_logic_vector(to_unsigned(30, ctrl_word'length));
    wait for 10 us;
    std.env.finish;
end process;



end Behavioral;
