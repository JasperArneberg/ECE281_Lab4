ECE281_Lab4
===========

Lab 4: PRISM ALU and Datapath

C3C Jasper Arneberg  
M6A ECE 281  
Dr. Neebel  

## ALU
#### Testing and Debugging

Here is the original screenshot that I got from the testbench output. Notice the XXXX value for the first result of Opsel 001.

![alt text](https://github.com/JasperArneberg/ECE281_Lab4/blob/master/alu_testbench_output_1.png?raw=true "Incorrect Waveform Output for Opsel 001")

Here is the problematic section of code that was causing this problem:

#### Bad Code Sample 1
```
	when "001" => -- NEG (2's complement)
		Temp(0) <= not Accumulator(0);
		Temp(1) <= not Accumulator(1);
  		Temp(2) <= not Accumulator(2);
  		Temp(3) <= not Accumulator(3);
  		Result <= Temp + "0001";
```

The main problem was that the temporary signal was being assigned its new values at the same time as the result output. This is because VHDL runs simultaneously in contrast to many other programs which run sequentially. Below is the improved waveform output and the code that was used to obtain it.

![alt text](https://github.com/JasperArneberg/ECE281_Lab4/blob/master/alu_testbench_output_2.png?raw=true "Correct Waveform Output")

#### Good Code Sample 1
```
	when "001" => --NEG (2's complement)
		Result <= not Accumulator + "0001";
```

####Checking the ALU Testbench
| Opsel | Data | Accumulator | Expected Result |
| :--: | :--: | :--: | :--: |
| 000 | 0000 | 0000 | 0000 |
| 000 | 0000 | 0000 | 0000 |
| 000 | 0001 | 0010 | 0000 |
| 001 | 0001 | 0011 | 1101 |
| 001 | 0010 | 0100 | 1100 |
| 001 | 0010 | 0101 | 1011 |
In this format, I verified that the ALU worked correctly.

##Datapath Sim

####List of Instructions
| Time (nsec) | OpCode (from IR) | Pneumonic |
| 0 | 0 | NOP |
| 15 | 7 | LDAI |
| 55 | 3 | ROR |
| 85 | 4 | OUT |
| 125 | 0 | NOP |
| 145 | d | STA |
| 195 | b | JN |
| 245 | 3 | ROR |
| 275 | 4 | OUT | 
| 315 | 0 | NOP |
| 335 | d | STA |
| 385 | b | JN | 
| 435 | 3 | ROR |
| 465 | 4 | OUT |
| 505 | 0 | NOP |
| 525 | d | STA |
| 575 | b | JN |
| 625 | 9 | JMP |


####Analyzing 50 nsec to 100 nsec


####Analyzing 225 nsec


##Demonstrations
| Functionality | Witness | Date | Time |
| :--: | :--: | :--: | :----: |
| ALU Sim | Dr. Neebel | 8 April 2014 | 1332 |
| Datapath | Dr. Neebel | 10 April 2014 | 1425 |


## Documentation
Switch case statements: http://www.ics.uci.edu/~jmoorkan/vhdlref/cases.html
