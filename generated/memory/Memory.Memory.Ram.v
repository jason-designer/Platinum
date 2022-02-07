module BindsTo_0_Memory(
  input         clock,
  input         reset,
  input         io_ren,
  input  [3:0]  io_rlength,
  input  [3:0]  io_rdAddr,
  output [31:0] io_rdData
);

initial begin
  $readmemh("./src/main/scala/memory/mem_data.txt", Memory.Ram);
end
                      endmodule

bind Memory BindsTo_0_Memory BindsTo_0_Memory_Inst(.*);