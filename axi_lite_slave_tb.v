`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 14:57:07
// Design Name: 
// Module Name: axi_lite_slave_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module axi_lite_slave_tb;
reg clk,rst;
reg [31:0] awaddr;
reg awvalid;
wire awready;
reg [31:0] wdata;
reg wvalid;
wire wready;
reg bready;
wire [1:0]bresp;
wire bvalid;
reg [31:0] araddr;
reg arvalid;
wire   arready;
wire [31:0] rdata;
wire [1:0]rresp;
wire rvalid;
reg rready;
axi_lite_slave uut(.clk(clk),.rst(rst),.awaddr(awaddr),.awvalid(awvalid),.awready(awready),.
wdata(wdata),.wvalid(wvalid),.wready(wready),.bready(bready),.bresp(bresp),.bvalid(bvalid)
,.araddr(araddr),.arvalid(arvalid),.arready(arready),.rdata(rdata),.rresp(rresp),.rvalid(rvalid),.rready(rready));
initial begin
  repeat(100) 
    begin
       clk=1'b0;#5;
       clk=1'b1;#5;
    end
end
initial begin
  rst = 1;
  awvalid = 0;
  wvalid  = 0;
  bready  = 0;
  awaddr  = 0;
  wdata   = 0;
  rready = 0;
arvalid = 0;
araddr = 0;#20;
  rst = 0;
awaddr  = 32'h04;
awvalid = 1;#10;
awvalid = 0;
wdata   = 32'h12345678;
wvalid  = 1;#10;
wvalid  = 0;
bready  = 1;#10;
bready  = 0;#10;
araddr=32'h04;
arvalid=1;#10;
arvalid=0;
rready=1;#10;
rready  = 0;#10;
awaddr=32'h10;
awvalid = 1;#10;
awvalid = 0;
wdata   = 32'h12345678;
wvalid  = 1;#10;
wvalid  = 0;
bready  = 1;#10;
bready  = 0;#10;
araddr  = 32'h10;
arvalid = 1;#10;
arvalid = 0;
rready = 1;#10;
rready = 0;
  $finish;
end
initial begin
$monitor("time=%0t AW=%h WDATA=%h BVALID=%b BRESP=%b AR=%h RDATA=%h RVALID=%b RRESP=%b",
          $time, awaddr, wdata, bvalid, bresp,
          araddr, rdata, rvalid, rresp);
       end
 initial begin
   #80;
   $display("REG1=%h", uut.reg1);
   $display("RDATA=%h", rdata);
end
endmodule
