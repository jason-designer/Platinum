package cpu

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

// class Memory extends Module{
//     val io = IO(new Bundle{
//         val ren     = Input(Bool())
//         val rlength = Input(UInt(4.W))
//         val rdAddr  = Input(UInt(4.W))
//         val rdData  = Output(UInt(32.W))
//     })
//     val Ram = Mem(8,UInt(8.W))
//     loadMemoryFromFile(Ram, "./src/main/scala/memory/mem_data.txt")
//     io.rdData := 0.U
//     when(io.ren){ 
//         switch(io.rlength){
//             is(1.U){
//                 io.rdData := Ram(io.rdAddr)
//             }
//             is(4.U){
//                 io.rdData := (Ram(io.rdAddr)<<24)+(Ram(io.rdAddr+1.U)<<16)+(Ram(io.rdAddr+2.U)<<8)+(Ram(io.rdAddr+3.U))
//             }
//         }
//     }
// }



class Memory extends Module{
    val io = IO(new Bundle{
        val rdAddr  = Input(UInt(4.W))
        val rdData  = Output(UInt(32.W))
    })
    val Ram = Mem(16,UInt(8.W))
    loadMemoryFromFile(Ram, "./src/main/scala/memory/mem_data.txt")
    io.rdData := 0.U
    io.rdData := (Ram(io.rdAddr)<<24)+(Ram(io.rdAddr+1.U)<<16)+(Ram(io.rdAddr+2.U)<<8)+(Ram(io.rdAddr+3.U))
}



