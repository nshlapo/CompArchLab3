module memory(
  input clk,
  input regWE,
  input[9:0] Addr,
  input[31:0] DataIn,
  output[31:0] DataOut
);

  reg [31:0] mem[1023:0];
  always @(posedge clk)
    if (regWE)
      mem[Addr] <= DataIn;
  initial $readmemh("data/average.dat", mem);

  assign DataOut = mem[Addr];
endmodule
