module instr_fetch (
    input clk, branch, zero, jal,
    input [1:0] jump,
    input [15:0] imm16,
    input [25:0] target,
    input [31:0] Da,
    output [29:0] outAdder,
    output [31:0] address
);

    wire [29:0] extended, inAdder, pcIn, concWire;
    wire orWire, andWire;
    reg [29:0] PC = 30'h0;

    sign_extend #(30) ext (.immediate(imm16),
                           .extended(extended));

    and AND (andWire, branch, zero);
    or OR (orWire, jal, andWire);

    // branch/jal control mux
    assign inAdder = andWire ? extended : 30'b0;

    // behavioral adder
    assign outAdder = PC + inAdder + 1;

    // jump operation
    assign concWire = {PC[29:26], target};


    // jump control multiplexer
    wire[2:0] jumpMux[29:0];
    assign jumpMux[0] = concWire;
    assign jumpMux[1] = Da[31:2];
    assign jumpMux[2] =  outAdder;
    assign pcIn = jumpMux[jump];

    //output assignment
    assign address = PC << 2;

    always @(posedge clk)
        PC <= pcIn;

endmodule