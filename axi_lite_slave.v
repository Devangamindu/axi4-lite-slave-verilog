`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 14:23:50
// Design Name: 
// Module Name: axi_lite_slave
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


module axi_lite_slave(
input clk,rst,
input [31:0] awaddr,
input awvalid,
output reg awready,
input [31:0] wdata,
input wvalid,
output reg wready,
input bready,
output reg [1:0]bresp,
output reg bvalid,
input  [31:0]araddr,
input  arvalid,
output reg arready,
output reg [31:0]rdata,
output reg [1:0] rresp,
output reg rvalid,
input  rready
    );
reg [31:0] reg0,reg1,reg2,reg3,addr_reg;
reg [31:0] read_addr;
always @(posedge clk or posedge rst) begin
  if(rst) begin
    awready <= 1;
    wready  <= 1;
    bvalid   <= 0;
    bresp    <= 0;
    addr_reg <= 0;
    reg0 <= 0;
    reg1 <= 0;
    reg2 <= 0;
    reg3 <= 0;
    read_addr<=0;
    rvalid<=0;
    rresp<=0;
    arready<=1;

  end
else  begin
   if(awvalid && awready) 
        addr_reg<=awaddr;
      if(wvalid && wready) begin
         case(addr_reg) 
           32'h00: begin 
           reg0<=wdata;
           bresp<=2'b00;
           end
           32'h04: begin
           reg1<=wdata;
            bresp<=2'b00;
            end
           32'h08: begin
           reg2<=wdata;
            bresp<=2'b00;
            end
           32'h0c: begin
           reg3<=wdata;
            bresp<=2'b00;
            end
           default:bresp <= 2'b10;
         endcase
         bvalid<=1;
      end
    if(bvalid && bready)
      bvalid <= 0;  
      if(arvalid && arready) begin
        read_addr<=araddr;
         case(araddr) 
           32'h00: begin 
           rdata<=reg0;
           rresp<=2'b00;
           end
           32'h04: begin
           rdata<=reg1;
            rresp<=2'b00;
            end
           32'h08: begin
           rdata<=reg2;
            rresp<=2'b00;
            end
           32'h0c: begin
           rdata<=reg3;
            rresp<=2'b00;
            end
           default:rresp <= 2'b10;
         endcase
         rvalid<=1;
      end 
      if(rvalid && rready)
    rvalid <= 0;
  end
end
endmodule
