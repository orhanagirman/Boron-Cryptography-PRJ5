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

entity de_round is
    Port ( cipher_text : in  STD_LOGIC_VECTOR (63 downto 0);
           master_round : in  STD_LOGIC_VECTOR (63 downto 0);
           plain_text : out  STD_LOGIC_VECTOR (63 downto 0));
end de_round;

architecture Behavioral of de_round is

signal bs_port : STD_LOGIC_VECTOR (63 downto 0);
signal xor_port : STD_LOGIC_VECTOR (63 downto 0);
signal rp_port : STD_LOGIC_VECTOR (63 downto 0);
signal port_final : STD_LOGIC_VECTOR (63 downto 0);

component de_s_box
   Port ( s_box_in : in  STD_LOGIC_VECTOR (63 downto 0);
          s_box_out : out  STD_LOGIC_VECTOR (63 downto 0));
end component;	

component de_block_shuffle
    Port ( bs_in : in  STD_LOGIC_VECTOR (63 downto 0);
           bs_out : out  STD_LOGIC_VECTOR (63 downto 0));
end component;
		
component de_round_permutation
    Port ( rp_in : in  STD_LOGIC_VECTOR (63 downto 0);
           rp_out : out  STD_LOGIC_VECTOR (63 downto 0));
end component;	 

begin

rp : de_round_permutation port map (rp_in => rp_port, rp_out => bs_port);
bs : de_block_shuffle port map (bs_in => bs_port, bs_out => xor_port);
sb : de_s_box port map (s_box_in => xor_port, s_box_out => port_final);



 
rp_port(15 downto 0)<=cipher_text(15 downto 0) xor cipher_text(31 downto 16); 
rp_port(31 downto 16)<= cipher_text(31 downto 16) xor cipher_text(47 downto 32) xor cipher_text(63 downto 48);
rp_port(47 downto 32)<= cipher_text(47 downto 32) xor cipher_text(31 downto 16) xor cipher_text(15 downto 0);
rp_port(63 downto 48)<= cipher_text(63 downto 48) xor cipher_text(47 downto 32);


plain_text <= port_final xor master_round(63 downto 0);



end Behavioral;

