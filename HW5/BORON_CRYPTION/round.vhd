----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:05:20 08/12/2020 
-- Design Name: 
-- Module Name:    round - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity round is
    Port ( plain_text : in  STD_LOGIC_VECTOR (63 downto 0);
           master_round : in  STD_LOGIC_VECTOR (79 downto 0);
           cipher_text : out  STD_LOGIC_VECTOR (63 downto 0));
end round;

architecture Behavioral of round is

signal bs_port : STD_LOGIC_VECTOR (63 downto 0);
signal xor_port : STD_LOGIC_VECTOR (63 downto 0);
signal rp_port : STD_LOGIC_VECTOR (63 downto 0);
signal port_final : STD_LOGIC_VECTOR (63 downto 0);

component s_box
   Port ( s_box_in : in  STD_LOGIC_VECTOR (63 downto 0);
          s_box_out : out  STD_LOGIC_VECTOR (63 downto 0));
end component;	

component block_shuffle
    Port ( bs_in : in  STD_LOGIC_VECTOR (63 downto 0);
           bs_out : out  STD_LOGIC_VECTOR (63 downto 0));
end component;
		
component round_permutation
    Port ( rp_in : in  STD_LOGIC_VECTOR (63 downto 0);
           rp_out : out  STD_LOGIC_VECTOR (63 downto 0));
end component;	 

begin

sb : s_box port map (s_box_in => xor_port, s_box_out => bs_port);
bs : block_shuffle port map (bs_in => bs_port, bs_out => rp_port);
rp : round_permutation port map (rp_in => rp_port, rp_out => port_final);

 
xor_port <= plain_text xor master_round(63 downto 0);
cipher_text(63 downto 48)<= port_final(63 downto 48) xor port_final(47 downto 32) xor port_final(15 downto 0);
cipher_text(47 downto 32)<= port_final(47 downto 32) xor port_final(15 downto 0);
cipher_text(31 downto 16)<= port_final(63 downto 48) xor port_final(31 downto 16);
cipher_text(15 downto 0)<= port_final(63 downto 48) xor port_final(31 downto 16) xor port_final(15 downto 0);



end Behavioral;

