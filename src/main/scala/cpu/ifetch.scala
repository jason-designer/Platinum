package cpu

import chisel3._

class IFetch extends Module {
  val io = IO(new Bundle {
    val addr = Output(UInt(64.W))
    val data = Input(UInt(32.W))
    val pc = Output(UInt(64.W))
    val inst = Output(UInt(32.W))
    val flush_en = Input(UInt(1.W))  //when pipeline needed to be flushed
  })
  
  val pc_curr = Reg(UInt(64.W))     //PC
  val pc_next = Reg(UInt(64.W))
  val ir = Reg(UInt(32.W))          //IR

  //implent reset

  ir := io.data
  pc_curr := pc_next
  pc_next := pc_next + 4.U  //implent predict

  io.addr := pc_next
  io.inst := ir
  io.pc := pc_curr

}







