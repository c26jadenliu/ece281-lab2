----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Jaden Liu
-- 
-- Create Date: 02/24/2025 10:23:48 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is
    -- Declare the component of your top-level design unit under test (UUT)
  component sevenseg_decoder is
    Port (
        i_Hex  : in  STD_LOGIC_VECTOR (3 downto 0);  -- 4-bit input (hex digit)
        o_seg_n : out STD_LOGIC_VECTOR (6 downto 0) -- 7-bit active-low output
    );
  end component;

  -- Declare signals needed to stimulate the UUT inputs
  signal w_addends : std_logic_vector(3 downto 0) := x"0"; -- Input hex digit
  signal w_sum     : std_logic_vector(6 downto 0); -- Output to seven-segment display

begin
  sevenseg_decoder_uut : sevenseg_decoder port map (
     i_Hex  => w_addends,
     o_seg_n => w_sum
  );
    test_process : process
    begin
    -- Test 0 (Expect: "1000000" -> Segments a-f ON, g OFF)
     w_addends <= x"0"; wait for 10 ns;
         assert (w_sum = "1000000") report "FAILED: Input 0" severity failure;
     
     -- Test 1 (Expect: "1111001" -> Segments b, c ON, others OFF)
     w_addends <= x"1"; wait for 10 ns;
         assert (w_sum = "1111001") report "FAILED: Input 1" severity failure;

     -- Test 2 (Expect: "0100100")
     w_addends <= x"2"; wait for 10 ns;
         assert (w_sum = "0100100") report "FAILED: Input 2" severity failure;

     -- Test 3 (Expect: "0110000")
     w_addends <= x"3"; wait for 10 ns;
         assert (w_sum = "0110000") report "FAILED: Input 3" severity failure;

     -- Test 4 (Expect: "0011001")
     w_addends <= x"4"; wait for 10 ns;
         assert (w_sum = "0011001") report "FAILED: Input 4" severity failure;

     -- Test 5 (Expect: "0010010")
     w_addends <= x"5"; wait for 10 ns;
         assert (w_sum = "0010010") report "FAILED: Input 5" severity failure;

     -- Test 6 (Expect: "0000010")
     w_addends <= x"6"; wait for 10 ns;
         assert (w_sum = "0000010") report "FAILED: Input 6" severity failure;

     -- Test 7 (Expect: "1111000")
     w_addends <= x"7"; wait for 10 ns;
         assert (w_sum = "1111000") report "FAILED: Input 7" severity failure;

     -- Test 8 (Expect: "0000000")
     w_addends <= x"8"; wait for 10 ns;
         assert (w_sum = "0000000") report "FAILED: Input 8" severity failure;

     -- Test 9 (Expect: "0010000")
     w_addends <= x"9"; wait for 10 ns;
         assert (w_sum = "0010000") report "FAILED: Input 9" severity failure;

     -- Test A (Expect: "0001000")
     w_addends <= x"A"; wait for 10 ns;
         assert (w_sum = "0001000") report "FAILED: Input A" severity failure;

     -- Test B (Expect: "0000011")
     w_addends <= x"B"; wait for 10 ns;
         assert (w_sum = "0000011") report "FAILED: Input B" severity failure;

     -- Test C (Expect: "1000110")
     w_addends <= x"C"; wait for 10 ns;
         assert (w_sum = "1000110") report "FAILED: Input C" severity failure;

     -- Test D (Expect: "0100001")
     w_addends <= x"D"; wait for 10 ns;
         assert (w_sum = "0100001") report "FAILED: Input D" severity failure;

     -- Test E (Expect: "0000110")
     w_addends <= x"E"; wait for 10 ns;
         assert (w_sum = "0000110") report "FAILED: Input E" severity failure;

     -- Test F (Expect: "0001110")
     w_addends <= x"F"; wait for 10 ns;
         assert (w_sum = "0001110") report "FAILED: Input F" severity failure;

     -- Test an invalid input (should be all segments OFF "1111111")
     w_addends <= "ZZZZ"; wait for 10 ns;
         assert (w_sum = "1111111") report "FAILED: Invalid input" severity failure;

end process;

end Behavioral;
