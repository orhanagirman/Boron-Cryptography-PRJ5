----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:12:16 08/11/2020 
-- Design Name: 
-- Module Name:    round_permutation - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity de_round_permutation is
    Port ( rp_in : in  STD_LOGIC_VECTOR (63 downto 0);
           rp_out : out  STD_LOGIC_VECTOR (63 downto 0));
end de_round_permutation;

architecture Behavioral of de_round_permutation is



begin

rp_out(15 downto 0) <= std_logic_vector(rotate_right(unsigned(rp_in(15 downto 0)),1));
rp_out(31 downto 16) <= std_logic_vector(rotate_right(unsigned(rp_in(31 downto 16)),4));
rp_out(47 downto 32) <= std_logic_vector(rotate_right(unsigned(rp_in(47 downto 32)),7));
rp_out(63 downto 48) <= std_logic_vector(rotate_right(unsigned(rp_in(63 downto 48)),9));


end Behavioral;

