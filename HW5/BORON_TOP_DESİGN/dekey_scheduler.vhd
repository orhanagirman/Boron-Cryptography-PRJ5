----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:11:35 08/11/2020 
-- Design Name: 
-- Module Name:    key_scheduler - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dekey_scheduler is
    Port ( master_key : in  STD_LOGIC_VECTOR (79 downto 0);
	        wire : in STD_LOGIC_VECTOR (4 downto 0);
           output : out  STD_LOGIC_VECTOR (79 downto 0));
end dekey_scheduler;

architecture Behavioral of dekey_scheduler is

signal bs_port : STD_LOGIC_VECTOR (3 downto 0);
signal master_port : STD_LOGIC_VECTOR (79 downto 0);
signal master_port1 : STD_LOGIC_VECTOR (79 downto 0);
signal key_register : STD_LOGIC_VECTOR (79 downto 0);
signal xor_port : STD_LOGIC_VECTOR (4 downto 0);




component des_boxkey
   Port ( s_box_in : in  STD_LOGIC_VECTOR (3 downto 0);
          s_box_out : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

begin

sb : des_boxkey port map (s_box_in => key_register(3 downto 0), s_box_out => bs_port);



	 key_register <= master_key;
	 xor_port <= wire xor key_register(63 downto 59);
	 master_port1<= key_register(79 downto 64) & xor_port & key_register(58 downto 4) & bs_port;
	 master_port <= std_logic_vector(rotate_right(unsigned(master_port1),13));
	 
	 
	 
	 output <= master_port;

end Behavioral;

