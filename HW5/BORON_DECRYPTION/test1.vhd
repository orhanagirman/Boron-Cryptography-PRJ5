--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:34:40 08/12/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/boron yeni/boron_decrypto/test1.vhd
-- Project Name:  boron_decrypto
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: boron_decrypto
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test1 IS
END test1;
 
ARCHITECTURE behavior OF test1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT boron_decrypto
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         sw : IN  std_logic;
         plaintext : IN  std_logic_vector(63 downto 0);
         masterkey : IN  std_logic_vector(79 downto 0);
         ciphertext : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal sw : std_logic := '0';
   signal plaintext : std_logic_vector(63 downto 0) := (others => '0');
   signal masterkey : std_logic_vector(79 downto 0) := (others => '0');

 	--Outputs
   signal ciphertext : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: boron_decrypto PORT MAP (
          clock => clock,
          reset => reset,
          sw => sw,
          plaintext => plaintext,
          masterkey => masterkey,
          ciphertext => ciphertext
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
