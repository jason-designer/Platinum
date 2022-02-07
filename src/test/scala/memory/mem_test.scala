package cpu

import chisel3._
import chiseltest._
import org.scalatest._

import chisel3.util._
import chiseltest.RawTester.test

object MemoryGen extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Memory,args)   
}

// class MemoryTest extends FlatSpec with ChiselScalatestTester{
//     behavior of "Memory"
//     it should "do io test" in {
//         test(new Memory) { m =>
//             for(i <- 0 until 7) {     
//                 val addr = i 
//                 m.io.ren.poke(true.B)
//                 m.io.rlength.poke(1.U)
//                 m.io.rdAddr.poke(addr.U)
//                 m.clock.step(1)
//                 println(m.io.rdData.peek())

//                 //println(s"Print during testing: Input is ${m.io.rdData.peek()}")       //无法十六进制
//                 // val myUInt = 33.U        //报错
//                 // printf("%d\n",myUInt)
//                 // val myUInt = 33.U        //无法十六进制
//                 // println("%x",myUInt)

//             }
//         }
//     }
// }


class MemoryTest2 extends FlatSpec with ChiselScalatestTester{
    behavior of "Memory"
    it should "do io test" in {
        test(new Memory) { m =>
            for(i <- 0 until 7) {     
                val addr = i 
                m.io.rdAddr.poke(addr.U)
                m.clock.step(1)
                println(m.io.rdData.peek())
            }
        }
    }
}

