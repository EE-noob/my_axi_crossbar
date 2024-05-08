module axi_slv_responder #(
    parameter AXI_ADDR_W = 32,
    //主机输入ID宽度
    parameter AXI_ID_W  =4,
    parameter AXI_DATA_W = 32,

    //OSTD REQ NUM
    parameter SLV_OSTDREQ_NUM = 4,
    //The data size of each OSTD REG
    parameter SLV_OSTDREQ_SIZE = 8,

    parameter AWCH_W = 53,
    parameter WCH_W  = 47,
    parameter BCH_W  = 12,
    parameter ARCH_W = 53,
    parameter RCH_W  = 45)(
    //interface 
    input  logic  aclk,
    input  logic  aresetn,
    input  logic  srst,
    //AW Channel
    //input logic o_awvalid,
    output  logic  out_awready,

    //W Channel
    //input logic o_wvalid,
    output  logic  out_wready,
    input logic in_wlast,
    // input logic [AXI_ID_W   - 1 : 0] o_wid,
    // input logic [AXI_DATA_W - 1 : 0] o_wdata,
    // input logic [4          - 1 : 0] o_wstrb,
    //B Channel
    output  logic  out_bvalid,
    input logic in_bready,
    output  logic  [AXI_ID_W    - 1 : 0] out_bid,
    output  logic  [2           - 1 : 0] out_bresp
    // ,
    // //AR Channel
    // input logic o_arvalid,
    // output  logic  o_arready,
    // input logic [AXI_ADDR_W  - 1 : 0] o_araddr,
    // input logic [4           - 1 : 0] o_arlen,
    // input logic [3           - 1 : 0] o_arsize,
    // input logic [2           - 1 : 0] o_arburst,
    // input logic [AXI_ID_W    - 1 : 0] o_arid,
    // input logic [2           - 1 : 0] o_arlock,
    // //R Channel
    // output  logic  o_rvalid,
    // input logic o_rready,

    // output  logic  [AXI_ID_W    - 1 : 0] o_rid,
    // output  logic  [2           - 1 : 0] o_rresp,
    // output  logic  [AXI_DATA_W  - 1 : 0] o_rdata,
    // output  logic  o_rlast
    );
//vari def>>>
//counter 
    // logic [2**4-1:0]                    wdata_cnt;//fixme!!!!!!
    logic [AXI_ID_W-1:0] rsp_remain_cnt;
    logic [AXI_ID_W-1:0] bresp_rd_ptr;
    logic [AXI_ID_W-1:0] bresp_wr_ptr;
    logic [AXI_ID_W-1:0] bid_rd_ptr;
    logic [AXI_ID_W-1:0] bid_wr_ptr;
//reg
    logic [2          - 1 : 0] bresp_now;
    logic [AXI_ID_W           - 1 : 0] bid_now;
    // logic   out_wlast_prev;
    // logic   out_wvalid_prev;
// //queue 
//     queue [4-1:0]awlen_que[$];

//distributed ram
    logic  [2**AXI_ID_W-1:0]bresp_ram[2-1:0];
    logic  [2**AXI_ID_W-1:0]bid_ram[4-1:0];
    //<<<


//comb>>>
    assign bresp_now=bresp_ram[bresp_rd_ptr];
    assign bid_now=bid_ram[bid_rd_ptr];
    //<<<
//sequential>>>

//counter>>>
    always_ff @( posedge aclk or negedge aresetn) begin : __req_remain_cnt
        if(!aresetn)
            rsp_remain_cnt<=0;
        else if(in_wlast && out_bvalid && in_bready)
            rsp_remain_cnt<=rsp_remain_cnt;
        else if(out_bvalid && in_bready)
            rsp_remain_cnt<=rsp_remain_cnt-1;
        else if(in_wlast)
            rsp_remain_cnt<=rsp_remain_cnt+1; 
        
    end

//<<<
  
//ram
always_ff @( posedge aclk or negedge aresetn) begin : __bresp_rd_ptr
    if(!aresetn)
        bresp_rd_ptr <= 'b0;
    else if(out_bvalid&&in_bready)
        bresp_rd_ptr <= bresp_rd_ptr+1;
    end
always_ff @( posedge aclk or negedge aresetn) begin : __bresp_wr_ptr
    if(!aresetn)
        bresp_wr_ptr <= 'b0;
    else if(in_wlast)
        bresp_wr_ptr <= bresp_wr_ptr+1;
    end
always_ff @( posedge aclk or negedge aresetn) begin : __bresp_ram
    if(!aresetn)
    for (integer i = 0; i < 2**AXI_ID_W; i = i + 1) begin
        bresp_ram[i] <= 'b0;
      end
    else if(in_wlast)
        bresp_ram[bresp_wr_ptr]<= 2'b00;//均默认接收正常
    end
    
    always_ff @( posedge aclk or negedge aresetn) begin : __bid_rd_ptr
        if(!aresetn)
            bid_rd_ptr <= 'b0;
        else if(out_bvalid&&in_bready)
            bid_rd_ptr <= bid_rd_ptr+1;
        end
    always_ff @( posedge aclk or negedge aresetn) begin : __bid_wr_ptr
        if(!aresetn)
            bid_wr_ptr <= 'b0;
        else if(in_wlast)
            bid_wr_ptr <= bid_wr_ptr+1;
        end
    always_ff @( posedge aclk or negedge aresetn) begin : __bid_ram
        if(!aresetn)
        for (integer i = 0; i < 2**AXI_ID_W; i = i + 1) begin
            bid_ram[i] <= 'b0;
          end
        else if(in_wlast)
            bid_ram[bid_wr_ptr]<= 2'b00;//均默认接收正常
        end

//output:>>>
assign out_bvalid= (rsp_remain_cnt!=0);
assign out_bid=bid_now;//!!!!fixme !!!!未考虑交织！！！！

always_ff @( posedge aclk or negedge aresetn) begin : __out_awready
    if(!aresetn)
        out_awready <= 'b0;
    else 
        out_awready<= $random;//!!!!fixme !!!!完全随机！！！！
    end

always_ff @( posedge aclk or negedge aresetn) begin : __out_wready
    if(!aresetn)
        out_wready <= 'b0;
    else 
        out_wready<= $random;//!!!!fixme !!!!完全随机！！！！
    end
//<<<

endmodule