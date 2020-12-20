----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:12 08/11/2020 
-- Design Name: 
-- Module Name:    s_box - Behavioral 
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

entity s_box is
    Port ( s_box_in : in  STD_LOGIC_VECTOR (63 downto 0);
           s_box_out : out  STD_LOGIC_VECTOR (63 downto 0));
end s_box;

architecture Behavioral of s_box is

signal s_box_port : STD_LOGIC_VECTOR (63 downto 0);

begin

process(s_box_in)
begin

loop2: for i in 0 to 15 loop
				if (s_box_in ((4*i+3) downto 4*i) = x"0") then
					 s_box_port((4*i+3) downto 4*i) <=x"E";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"1") then
					 s_box_port((4*i+3) downto 4*i) <=x"4";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"2") then
					 s_box_port((4*i+3) downto 4*i) <=x"B";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"3") then
					 s_box_port((4*i+3) downto 4*i) <=x"1";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"4") then
					 s_box_port((4*i+3) downto 4*i) <=x"7";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"5") then
					 s_box_port((4*i+3) downto 4*i) <=x"9";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"6") then
					 s_box_port((4*i+3) downto 4*i) <=x"C";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"7") then
					 s_box_port((4*i+3) downto 4*i) <=x"A";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"8") then
				    s_box_port((4*i+3) downto 4*i) <=x"D";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"9") then
				    s_box_port((4*i+3) downto 4*i) <=x"2";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"A") then
				    s_box_port((4*i+3) downto 4*i) <=x"0";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"B") then
				    s_box_port((4*i+3) downto 4*i) <=x"F";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"C") then
				    s_box_port((4*i+3) downto 4*i) <=x"8";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"D") then
				    s_box_port((4*i+3) downto 4*i) <=x"5";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"E") then
				    s_box_port((4*i+3) downto 4*i) <=x"3";
				elsif (s_box_in ((4*i+3) downto 4*i) = x"F") then
				    s_box_port((4*i+3) downto 4*i) <=x"6"; 
            end if;						 						   
end loop loop2;	 
end process;
s_box_out <= s_box_port;					  
end Behavioral;

