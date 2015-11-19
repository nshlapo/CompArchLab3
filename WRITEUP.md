## Computer Architecture Lab 3 - CPU
###### Sarah Walters, Patrick Huston, and Nur Shlapobersky

#### CPU Design
------
We implemented a single-cycle CPU. Include our diagram, high-level explanation, overview, etc.

Our CPU includes an instruction fetch block with a program counter, an instruction decode block, a register file for temporary values, a data memory for program instructions and persistent values, and an ALU which supports eight arithmetic operations.
![Single-Cycle CPU Block Diagram](/img/cpu.png "Single-Cycle CPU Block Diagram")

The instruction fetch block supports sequential program execution as well as branch if not equal, jump, jump to register, and jump and link commands. It works with 30-bit values, then left shifts by two to output an address which is 32 bits long and always divisible by 4.
![Instruction Fetch Block Diagram](/img/instr_fetch.png "Instruction Fetch Block Diagram")

Our CPU supports eleven MIPS instructions. It uses a look-up table keyed on op code to determine which flags to set in each cycle.
![Instruction Fetch Block Diagram](/img/instr_decode.png "Instruction Fetch Block Diagram")

#### Testing Strategy
------
Here are all of the tests we ran! 


#### Performance Analysis
------
Here is our performance analysis.


#### Work Plan Reflection
------
Here is our reflection on our work plan.
