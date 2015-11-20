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

After some debugging with handling `J` and `BNE` instructions, our CPU was able to perform proficiently with a wide variety of test assembly programs.

##### Instruction Fetch Unit
To test the Instruction Fetch Unit, we exhaustively tested all the cases for which our PC should increment - 

1. The normal case, in which PC should increment by 4
2. The jump case, in which PC should jump to the instruction at the target address specified in the current instruction
3. The branch case, when PC should increment by 4 plus the increment amount specified in the current instruction

Under all reasonable test conditions, our Instruction Fetch unit read in the correct instructions, and incremented PC accordingly. 

##### Instruction Decode Unit
We chose to not explicitly write tests for our instruction decode unit, for two calculated reasons. First, the instruction decode simply takes in an instruction, and outputs a bunch of different flags based on this instruction. To test this, we would have had to write a test that mirrored our original control flag spreadsheet (shown above). The only thing we'd really be testing at that point is whether we typed all the flags in correctly, and in this, we run into the likelihood that we would make the same or different mistakes when writing the test. Second, we realized that we could sufficiently test our Instruction Decode unit by simply running several test assembly programs through our CPU. If our CPU performed correctly, it is reasonable to jump to the conclusion that our Instruction Decode unit was working properly. In running these tests, we encountered no errors in our instruction decode unit, and found it to work correctly in a wide variety of possible situations.

##### Register File
To test the Register File, we ran thde same tests we created under the test specifications provided in the register file assignment. We found these tests to be sufficiently exhaustive to ensure that our register file performed as expected.

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
Our work plan was very effective in ensuring that we were able to complete our lab and thoroughly test without much stress.
We scheduled our work into four 2.5h blocks in which we completed the vast majority of our work, even though the tasks we assigned to each block weren't completely accurate.
We began our work by creating the instruction table shown above, which informed most of the modifications we made to our initial CPU design, and streamlined much of our later work.
We spent far less time redesigning our CPU than we allocated, because we realized that a majority of our components were already created (ALU, registers, etc...).
We didn't use a mid-point check-in, although we felt that we had been making excellent progress, and everything we had already designed was tested and functioning properly.
We spent the majority of our next meeting creating an instruction decoder, which took approximately the amount of time we had assigned to it, and the final meeting performing various assembly tests.

