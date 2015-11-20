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
The two main new components introduced in this lab were the Instruction Fetch Unit and the Instruction Decode Unit. For this reason, we dedicated more time to testing these components, and for the most part, stuck with our testing strategies for components we had built previously - e.g. the ALU and Register Files.

Note: To run all tests, consult the README in the `/test` directory.

##### CPU Tests
To test the CPU, we ran full assembly programs written both by ourselves and by the class. To test all the features, we ensured that all 11 instructions appeared in the test programs. The process we followed was - 1. Compile assembly in MARS 2. Output instructions from MARS 3. Run `/test/cpu` with the correct instruction file specified in our CPU. 4. Verify that the output is as expected.

##### Instruction Fetch Unit
To test the Instruction Fetch Unit, we exhaustively tested all the cases for which our PC should increment - the normal case, in which PC should increment by 4, the jump case, in which PC should increment by the specified amount in the instruction, and the branch case, when PC should jump to the completely new address specified in the instruction.

##### Instruction Decode Unit
To test the Instruction Decode Unit, we

##### Register File
To test the Register File, we

##### ALU
To test the Arithmetic Logic Unit, we 


#### Performance Analysis
------
Here is our performance analysis. (see files in /reports)

##### Power Usage

| Property                 | Value  |
|:-------------------------|:-------|
| Total On-Chip Power (W)  | 0.103  |
| Dynamic (W)              | 0.000  |
| Device Static (W)        | 0.103  |
| Effective TJA (C/W)      | 11.5   |
| Max Ambient (C)          | 83.8   |
| Junction Temperature (C) | 26.2   |

##### Component Usage

| Component             | Count |
|:----------------------|:------|
| 3 Input 30 Bit Adder  | 1     |
| 2 Input 1 Bit XOR     | 354   |
| 32 Bit Register       | 32    |
| 30 Bit Register       | 1     |
| 2 Input 32 Bit Mux    | 3     |
| 2 Input 30 Bit Mux    | 1     |
| 4 Input 30 Bit Mux    | 2     |
| 2 Input 5 Bit Mux     | 2     |
| 8 Input 3 Bit Mux     | 1     |
| 6 Input 3 Bit Mux     | 1     |
| 4 Input 3 Bit Mux     | 1     |
| 8 Input 2 Bit Mux     | 6     |
| 6 Input 2 Bit Mux     | 1     |
| 3 Input 2 Bit Mux     | 1     |
| 8 Input 1 Bit Mux     | 5     |
| 6 Input 1 Bit Mux     | 7     |
| 3 Input 1 Bit Mux     | 1     |
| 4 Input 1 Bit Mux     | 1     |

#### Work Plan Reflection
------
Here is our reflection on our work plan.
