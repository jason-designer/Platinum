module Memory(
  input         clock,
  input         reset,
  input         io_ren,
  input  [3:0]  io_rlength,
  input  [3:0]  io_rdAddr,
  output [31:0] io_rdData
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] Ram [0:7]; // @[mem.scala 14:18]
  wire  Ram_io_rdData_MPORT_en; // @[mem.scala 14:18]
  wire [2:0] Ram_io_rdData_MPORT_addr; // @[mem.scala 14:18]
  wire [7:0] Ram_io_rdData_MPORT_data; // @[mem.scala 14:18]
  wire  Ram_io_rdData_MPORT_1_en; // @[mem.scala 14:18]
  wire [2:0] Ram_io_rdData_MPORT_1_addr; // @[mem.scala 14:18]
  wire [7:0] Ram_io_rdData_MPORT_1_data; // @[mem.scala 14:18]
  wire  Ram_io_rdData_MPORT_2_en; // @[mem.scala 14:18]
  wire [2:0] Ram_io_rdData_MPORT_2_addr; // @[mem.scala 14:18]
  wire [7:0] Ram_io_rdData_MPORT_2_data; // @[mem.scala 14:18]
  wire  Ram_io_rdData_MPORT_3_en; // @[mem.scala 14:18]
  wire [2:0] Ram_io_rdData_MPORT_3_addr; // @[mem.scala 14:18]
  wire [7:0] Ram_io_rdData_MPORT_3_data; // @[mem.scala 14:18]
  wire  Ram_io_rdData_MPORT_4_en; // @[mem.scala 14:18]
  wire [2:0] Ram_io_rdData_MPORT_4_addr; // @[mem.scala 14:18]
  wire [7:0] Ram_io_rdData_MPORT_4_data; // @[mem.scala 14:18]
  wire  _T = 4'h1 == io_rlength; // @[mem.scala 18:27]
  wire [31:0] _io_rdData_T_2 = {Ram_io_rdData_MPORT_1_data, 24'h0}; // @[mem.scala 23:45]
  wire [3:0] _io_rdData_T_4 = io_rdAddr + 4'h1; // @[mem.scala 23:65]
  wire [23:0] _io_rdData_T_6 = {Ram_io_rdData_MPORT_2_data, 16'h0}; // @[mem.scala 23:70]
  wire [31:0] _GEN_27 = {{8'd0}, _io_rdData_T_6}; // @[mem.scala 23:50]
  wire [31:0] _io_rdData_T_8 = _io_rdData_T_2 + _GEN_27; // @[mem.scala 23:50]
  wire [3:0] _io_rdData_T_10 = io_rdAddr + 4'h2; // @[mem.scala 23:90]
  wire [15:0] _io_rdData_T_12 = {Ram_io_rdData_MPORT_3_data, 8'h0}; // @[mem.scala 23:95]
  wire [31:0] _GEN_28 = {{16'd0}, _io_rdData_T_12}; // @[mem.scala 23:75]
  wire [31:0] _io_rdData_T_14 = _io_rdData_T_8 + _GEN_28; // @[mem.scala 23:75]
  wire [3:0] _io_rdData_T_16 = io_rdAddr + 4'h3; // @[mem.scala 23:114]
  wire [31:0] _GEN_29 = {{24'd0}, Ram_io_rdData_MPORT_4_data}; // @[mem.scala 23:99]
  wire [31:0] _io_rdData_T_19 = _io_rdData_T_14 + _GEN_29; // @[mem.scala 23:99]
  wire [31:0] _GEN_6 = 4'h4 == io_rlength ? _io_rdData_T_19 : 32'h0; // @[mem.scala 16:15 18:27 23:27]
  wire [31:0] _GEN_10 = 4'h1 == io_rlength ? {{24'd0}, Ram_io_rdData_MPORT_data} : _GEN_6; // @[mem.scala 18:27 20:27]
  wire  _GEN_13 = 4'h1 == io_rlength ? 1'h0 : 4'h4 == io_rlength; // @[mem.scala 14:18 18:27]
  assign Ram_io_rdData_MPORT_en = io_ren & _T;
  assign Ram_io_rdData_MPORT_addr = io_rdAddr[2:0];
  assign Ram_io_rdData_MPORT_data = Ram[Ram_io_rdData_MPORT_addr]; // @[mem.scala 14:18]
  assign Ram_io_rdData_MPORT_1_en = io_ren & _GEN_13;
  assign Ram_io_rdData_MPORT_1_addr = io_rdAddr[2:0];
  assign Ram_io_rdData_MPORT_1_data = Ram[Ram_io_rdData_MPORT_1_addr]; // @[mem.scala 14:18]
  assign Ram_io_rdData_MPORT_2_en = io_ren & _GEN_13;
  assign Ram_io_rdData_MPORT_2_addr = _io_rdData_T_4[2:0];
  assign Ram_io_rdData_MPORT_2_data = Ram[Ram_io_rdData_MPORT_2_addr]; // @[mem.scala 14:18]
  assign Ram_io_rdData_MPORT_3_en = io_ren & _GEN_13;
  assign Ram_io_rdData_MPORT_3_addr = _io_rdData_T_10[2:0];
  assign Ram_io_rdData_MPORT_3_data = Ram[Ram_io_rdData_MPORT_3_addr]; // @[mem.scala 14:18]
  assign Ram_io_rdData_MPORT_4_en = io_ren & _GEN_13;
  assign Ram_io_rdData_MPORT_4_addr = _io_rdData_T_16[2:0];
  assign Ram_io_rdData_MPORT_4_data = Ram[Ram_io_rdData_MPORT_4_addr]; // @[mem.scala 14:18]
  assign io_rdData = io_ren ? _GEN_10 : 32'h0; // @[mem.scala 16:15 17:17]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    Ram[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
