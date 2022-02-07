circuit IFetch :
  module IFetch :
    input clock : Clock
    input reset : UInt<1>
    output io : { addr : UInt<64>, flip data : UInt<32>, pc : UInt<64>, inst : UInt<32>, flip flush_en : UInt<1>}

    reg pc_curr : UInt<64>, clock with :
      reset => (UInt<1>("h0"), pc_curr) @[ifetch.scala 14:20]
    reg pc_next : UInt<64>, clock with :
      reset => (UInt<1>("h0"), pc_next) @[ifetch.scala 15:20]
    reg ir : UInt<32>, clock with :
      reset => (UInt<1>("h0"), ir) @[ifetch.scala 16:15]
    ir <= io.data @[ifetch.scala 20:6]
    pc_curr <= pc_next @[ifetch.scala 21:11]
    node _pc_next_T = add(pc_next, UInt<3>("h4")) @[ifetch.scala 22:22]
    node _pc_next_T_1 = tail(_pc_next_T, 1) @[ifetch.scala 22:22]
    pc_next <= _pc_next_T_1 @[ifetch.scala 22:11]
    io.addr <= pc_next @[ifetch.scala 24:11]
    io.inst <= ir @[ifetch.scala 25:11]
    io.pc <= pc_curr @[ifetch.scala 26:9]

