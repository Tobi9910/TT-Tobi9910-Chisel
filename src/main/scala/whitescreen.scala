import chisel3._
import chisel3.util._



class tt_um_whitescreen_tobi extends Module {
  val io = IO(new Bundle {
    val ui_in = Input(UInt(8.W)) // Dedicated inputs
    val uo_out = Output(UInt(8.W)) // Dedicated outputs
    val uio_in = Input(UInt(8.W)) // IOs: Input path
    val uio_out = Output(UInt(8.W)) // IOs: Output path
    val uio_oe = Output(UInt(8.W)) // IOs: Enable path (active high: 0=input, 1=output)
  })

  val controller = Module(new tt_um_vga_controller())


  val three = RegInit(0.U(3.W))
  three := "b111".U

  //io.uo_out(3) := controller.io.vsync //Pin4 is vsync    CANNOT ASSIGN TO A REG INDEX
 // io.uo_out(7) := controller.io.hsync //pin 10 7) is hsync


  val VGA = Cat(three, controller.io.vsync, three, controller.io.hsync)
  io.uo_out := VGA


  //presumeably dont need to type unused in CHIsel, makes it itself in Verilog
  //val _unused := io.ui_in

 //Drive unused to 0
  io.uio_out := 0.U   // if unused
  io.uio_oe := 0.U    // if unused

}

object tt_um_whitescreen_tobi extends App {
  emitVerilog(new tt_um_whitescreen_tobi(), Array("--target-dir", "src"))
}



