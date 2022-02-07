package cpu

import chisel3._
import chiseltest._
import org.scalatest._

import chisel3.util._
import chiseltest.RawTester.test

object IFetchGen extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new IFetch,args)   //新版推荐语法
}

class IFetch_Memory extends Module{
    val io = IO(new Bundle{
        val inst = Output(UInt(32.W))
        val pc = Output(UInt(64.W))
    })
    val mIF = Module(new IFetch())
    val mMem = Module(new Memory())
    mMem.io.rdAddr  := mIF.io.addr
    mIF.io.data := mMem.io.rdData
    mIF.io.flush_en := false.B
    io.inst :=  mIF.io.inst
    io.pc   :=  mIF.io.pc
}

class IFetchTest extends FlatSpec with ChiselScalatestTester{
    behavior of "IFetch"
    it should "do io test" in {
        test(new IFetch_Memory) { m =>
            for(i <- 0 until 3) {    
                println(m.io.pc.peek())
                println(m.io.inst.peek())   
                m.clock.step(1)
            }
        }
    }
}








