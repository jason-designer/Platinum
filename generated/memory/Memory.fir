circuit Memory :
  module Memory :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip ren : UInt<1>, flip rlength : UInt<4>, flip rdAddr : UInt<4>, rdData : UInt<32>}

    cmem Ram : UInt<8> [8] @[mem.scala 14:18]
    io.rdData <= UInt<1>("h0") @[mem.scala 16:15]
    when io.ren : @[mem.scala 17:17]
      node _T = eq(UInt<1>("h1"), io.rlength) @[mem.scala 18:27]
      when _T : @[mem.scala 18:27]
        node _io_rdData_T = bits(io.rdAddr, 2, 0) @[mem.scala 20:33]
        infer mport io_rdData_MPORT = Ram[_io_rdData_T], clock @[mem.scala 20:33]
        io.rdData <= io_rdData_MPORT @[mem.scala 20:27]
      else :
        node _T_1 = eq(UInt<3>("h4"), io.rlength) @[mem.scala 18:27]
        when _T_1 : @[mem.scala 18:27]
          node _io_rdData_T_1 = bits(io.rdAddr, 2, 0) @[mem.scala 23:34]
          infer mport io_rdData_MPORT_1 = Ram[_io_rdData_T_1], clock @[mem.scala 23:34]
          node _io_rdData_T_2 = shl(io_rdData_MPORT_1, 24) @[mem.scala 23:45]
          node _io_rdData_T_3 = add(io.rdAddr, UInt<1>("h1")) @[mem.scala 23:65]
          node _io_rdData_T_4 = tail(_io_rdData_T_3, 1) @[mem.scala 23:65]
          node _io_rdData_T_5 = bits(_io_rdData_T_4, 2, 0) @[mem.scala 23:55]
          infer mport io_rdData_MPORT_2 = Ram[_io_rdData_T_5], clock @[mem.scala 23:55]
          node _io_rdData_T_6 = shl(io_rdData_MPORT_2, 16) @[mem.scala 23:70]
          node _io_rdData_T_7 = add(_io_rdData_T_2, _io_rdData_T_6) @[mem.scala 23:50]
          node _io_rdData_T_8 = tail(_io_rdData_T_7, 1) @[mem.scala 23:50]
          node _io_rdData_T_9 = add(io.rdAddr, UInt<2>("h2")) @[mem.scala 23:90]
          node _io_rdData_T_10 = tail(_io_rdData_T_9, 1) @[mem.scala 23:90]
          node _io_rdData_T_11 = bits(_io_rdData_T_10, 2, 0) @[mem.scala 23:80]
          infer mport io_rdData_MPORT_3 = Ram[_io_rdData_T_11], clock @[mem.scala 23:80]
          node _io_rdData_T_12 = shl(io_rdData_MPORT_3, 8) @[mem.scala 23:95]
          node _io_rdData_T_13 = add(_io_rdData_T_8, _io_rdData_T_12) @[mem.scala 23:75]
          node _io_rdData_T_14 = tail(_io_rdData_T_13, 1) @[mem.scala 23:75]
          node _io_rdData_T_15 = add(io.rdAddr, UInt<2>("h3")) @[mem.scala 23:114]
          node _io_rdData_T_16 = tail(_io_rdData_T_15, 1) @[mem.scala 23:114]
          node _io_rdData_T_17 = bits(_io_rdData_T_16, 2, 0) @[mem.scala 23:104]
          infer mport io_rdData_MPORT_4 = Ram[_io_rdData_T_17], clock @[mem.scala 23:104]
          node _io_rdData_T_18 = add(_io_rdData_T_14, io_rdData_MPORT_4) @[mem.scala 23:99]
          node _io_rdData_T_19 = tail(_io_rdData_T_18, 1) @[mem.scala 23:99]
          io.rdData <= _io_rdData_T_19 @[mem.scala 23:27]

