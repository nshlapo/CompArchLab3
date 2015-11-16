module memory(
  input clk,
  input regWE,
  input[9:0] DataAddr,
  input[9:0] InstrAddr,
  input[31:0] DataIn,
  output[31:0] DataOut,
  output[31:0] InstrOut
);

  reg [31:0] mem[1023:0];
  always @(posedge clk)
    if (regWE)
      mem[DataAddr] <= DataIn;
  initial $readmemh("data/average.dat", mem);

  assign DataOut = mem[DataAddr];
  assign InstrOut = mem[InstrAddr]
endmodule
