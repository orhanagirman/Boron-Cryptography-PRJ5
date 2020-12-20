--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:20:21 08/13/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/BORON/boron/test.vhd
-- Project Name:  boron
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: boron
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
 
    COMPONENT boron
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         sw : IN  std_logic;
         ciphertext : INOUT  std_logic_vector(63 downto 0);
         masterkey : IN  std_logic_vector(79 downto 0);
         plaintext : INOUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal sw : std_logic := '0';
   signal masterkey : std_logic_vector(79 downto 0) := (others => '0');

	--BiDirs
   signal ciphertext : std_logic_vector(63 downto 0);
   signal plaintext : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: boron PORT MAP (
          clock => clock,
          reset => reset,
          sw => sw,
          ciphertext => ciphertext,
          masterkey => masterkey,
          plaintext => plaintext
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
		sw<='0';
		reset<='0';
	   masterkey <= x"00000000000000000000";
		plaintext <= x"0000000000000000";
      wait for 100 ns;
		sw<='0';
		reset<='1';
      wait for 500 ns;
		sw<='1';
		reset<='0';
		wait for 100 ns;
		sw<='1';
		reset<='1';

		
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
