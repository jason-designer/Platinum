module IFetch(
  input         clock,
  input         reset,
  output [63:0] io_addr,
  input  [31:0] io_data,
  output [63:0] io_pc,
  output [31:0] io_inst,
  input         io_flush_en
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] pc_curr; // @[ifetch.scala 14:20]
  reg [63:0] pc_next; // @[ifetch.scala 15:20]
  reg [31:0] ir; // @[ifetch.scala 16:15]
  assign io_addr = pc_next; // @[ifetch.scala 24:11]
  assign io_pc = pc_curr; // @[ifetch.scala 26:9]
  assign io_inst = ir; // @[ifetch.scala 25:11]
  always @(posedge clock) begin
    pc_curr <= pc_next; // @[ifetch.scala 21:11]
    pc_next <= pc_next + 64'h4; // @[ifetch.scala 22:22]
    ir <= io_data; // @[ifetch.scala 20:6]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pc_curr = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  pc_next = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  ir = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
