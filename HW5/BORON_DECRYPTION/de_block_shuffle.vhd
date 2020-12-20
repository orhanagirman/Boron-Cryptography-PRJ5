----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:49 08/11/2020 
-- Design Name: 
-- Module Name:    block_shuffle - Behavioral 
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

entity de_block_shuffle is
    Port ( bs_in : in  STD_LOGIC_VECTOR (63 downto 0);
           bs_out : out  STD_LOGIC_VECTOR (63 downto 0));
end de_block_shuffle;

architecture Behavioral of de_block_shuffle is

signal bs_port :  STD_LOGIC_VECTOR (63 downto 0);

begin

     loop3 : for i in 0 to 3 generate
	               bs_port(16*i+7 downto 16*i)<= bs_in(16*i+15 downto 16*i+8);
	               bs_port(16*i+15 downto 16*i+8)<= bs_in(16*i+7 downto 16*i);						
				 end generate loop3;
				 bs_out<=bs_port;
				 

end Behavioral;

