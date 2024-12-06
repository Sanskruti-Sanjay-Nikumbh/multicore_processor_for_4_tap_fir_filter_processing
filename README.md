# multicore_processor_for_4_tap_fir_filter_processing
 
This project presents the design and implementation of a multicore processor for a 4-tap FIR (Finite Impulse Response) filter using the RISC-V architecture.
Firstly, a single cycle RISC-V CPU was designed in Verilog HDL and then it was instantiated in top-level entity for 4 times i.e. to make a quad (4 core processor). From the top-level entity i.e. "multicore.v" file using core select line approach instructions associated with every core were delivered. 
Here, in this project each core did computations for 1 tap of fir filter i.e convolution operation for sample 1 and its coefficients.

#Single Cycle RISC-V processor

The datapath designed supports for R-type,I-type,Load,Store instructions. It does not support for floating point instructions.
Datapath:
![image](https://github.com/user-attachments/assets/16c7254b-dcc0-4bda-b009-704d8cbef183)


#Four tap FIR Filter

The filter was designed using Filter Designer APP in MATLAB. The coefficients were converted to nearest integer so that it can be compatible with the designed processor.
Filter specifications:

![image](https://github.com/user-attachments/assets/a0586b76-cde4-4565-a64c-479f92c826cd)

#Simulation Results according to the following inputs

Core No.	Instruction 	Input Sample	Filter Coeffcient 	ALUResult	Description
1	        mul x13,x5,x9    	6	              2	                12	    ALUResult
2	        mul x12,x6,x8	    7	              3	                21	    ALUResult
3       	mul x11,x3,x2	    8	              4	                32	    ALUResult
4	        mul x10,x4,x7    	9	              5	                45	    ALUResult



[1] Multicore CPU
![image](https://github.com/user-attachments/assets/6a7ed0c5-a511-4816-a850-d0abd43d273e)

[2] Core 1 instruction and data fetched correctly. Instruction (0092F6B3) ,Source Registers (A1 & A2 = 5 and 9) & Destination Register (A3 = 13) fetched correctly and data got fetched correctly. 

![image](https://github.com/user-attachments/assets/1de87864-9b90-4811-a30a-fc556d449c72)
![image](https://github.com/user-attachments/assets/f435c578-06f2-40b5-a467-5a37b756ca79)

[3] Core 2 instruction (00837633) ,Source Registers (A1 & A2 = 6 and 8) & Destination Register (A3 = 12) fetched correctly and data got fetched correctly. 

![image](https://github.com/user-attachments/assets/b6ae5934-6735-43f6-bc36-b2ad61c83932)
![image](https://github.com/user-attachments/assets/2c7830ad-fcf5-4ae2-9a19-3126284fde40)

[4] Core 3 Instruction (0021F5B3) ,Source Registers (A1 & A2 = 3 and 2) & Destination Register (A3 = 11) fetched correctly and data got fetched correctly.

![image](https://github.com/user-attachments/assets/3bc6d0f1-e331-4e6e-989e-638a605e2d97)
![image](https://github.com/user-attachments/assets/443ff0db-e17f-4eaa-b3a1-45f41da56858)

[5] Core 4 Instruction (00727533) ,Source Registers (A1 & A2 = 4 and 7) & Destination Register (A3 = 10) fetched correctly and data got fetched correctly.

![image](https://github.com/user-attachments/assets/8f4b9ef1-1011-49e0-a46e-8a5bd1365740)
![image](https://github.com/user-attachments/assets/d6640b9b-5bf2-4219-8325-21e39140e214)


#RTL Schematic 

![image](https://github.com/user-attachments/assets/e09e4b2e-ff1a-4215-a7ee-d175a0ee3f0f)







