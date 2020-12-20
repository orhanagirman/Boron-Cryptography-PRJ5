--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:27:09 08/11/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW/key_scheduler/test3.vhd
-- Project Name:  key_scheduler
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: key_scheduler
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
 
ENTITY test3 IS
END test3;
 
ARCHITECTURE behavior OF test3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT key_scheduler
    PORT(
         masterkey : IN  std_logic_vector(79 downto 0);
         output : OUT  std_logic_vector(79 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal masterkey : std_logic_vector(79 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(79 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: key_scheduler PORT MAP (
          masterkey => masterkey,
          output => output
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		masterkey<=x"0000080000000001c00e";
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
