----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:25 08/13/2020 
-- Design Name: 
-- Module Name:    boron - Behavioral 
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

entity boron is
    Port ( clock : in STD_LOGIC;
	        reset: in STD_LOGIC;
			  sw: in STD_LOGIC;
	        ciphertext : inout  STD_LOGIC_VECTOR (63 downto 0);
           masterkey : in  STD_LOGIC_VECTOR (79 downto 0);
           plaintext : in  STD_LOGIC_VECTOR (63 downto 0);
			  de_plaintext : out  STD_LOGIC_VECTOR (63 downto 0) );
end boron;

architecture Behavioral of boron is

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

component dekey_scheduler
    Port ( master_key : in  STD_LOGIC_VECTOR (79 downto 0);
	        wire : in STD_LOGIC_VECTOR (4 downto 0);
           output : out  STD_LOGIC_VECTOR (79 downto 0));
end component;

component de_round
    Port ( cipher_text : in  STD_LOGIC_VECTOR (63 downto 0);
           master_round : in  STD_LOGIC_VECTOR (63 downto 0);
           plain_text : out  STD_LOGIC_VECTOR (63 downto 0));
end component;	

signal cipher_port : STD_LOGIC_VECTOR (63 downto 0);
signal master_port : STD_LOGIC_VECTOR (79 downto 0);
signal cipher_port2 : STD_LOGIC_VECTOR (63 downto 0);
signal master_port2 : STD_LOGIC_VECTOR (79 downto 0);
signal for_wire,wire: STD_LOGIC_VECTOR (4 downto 0):="00000";

signal for_wire1,wire1: STD_LOGIC_VECTOR (4 downto 0):="00000";
signal for_wire2,wire2: STD_LOGIC_VECTOR (4 downto 0):="11000";
signal plain_port : STD_LOGIC_VECTOR (63 downto 0);
signal de_cipher_port : STD_LOGIC_VECTOR (63 downto 0);
signal de_master_port : STD_LOGIC_VECTOR (79 downto 0);
signal de_master_port2 : STD_LOGIC_VECTOR (79 downto 0);
signal de_master_port3 : STD_LOGIC_VECTOR (79 downto 0);
signal de_master_port4 : STD_LOGIC_VECTOR (79 downto 0);



begin

ks1: key_scheduler port map (master_key => master_port2, wire => wire, output => master_port);
r: round port map (plain_text => cipher_port2, master_round => master_port2, cipher_text => cipher_port);


--ks2: key_scheduler port map (master_key => master_port2, wire => wire1, output => de_master_port);
dks: dekey_scheduler port map (master_key => de_master_port3, wire => wire2, output => de_master_port4);
dr: de_round port map (cipher_text => de_cipher_port, master_round => de_master_port4(63 downto 0), plain_text => plain_port);



     process(clock,reset,plaintext,masterkey,ciphertext)
	  begin
	       if rising_edge(clock) then
			      if(sw = '0') then
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
						if (wire = 24) then			 
     		             ciphertext <= master_port(63 downto 0) xor cipher_port; 	
			         end if;	
					elsif(sw = '1') then
                     if (wire = 24 and wire2 =24) then
								 de_cipher_port <= ciphertext xor master_port(63 downto 0);
							end if;
                     if(reset = '0') then
							   de_master_port3 <= master_port;
							   wire2 <= for_wire2;					
						   else
							    if(wire2<25) and (wire2>0)  then
								    de_master_port3 <= de_master_port4;
								    de_cipher_port <= plain_port;
								    wire2 <= wire2-1 ;
							    end if;
								 if(wire2 = 0) then
                            de_plaintext <= plain_port;
                         end if; 								 
					      end if;							
					end if;
           end if;						
     end process;

end Behavioral;

