----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Jaden Liu
-- 
-- Create Date: 02/24/2025 10:23:48 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: Lab 2
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
     w_addends <= x"0"; wait for 10 ns;
         assert (w_sum = "1000000") report "FAILED: Input 0" severity failure;
     
     w_addends <= x"1"; wait for 10 ns;
         assert (w_sum = "1111001") report "FAILED: Input 1" severity failure;

     w_addends <= x"2"; wait for 10 ns;
         assert (w_sum = "0100100") report "FAILED: Input 2" severity failure;

     w_addends <= x"3"; wait for 10 ns;
         assert (w_sum = "0110000") report "FAILED: Input 3" severity failure;

     w_addends <= x"4"; wait for 10 ns;
         assert (w_sum = "0011001") report "FAILED: Input 4" severity failure;

     w_addends <= x"5"; wait for 10 ns;
         assert (w_sum = "0010010") report "FAILED: Input 5" severity failure;

     w_addends <= x"6"; wait for 10 ns;
         assert (w_sum = "0000010") report "FAILED: Input 6" severity failure;

     w_addends <= x"7"; wait for 10 ns;
         assert (w_sum = "1111000") report "FAILED: Input 7" severity failure;

     w_addends <= x"8"; wait for 10 ns;
         assert (w_sum = "0000000") report "FAILED: Input 8" severity failure;

     w_addends <= x"9"; wait for 10 ns;
         assert (w_sum = "0010000") report "FAILED: Input 9" severity failure;
         report "Output for 9: " & std_logic_vector'image(w_sum);
     w_addends <= x"A"; wait for 10 ns;
         assert (w_sum = "0001000") report "FAILED: Input A" severity failure;

     w_addends <= x"B"; wait for 10 ns;
         assert (w_sum = "0000011") report "FAILED: Input B" severity failure;

     w_addends <= x"C"; wait for 10 ns;
         assert (w_sum = "1000110") report "FAILED: Input C" severity failure;

     w_addends <= x"D"; wait for 10 ns;
         assert (w_sum = "0100001") report "FAILED: Input D" severity failure;

     w_addends <= x"E"; wait for 10 ns;
         assert (w_sum = "0000110") report "FAILED: Input E" severity failure;

     w_addends <= x"F"; wait for 10 ns;
         assert (w_sum = "0001110") report "FAILED: Input F" severity failure;

     -- Test an invalid input (all off)
     w_addends <= "ZZZZ"; wait for 10 ns;
         assert (w_sum = "1111111") report "FAILED: Invalid input" severity failure;

end process;

end Behavioral;
