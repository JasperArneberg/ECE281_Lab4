ECE281_Lab4
===========

Lab 4: PRISM ALU and Datapath

C3C Jasper Arneberg  
M6A ECE 281  
Dr. Neebel  

## ALU
#### Testing and Debugging

Here is the original screenshot that I got from the testbench output. Notice the XXXX value for the first result of opsel 001.

![alt text](https://github.com/JasperArneberg/ECE281_Lab3/blob/master/alu_waveform_output_1.png?raw=true "Incorrect Waveform Output for Opsel 001")

Here is the problematic section of code that was causing this problem:

#### Bad Code Sample 1
```
asdf
```

The main problem was that the temporary signal was being assigned its new values at the same time as the result output. This is because VHDL runs simultaneously in contrast to many other programs which run sequentially. Below is the improved waveform output and the code that was used to obtain it.

![alt text](https://github.com/JasperArneberg/ECE281_Lab3/blob/master/alu_waveform_output_2.png?raw=true "Correct Waveform Output")

#### Good Code Sample 1
```
asdf
```

asdf

#### Bad Code Sample 2
```
asdf
```

asdf

#### Good Code Sample 2
```
asdf
```

asdf

##Demonstrations
| Functionality | Witness | Date | Time |
| :--: | :--: | :--: | :----: |
| ALU |  | | |
| Datapath |  | | |


## Documentation
Switch case statements: http://www.ics.uci.edu/~jmoorkan/vhdlref/cases.html
