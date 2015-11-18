module CPU(
	input clk
);

wire [31:0] wire0, wire1, wire2, wire3, wire4, wire6, wire7, wire8, wire9, wire10;

wire branch, reg_write, mem_write, alu_src, jal, zero;
wire [1:0] jump, reg_dst, mem_to_reg;
wire [2:0] alu_ctrl;
wire [4:0] Rs, Rt, Rd;
wire [15:0] immediate;
wire [25:0] target;

reg [4:0] wire11;
reg [31:0] wire5;


regfile regfile(
	.ReadData1(wire0),
	.ReadData2(wire9),
	.WriteData(wire5),
	.ReadRegister1(Rs),
	.ReadRegister2(Rt),
	.WriteRegister(wire11),
	.RegWrite(reg_write),
	.Clk(clk)
);


ALU alu(
	.result(wire3),
	.carryflag(),
	.overflag(),
	.zero(zero),
	.a(wire0),
	.b(wire8),
	.selector(alu_ctrl)
);

sign_extend signExt(
	.immediate(immediate),
	.extended(wire10)
);

memory memory(
	.clk(clk),
	.regWE(mem_write),
	.DataAddr(wire3[9:0]),
	.DataIn(wire7),
	.InstrAddr(wire2[9:0]),
	.DataOut(wire4),
	.InstrOut(wire6)
);

instr_fetch instr_fetch(
	.clk(clk),
	.branch(branch),
	.zero(zero),
	.jal(jal),
	.jump(jump),
	.imm16(immediate),
	.target(target),
	.Da(wire0),
	.outAdder(wire1[29:0]),
	.address(wire2)
);


instr_decoder instr_decoder(
	.instruction(wire6),
	.clk(clk),
	.branch(branch),
	.reg_write(reg_write),
	.mem_write(mem_write),
	.alu_src(alu_src),
	.jal(jal),
	.jump(jump),
	.reg_dst(reg_dst),
	.mem_to_reg(mem_to_reg),
	.alu_ctrl(alu_ctrl),
	.Rs(Rs),
	.Rt(Rt),
	.Rd(Rd),
	.immediate(immediate),
	.target(target)
);

assign wire8 = alu_src ? wire10 : wire9;

always@(reg_dst) begin
	case (reg_dst)
		2'b00:
			wire11 <= Rt;
		2'b01:
			wire11 <= Rd;
		2'b10:
			wire11 <= 5'd31;
	endcase
end

always@(mem_to_reg) begin
	case (mem_to_reg)
		2'b00:
			wire5 <= wire3;
		2'b01:
			wire5 <= wire4;
		2'b10:
			wire5 <= wire1;
	endcase
end

endmodule
