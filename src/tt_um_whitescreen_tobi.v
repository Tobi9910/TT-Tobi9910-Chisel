module vga_controller(
  input   clock,
  input   reset,
  output  io_hsync, // @[\\src\\main\\scala\\Controller.scala 17:14]
  output  io_vsync // @[\\src\\main\\scala\\Controller.scala 17:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] p_tick; // @[\\src\\main\\scala\\Controller.scala 39:23]
  wire [1:0] _p_tick_T_1 = p_tick + 2'h1; // @[\\src\\main\\scala\\Controller.scala 40:20]
  reg [9:0] x_count_reg; // @[\\src\\main\\scala\\Controller.scala 48:42]
  reg [9:0] x_count_next; // @[\\src\\main\\scala\\Controller.scala 48:42]
  reg [9:0] y_count_reg; // @[\\src\\main\\scala\\Controller.scala 49:42]
  reg [9:0] y_count_next; // @[\\src\\main\\scala\\Controller.scala 49:42]
  reg  v_sync_reg; // @[\\src\\main\\scala\\Controller.scala 52:39]
  reg  h_sync_reg; // @[\\src\\main\\scala\\Controller.scala 52:39]
  reg  v_sync_next; // @[\\src\\main\\scala\\Controller.scala 53:41]
  reg  h_sync_next; // @[\\src\\main\\scala\\Controller.scala 53:41]
  wire  _T_1 = p_tick == 2'h0; // @[\\src\\main\\scala\\Controller.scala 59:16]
  wire  _T_2 = x_count_reg == 10'h31f; // @[\\src\\main\\scala\\Controller.scala 62:23]
  wire [9:0] _x_count_next_T_1 = x_count_reg + 10'h1; // @[\\src\\main\\scala\\Controller.scala 65:35]
  wire [9:0] _y_count_next_T_1 = y_count_reg + 10'h1; // @[\\src\\main\\scala\\Controller.scala 75:37]
  assign io_hsync = h_sync_reg; // @[\\src\\main\\scala\\Controller.scala 98:12]
  assign io_vsync = v_sync_reg; // @[\\src\\main\\scala\\Controller.scala 99:12]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\Controller.scala 39:23]
      p_tick <= 2'h0; // @[\\src\\main\\scala\\Controller.scala 39:23]
    end else if (p_tick == 2'h3) begin // @[\\src\\main\\scala\\Controller.scala 41:23]
      p_tick <= 2'h0; // @[\\src\\main\\scala\\Controller.scala 42:12]
    end else begin
      p_tick <= _p_tick_T_1; // @[\\src\\main\\scala\\Controller.scala 40:10]
    end
    if (reset) begin // @[\\src\\main\\scala\\Controller.scala 48:42]
      x_count_reg <= 10'h0; // @[\\src\\main\\scala\\Controller.scala 48:42]
    end else begin
      x_count_reg <= x_count_next; // @[\\src\\main\\scala\\Controller.scala 81:15]
    end
    if (reset) begin // @[\\src\\main\\scala\\Controller.scala 48:42]
      x_count_next <= 10'h0; // @[\\src\\main\\scala\\Controller.scala 48:42]
    end else if (p_tick == 2'h0) begin // @[\\src\\main\\scala\\Controller.scala 59:25]
      if (x_count_reg == 10'h31f) begin // @[\\src\\main\\scala\\Controller.scala 62:33]
        x_count_next <= 10'h0; // @[\\src\\main\\scala\\Controller.scala 63:20]
      end else begin
        x_count_next <= _x_count_next_T_1; // @[\\src\\main\\scala\\Controller.scala 65:20]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\Controller.scala 49:42]
      y_count_reg <= 10'h0; // @[\\src\\main\\scala\\Controller.scala 49:42]
    end else begin
      y_count_reg <= y_count_next; // @[\\src\\main\\scala\\Controller.scala 82:15]
    end
    if (reset) begin // @[\\src\\main\\scala\\Controller.scala 49:42]
      y_count_next <= 10'h0; // @[\\src\\main\\scala\\Controller.scala 49:42]
    end else if (_T_1) begin // @[\\src\\main\\scala\\Controller.scala 70:25]
      if (_T_2) begin // @[\\src\\main\\scala\\Controller.scala 71:34]
        if (y_count_reg == 10'h20c) begin // @[\\src\\main\\scala\\Controller.scala 72:36]
          y_count_next <= 10'h0; // @[\\src\\main\\scala\\Controller.scala 73:22]
        end else begin
          y_count_next <= _y_count_next_T_1; // @[\\src\\main\\scala\\Controller.scala 75:22]
        end
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\Controller.scala 52:39]
      v_sync_reg <= 1'h0; // @[\\src\\main\\scala\\Controller.scala 52:39]
    end else begin
      v_sync_reg <= v_sync_next; // @[\\src\\main\\scala\\Controller.scala 94:14]
    end
    if (reset) begin // @[\\src\\main\\scala\\Controller.scala 52:39]
      h_sync_reg <= 1'h0; // @[\\src\\main\\scala\\Controller.scala 52:39]
    end else begin
      h_sync_reg <= h_sync_next; // @[\\src\\main\\scala\\Controller.scala 95:14]
    end
    if (reset) begin // @[\\src\\main\\scala\\Controller.scala 53:41]
      v_sync_next <= 1'h0; // @[\\src\\main\\scala\\Controller.scala 53:41]
    end else begin
      v_sync_next <= y_count_reg > 10'h201 & y_count_reg < 10'h203; // @[\\src\\main\\scala\\Controller.scala 88:15]
    end
    if (reset) begin // @[\\src\\main\\scala\\Controller.scala 53:41]
      h_sync_next <= 1'h0; // @[\\src\\main\\scala\\Controller.scala 53:41]
    end else begin
      h_sync_next <= x_count_reg > 10'h290 & x_count_reg < 10'h2f0; // @[\\src\\main\\scala\\Controller.scala 86:15]
    end
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
  _RAND_0 = {1{`RANDOM}};
  p_tick = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  x_count_reg = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  x_count_next = _RAND_2[9:0];
  _RAND_3 = {1{`RANDOM}};
  y_count_reg = _RAND_3[9:0];
  _RAND_4 = {1{`RANDOM}};
  y_count_next = _RAND_4[9:0];
  _RAND_5 = {1{`RANDOM}};
  v_sync_reg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  h_sync_reg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  v_sync_next = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  h_sync_next = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module tt_um_whitescreen_tobi(
  input        clock,
  input        reset,
  input  [7:0] io_ui_in, // @[\\src\\main\\scala\\whitescreen.scala 7:14]
  output [7:0] io_uo_out, // @[\\src\\main\\scala\\whitescreen.scala 7:14]
  input  [7:0] io_uio_in, // @[\\src\\main\\scala\\whitescreen.scala 7:14]
  output [7:0] io_uio_out, // @[\\src\\main\\scala\\whitescreen.scala 7:14]
  output [7:0] io_uio_oe // @[\\src\\main\\scala\\whitescreen.scala 7:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  controller_clock; // @[\\src\\main\\scala\\whitescreen.scala 15:26]
  wire  controller_reset; // @[\\src\\main\\scala\\whitescreen.scala 15:26]
  wire  controller_io_hsync; // @[\\src\\main\\scala\\whitescreen.scala 15:26]
  wire  controller_io_vsync; // @[\\src\\main\\scala\\whitescreen.scala 15:26]
  reg [2:0] three; // @[\\src\\main\\scala\\whitescreen.scala 18:22]
  wire [3:0] VGA_lo = {three,controller_io_hsync}; // @[\\src\\main\\scala\\whitescreen.scala 25:16]
  wire [3:0] VGA_hi = {three,controller_io_vsync}; // @[\\src\\main\\scala\\whitescreen.scala 25:16]
  vga_controller controller ( // @[\\src\\main\\scala\\whitescreen.scala 15:26]
    .clock(controller_clock),
    .reset(controller_reset),
    .io_hsync(controller_io_hsync),
    .io_vsync(controller_io_vsync)
  );
  assign io_uo_out = {VGA_hi,VGA_lo}; // @[\\src\\main\\scala\\whitescreen.scala 25:16]
  assign io_uio_out = 8'h0; // @[\\src\\main\\scala\\whitescreen.scala 33:14]
  assign io_uio_oe = 8'h0; // @[\\src\\main\\scala\\whitescreen.scala 34:13]
  assign controller_clock = clock;
  assign controller_reset = reset;
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\whitescreen.scala 18:22]
      three <= 3'h0; // @[\\src\\main\\scala\\whitescreen.scala 18:22]
    end else begin
      three <= 3'h7; // @[\\src\\main\\scala\\whitescreen.scala 19:9]
    end
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
  _RAND_0 = {1{`RANDOM}};
  three = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
