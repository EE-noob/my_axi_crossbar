`include "macro.vh"
module axi_mst_driver #(
    parameter AXI_ADDR_W = 32,
    //主机输入ID宽度
    parameter AXI_ID_W  =4,
    parameter AXI_DATA_W = 32,

    //OSTD REQ NUM
    parameter MST_OSTDREQ_NUM = 4,//2**n!!!!
    //The data size of each OSTD REG
    parameter MST_OSTDREQ_SIZE = 8,

    parameter AWCH_W = 53,
    parameter WCH_W  = 47, 
    parameter BCH_W  = 12,
    parameter ARCH_W = 53,
    parameter RCH_W  = 45,
    
    parameter [AXI_ID_W - 1 : 0] MST_ID_MASK = 'b0100
    )(
    input  logic  aclk,
    input  logic  aresetn,
    input  logic  srst,
    //interface from mst
    //aw channel
    output  logic  out_awvalid,
    input logic in_awready,
    output  logic  [AXI_ADDR_W - 1 : 0] out_awaddr,
    output  logic  [4          - 1 : 0] out_awlen,
    output  logic  [3          - 1 : 0] out_awsize,
    output  logic  [2          - 1 : 0] out_awburst,
    output  logic  [AXI_ID_W   - 1 : 0] out_awid,//高两位为主机掩码：1,2,3；低两位为读写id，0,1,2,3，支持outstanding的能力为4
    output  logic  [2          - 1 : 0] out_awlock,
    //w channel
    output  logic  out_wvalid,
    input logic out_wready,
    output  logic  out_wlast,
    output  logic  [AXI_ID_W   - 1 : 0] out_wid,
    output  logic  [AXI_DATA_W - 1 : 0] out_wdata,
    output  logic  [4          - 1 : 0] out_wstrb,
    //B channel
    input logic out_bvalid,
    output  logic  out_bready,
    input logic [AXI_ID_W   - 1 : 0] out_bid,
    input logic [2          - 1 : 0] out_bresp,
    //AR channel
    output  logic  out_arvalid,
    input logic out_arready,
    output  logic  [AXI_ADDR_W - 1 : 0] out_araddr,
    output  logic  [4          - 1 : 0] out_arlen,
    output  logic  [3          - 1 : 0] out_arsize,
    output  logic  [2          - 1 : 0] out_arburst,
    output  logic  [AXI_ID_W   - 1 : 0] out_arid,
    output  logic  [2          - 1 : 0] out_arlock,
    //R channel
    input logic out_rvalid,
    output  logic  out_rready,
    input logic [AXI_ID_W   - 1 : 0] out_rid,
    input logic [2          - 1 : 0] out_rresp,
    input logic [AXI_DATA_W - 1 : 0] out_rdata,
    input logic out_rlast
    // ,
    // //interface to axi switch
    // output  logic  in_aclk,
    // output  logic  in_aresetn,
    // output  logic  in_srst,
    // //AW Channel
    // input logic in_awvalid,
    // output  logic  in_awready,
    // input logic [AWCH_W     - 1 : 0] in_awch,
    // //W Channel
    // input logic in_wvalid,
    // output  logic  in_wready,
    // input logic in_wlast,
    // input logic [WCH_W      - 1 : 0] in_wch,
    // //B Channel
    // output  logic  in_bvalid,
    // input logic in_bready,
    // output  logic  [BCH_W      - 1 : 0] in_bch,
    // //AR Channel
    // input logic in_arvalid,
    // output  logic  in_arready,
    // input logic [ARCH_W     - 1 : 0] in_arch,
    // //R Channel
    // output  logic  in_rvalid,
    // input logic in_rready,
    // output  logic  in_rlast,
    // output  logic  [RCH_W      - 1 : 0] in_rch
    );
//vari def>>>
//counter 
    logic [2**4-1:0]                    wdata_cnt;//fixme!!!!!!
    logic [$clog2(MST_OSTDREQ_NUM)+1-1:0]req_remain_cnt;
    logic [$clog2(MST_OSTDREQ_NUM)-1:0] awlen_ptr;
    logic [$clog2(MST_OSTDREQ_NUM)-1:0] awid_ptr;
//reg
    logic [4          - 1 : 0] awlen_now;
    logic [4          - 1 : 0] awid_now;
    logic   out_wlast_prev;
    logic   out_wvalid_prev;
// //queue 
//     queue [4-1:0]awlen_que[$];

//distributed ram
    logic  [MST_OSTDREQ_NUM-1:0]awlen_ram[4-1:0];
    logic  [MST_OSTDREQ_NUM-1:0]awid_ram[4-1:0];
    //<<<


//comb>>>
    assign awlen_now=awlen_ram[awlen_ptr];
    assign awid_now=awid_ram[awid_ptr];
    //<<<
//sequential>>>

//counter>>>
always_ff @( posedge aclk or negedge aresetn) begin : __req_remain_cnt
    if(!aresetn)
        req_remain_cnt<=0;
    else if(out_awvalid && in_awready && out_wlast)
        req_remain_cnt<=req_remain_cnt;
    else if(out_awvalid && in_awready)
        req_remain_cnt<=req_remain_cnt+1;
    else if(out_wlast)
        req_remain_cnt<=req_remain_cnt-1; 
    
end

always_ff @( posedge aclk or negedge aresetn) begin : __wdata_cnt
    if(!aresetn)
        wdata_cnt<=0;
    else if(out_wlast)
        wdata_cnt<=0;
    else if(out_wvalid)
        wdata_cnt<=wdata_cnt+1;
    
end
//<<<
//reg
always_ff @( posedge aclk or negedge aresetn) begin : __wvalid_prev
    if(!aresetn)
        out_wvalid_prev<=0;
    else 
        out_wvalid_prev<=out_wvalid;
    end

always_ff @( posedge aclk or negedge aresetn) begin : __wlast_prev
    if(!aresetn)
        out_wlast_prev<=0;
    else 
        out_wlast_prev<=out_wlast;
    end
    //<<<
  
//ram
always_ff @( posedge aclk or negedge aresetn) begin : __awlen_ptr
    if(!aresetn)
        awlen_ptr <= 'b0;
    else if(out_wlast)
        awlen_ptr <= awlen_ptr+1;
    end

always_ff @( posedge aclk or negedge aresetn) begin : __awlen_ram
    if(!aresetn)
    for (integer i = 0; i < MST_OSTDREQ_NUM; i = i + 1) begin
        awlen_ram[i] <= 'b0;
      end
    else if(out_awvalid && in_awready)
        awlen_ram[awlen_ptr]<= out_awlen;
    end
    
always_ff @( posedge aclk or negedge aresetn) begin : __awid_ptr
    if(!aresetn)
        awid_ptr <= 'b0;
    else if(out_wlast)
        awid_ptr <= awlen_ptr+1;
    end

always_ff @( posedge aclk or negedge aresetn) begin : __awid_ram
    if(!aresetn)
    for (integer i = 0; i < MST_OSTDREQ_NUM; i = i + 1) begin
        awid_ram[i] <= 'b0;
        end
    else if(out_awvalid && in_awready)
        awid_ram[awlen_ptr]<= out_awid;
    end

//output:>>>
assign out_wvalid= (req_remain_cnt!=0);
assign out_wlast= (wdata_cnt==awlen_now);
assign out_wid=awid_now;//!!!!fixme !!!!未考虑交织！！！！
always_ff @( negedge aclk or negedge aresetn) begin : __wdata//!!!fix me!!!can't syn 考虑prbs
    if(!aresetn)
        out_wdata='b0;
    else if(out_wvalid)
        out_wdata=$random;    
end
//fix me!!! 未考虑窄带传输
// always_ff @( negedge aclk or negedge aresetn) begin : __wstrb
//     if(!aresetn)
//         out_wstrb='b0;
//     else if(out_wvalid)
//         out_wstrb=4'b1111;    
// end
assign out_wstrb=out_wvalid?{32{1'b1}}:'b0; 
//<<<



endmodule