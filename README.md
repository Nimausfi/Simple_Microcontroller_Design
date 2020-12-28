# Simple Microcontroller Design
\
\
<img src='design_SC.jpg' width = 1000>


+ **Compute instructions:** 
\
ADD, MULT, SHL, SHR –Read register file (RF) for operand(s), and write result to the register file.


+ **Memory access instructions:** 
\
LD, ST –Move data between the register file and the data memory (DMEM).


+ **Control flow instructions:** 
\
BR (branch)–Read register file (RF) for operands. Based on the outcome of comparing the operand data, redirect program counter (PC=offset), or continue sequential execution (PC=PC+1).
\
CALL, RET –CALL: Save PC+1 into link register, all registers into stack memory, and set PC=offset –RET: Restore registers from stack memory ,and load program counter from the link register.

--------------------------------------------------------------------------------------
**Instruction Encodings**
\
\
+ **Instruction Data [31:0] from IMEM:** (bits [31:15] are not used).

