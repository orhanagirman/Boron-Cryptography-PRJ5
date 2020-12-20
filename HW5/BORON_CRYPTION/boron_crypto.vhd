----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:55 08/12/2020 
-- Design Name: 
-- Module Name:    boron_crypto - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity boron_crypto is
    Port ( clock : in STD_LOGIC;
	        reset: in STD_LOGIC;
	        plaintext : in  STD_LOGIC_VECTOR (63 downto 0);
           masterkey : in  STD_LOGIC_VECTOR (79 downto 0);
           ciphertext : out  STD_LOGIC_VECTOR (63 downto 0));
end boron_crypto;

architecture Behavioral of boron_crypto is

signal cipher_port : STD_LOGIC_VECTOR (63 downto 0);
signal master_port : STD_LOGIC_VECTOR (79 downto 0);
signal cipher_port2 : STD_LOGIC_VECTOR (63 downto 0);
signal master_port2 : STD_LOGIC_VECTOR (79 downto 0);
signal for_wire,wire: STD_LOGIC_VECTOR (4 downto 0):="00000";

component round
    Port ( plain_text : in  STD_LOGIC_VECTOR (63 downto 0);
           master_round : in  STD_LOGIC_VECTOR (79 downto 0);
           cipher_text : out  STD_LOGIC_VECTOR (63 downto 0));
end component;

component key_scheduler
    Port ( master_key : in  STD_LOGIC_VECTOR (79 downto 0);
	        wire : in STD_LOGIC_VECTOR (4 downto 0);
           output : out  STD_LOGIC_VECTOR (79 downto 0));
end component;
			  
begin

ks1: key_scheduler port map (master_key => master_port2, wire => wire, output => master_port);
r1: round port map (plain_text => cipher_port2, master_round => master_port2, cipher_text => cipher_port);


     process(clock,reset,plaintext,masterkey)
	  begin
	       if rising_edge(clock) then
			      if(reset = '0') then
					   master_port2 <= masterkey;
                  cipher_port2 <= plaintext;
						wire <= for_wire;					
					else
					   if(wire<24) then
					      master_port2 <= master_port;
                     cipher_port2 <= cipher_port;
							wire <= wire +1 ;
						end if;		
               end if;     				
			 end if;
          if (wire = 24) then			 
     		   ciphertext <= master_port(63 downto 0) xor cipher_port; 	
			 end if;	
     end process;


end Behavioral;


