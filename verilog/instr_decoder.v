/* 
Instruction Decoder

Takes in an instruction, outputs all control signals for CPU components
*/


module instr_decoder (
    input [31:0] instruction,
    input clk,
    output reg branch, reg_write, mem_write, alu_src, jal,
    output reg [1:0] jump, reg_dst, mem_to_reg,
    output reg [2:0] alu_ctrl,
    output reg [4:0] Rs, Rt, Rd,
    output reg [15:0] immediate,
    output reg [25:0] target
);

parameter LW = 6'h23; //opcode parameters
parameter SW = 6'h2b;
parameter J = 6'h2;
parameter JAL = 6'h3;
parameter BNE = 6'h5;
parameter ADDI = 6'h8;
parameter FUNC = 6'h0;

parameter XORI = 6'he; //function parameters for R-types
parameter ADD = 6'h20;
parameter SUB = 6'h22;
parameter SLT = 6'h2a;
parameter JR = 6'h8;

reg [5:0] op_code, func_code;

// Listen for instruction change
always @(instruction) begin

    op_code = instruction[31:26];
    Rs = instruction[25:21];
    Rt = instruction[20:16];
    Rd = instruction[15:11];
    func_code = instruction[5:0];
    target = instruction[25:0];

    case (op_code)

        // Load word 
        LW: begin
            branch = 1'b0;
            reg_write = 1'b1;
            mem_write = 1'b0;
            alu_src = 1'b1;
            jal = 1'b0;
            jump = 2'b0;
            reg_dst = 2'b0;
            mem_to_reg = 2'b1;
            alu_ctrl = 3'b0;
            immediate = instruction[15:0];
        end

        // Store word
        SW: begin
            branch = 1'b0;
            reg_write = 1'b0;
            mem_write = 1'b1;
            alu_src = 1'b1;
            jal = 1'b0;
            jump = 2'b0;
            reg_dst = 2'bx;
            mem_to_reg = 2'bx;
            alu_ctrl = 3'b0;
            immediate = instruction[15:0];
        end

        // Jump
        J: begin
            branch = 1'b0;
            reg_write = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'bx;
            jal = 1'bx;
            jump = 2'b10;
            reg_dst = 2'bx;
            mem_to_reg = 2'bx;
            alu_ctrl = 3'bx;
            immediate = instruction[15:0];
        end

        // Jump aligned
        JAL: begin
            branch = 1'b0;
            reg_write = 1'b1;
            mem_write = 1'b0;
            alu_src = 1'bx;
            jal = 1'b1;
            jump = 2'b10;
            reg_dst = 2'b10;
            mem_to_reg = 2'b10;
            alu_ctrl = 3'bx;
            immediate = 16'd8;
        end

        // Branch not equal
        BNE: begin
            branch = 1'b1;
            reg_write = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            jal = 1'b0;
            jump = 2'b0;
            reg_dst = 2'bx;
            mem_to_reg = 2'bx;
            alu_ctrl = 3'b1;
            immediate = instruction[15:0];
        end

        // Add immediate
        ADDI: begin
            branch = 1'b0;
            reg_write = 1'b1;
            mem_write = 1'b0;
            alu_src = 1'b1;
            jal = 1'b0;
            jump = 2'b0;
            reg_dst = 2'b0;
            mem_to_reg = 2'b0;
            alu_ctrl = 3'b0;
            immediate = instruction[15:0];
        end

        // R-types, opcode = 0
        FUNC: begin
            branch = 1'b0;
            mem_write = 1'b0;
            mem_to_reg = 2'b0;
            jal = 1'b0;
            reg_dst = 2'b1;
            immediate = instruction[15:0];

            case (func_code)

                XORI: begin
                    reg_write = 1'b1;
                    alu_src = 1'b1;
                    jump =  2'b0;
                    alu_ctrl = 3'd2;
                end

                ADD: begin
                    reg_write = 1'b1;
                    alu_src = 1'b0;
                    jump =  2'b0;
                    alu_ctrl = 3'd0;
                end

                SUB: begin
                    reg_write = 1'b1;
                    alu_src = 1'b0;
                    jump = 2'b0;
                    alu_ctrl = 3'd1;
                end

                SLT: begin
                    reg_write = 1'b1;
                    alu_src = 1'b0;
                    jump = 2'b0;
                    alu_ctrl = 3'd3;
                end

                JR: begin
                    reg_write = 1'b0;
                    alu_src = 1'bx;
                    jump = 2'b1;
                    alu_ctrl = 3'bx;
                end
            endcase
        end

        // Default case
        default: begin
            branch = 1'b0;
            reg_write = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            jal = 1'b0;
            jump = 2'b0;
            reg_dst = 2'b0;
            mem_to_reg = 2'b0;
            alu_ctrl = 3'b0;
            immediate = instruction[15:0];
        end
    endcase
end
endmodule
