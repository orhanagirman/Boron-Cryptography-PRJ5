--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:45:46 08/12/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/boron yeni/boron_crypto/test.vhd
-- Project Name:  boron_crypto
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: boron_crypto
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
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT boron_crypto
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         plaintext : IN  std_logic_vector(63 downto 0);
         masterkey : IN  std_logic_vector(79 downto 0);
         ciphertext : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal plaintext : std_logic_vector(63 downto 0) := (others => '0');
   signal masterkey : std_logic_vector(79 downto 0) := (others => '0');

 	--Outputs
   signal ciphertext : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: boron_crypto PORT MAP (
          clock => clock,
          reset => reset,
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
		reset <= '0';
		masterkey <= x"00000000000000000000";
		plaintext <= x"0000000000000000";
      wait for 10 ns;
		reset <= '1';
		
		

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
