-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : ALU
-- Author      : C3C Jasper T. Arneberg
-- Company     : usafa
--
-------------------------------------------------------------------------------
--
-- File        : ALU.vhd
-- Generated   : Fri Mar 30 11:16:54 2007
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-- Documentation: Original structure of program provided by course
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ALU} architecture {ALU}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
	 port(
		 OpSel : in STD_LOGIC_VECTOR(2 downto 0);
		 Data : in STD_LOGIC_VECTOR(3 downto 0);
		 Accumulator : in STD_LOGIC_VECTOR(3 downto 0);
		 Result : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end ALU;

--}} End of automatically maintained section

architecture ALU of ALU is	   

signal Temp : STD_LOGIC_VECTOR(3 downto 0);

begin
	
-- fill in details to create result as a function of Data and Accumulator, based on OpSel.
 -- e.g : Build a multiplexer choosing between the eight ALU operations.  Either use a case statement (and thus a process)
 --       or a conditional signal assignment statement ( x <= Y when <condition> else . . .)
 -- ALU Operations are defined as:
 -- OpSel : Function
--  0     : AND
--  1     : NEG (2s complement)
--  2     : NOT (invert)
--  3     : ROR
--  4     : OR
--  5     : IN
--  6     : ADD
--  7     : LD
aluswitch: process (Accumulator, Data, OpSel)
        begin
			Temp(0) <= not Accumulator(0);
			Temp(1) <= not Accumulator(1);
			Temp(2) <= not Accumulator(2);
			Temp(3) <= not Accumulator(3);
		  
		-- enter your if/then/else or case statements here
			case Opsel is 
				when "000" => --AND
					Result(0) <= Data(0) and Accumulator(0);
					Result(1) <= Data(1) and Accumulator(1);
					Result(2) <= Data(2) and Accumulator(2);
					Result(3) <= Data(3) and Accumulator(3);
				when "001" => --NEG (2's complement)
					Result <= Temp + "0001";
				when "010" => --NOT (invert)
					Result(0) <= not Accumulator(0);
					Result(1) <= not Accumulator(1);
					Result(2) <= not Accumulator(2);
					Result(3) <= not Accumulator(3);
				when "011" => --ROR
					Result(0) <= Accumulator(1);
					Result(1) <= Accumulator(2);
					Result(2) <= Accumulator(3);
					Result(3) <= Accumulator(0);
				when "100" => --OR
					Result(0) <= Accumulator(0) or Data(0);
					Result(1) <= Accumulator(1) or Data(1);
					Result(2) <= Accumulator(2) or Data(2);
					Result(3) <= Accumulator(3) or Data(3);
				when "101" => --IN
					Result <= Data;
				when "110" => --ADD
					Result <= Data + Accumulator;
				when "111" => --LDA
					Result <= Data;
				when others =>
					Result <= "XXXX";
			end case;
		end process;

-- OR, enter your conditional signal statement here

end ALU;

