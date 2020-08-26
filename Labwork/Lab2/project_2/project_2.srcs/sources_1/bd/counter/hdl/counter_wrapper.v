//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Thu Feb  6 10:41:59 2020
//Host        : zach-333-em4-10.engr.tamu.edu running 64-bit CentOS Linux release 7.7.1908 (Core)
//Command     : generate_target counter_wrapper.bd
//Design      : counter_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module counter_wrapper
   (btn_sw_tri_i,
    clock_rtl,
    led_tri_o);
  input [7:0]btn_sw_tri_i;
  input clock_rtl;
  output [3:0]led_tri_o;

  wire [7:0]btn_sw_tri_i;
  wire clock_rtl;
  wire [3:0]led_tri_o;

  counter counter_i
       (.btn_sw_tri_i(btn_sw_tri_i),
        .clock_rtl(clock_rtl),
        .led_tri_o(led_tri_o));
endmodule
