`timescale 1ps/1ps
`default_nettype none

module axi_crossbar_slv_if#(
    parameter AXI_ADDR_W = 32,
    //主机输入ID宽度
    parameter AXI_ID_W  =4,
    parameter AXI_DATA_W = 32,

    parameter BASE_ADDR = 0,

    //OSTD REQ NUM
    parameter SLV_OSTDREQ_NUM = 4,
    //The data size of each OSTD REG
    parameter SLV_OSTDREQ_SIZE = 1,

    parameter AWCH_W = 53,
    parameter WCH_W  = 47,
    parameter BCH_W  = 12,
    parameter ARCH_W = 53,
    parameter RCH_W  = 45)(
    //interface from switch
    input  wire  i_aclk,
    input  wire  i_aresetn,
    input  wire  i_srst,
    //AW Channel
    input  wire  i_awvalid,
    output logic i_awready,
    input  wire  [AWCH_W      - 1 : 0] i_awch,
    //W Channel
    input  wire  i_wvalid,
    output logic i_wready,
    input  wire  [WCH_W        - 1 : 0] i_wch,
    input  wire  i_wlast,
    //B Channel
    output logic i_bvalid,
    input  wire  i_bready,
    output logic [BCH_W        - 1 : 0] i_bch,
    //AR Channel
    input  wire  i_arvalid,
    output logic i_arready,
    input  wire  [ARCH_W       - 1 : 0] i_arch,
    //R Channel
    output logic i_rvalid,
    input  wire  i_rready,
    output logic i_rlast,
    output logic [RCH_W       - 1 : 0] i_rch,
    //interface to slave
    input  wire  o_aclk,
    input  wire  o_aresetn,
    input  wire  o_srst,
    //AW Channel
    output logic o_awvalid,
    input  wire  o_awready,
    output logic [AXI_ADDR_W  - 1 : 0] o_awaddr,
    output logic [4           - 1 : 0] o_awlen,
    output logic [3           - 1 : 0] o_awsize,
    output logic [2           - 1 : 0] o_awburst,
    output logic [AXI_ID_W    - 1 : 0] o_awid,
    output logic [2           - 1 : 0] o_awlock,
    //W Channel
    output logic o_wvalid,
    input  wire  o_wready,
    output logic o_wlast,
    output logic [AXI_ID_W   - 1 : 0] o_wid,
    output logic [AXI_DATA_W - 1 : 0] o_wdata,
    output logic [4          - 1 : 0] o_wstrb,
    //R Channel
    input  wire  o_bvalid,
    output logic o_bready,
    input  wire  [AXI_ID_W    - 1 : 0] o_bid,
    input  wire  [2           - 1 : 0] o_bresp,
    //AR Channel
    output logic o_arvalid,
    input  wire  o_arready,
    output logic [AXI_ADDR_W  - 1 : 0] o_araddr,
    output logic [4           - 1 : 0] o_arlen,
    output logic [3           - 1 : 0] o_arsize,
    output logic [2           - 1 : 0] o_arburst,
    output logic [AXI_ID_W    - 1 : 0] o_arid,
    output logic [2           - 1 : 0] o_arlock,
    //R Channel
    input  wire  o_rvalid,
    output logic o_rready,

    input  wire  [AXI_ID_W    - 1 : 0] o_rid,
    input  wire  [2           - 1 : 0] o_rresp,
    input  wire  [AXI_DATA_W  - 1 : 0] o_rdata,
    input  wire  o_rlast
    );

    localparam AW_ASIZE = $clog2(SLV_OSTDREQ_NUM);
    localparam W_ASIZE  = $clog2(SLV_OSTDREQ_NUM * SLV_OSTDREQ_SIZE);
    localparam B_ASIZE  = $clog2(SLV_OSTDREQ_NUM);
    localparam AR_ASIZE = $clog2(SLV_OSTDREQ_NUM);
    localparam R_ASIZE  = $clog2(SLV_OSTDREQ_NUM * SLV_OSTDREQ_SIZE);

    logic [AWCH_W - 1 : 0] awch;
    logic [WCH_W  - 1 : 0] wch;
    logic [BCH_W  - 1 : 0] bch;
    logic [ARCH_W - 1 : 0] arch;
    logic [RCH_W  - 1 : 0] rch;
    
    //传递信号
    logic rlast;
    logic [AXI_ADDR_W - 1 : 0] awaddr;
    logic [AXI_ADDR_W - 1 : 0] araddr;

    assign {o_awlock, o_awburst, o_awsize, o_awlen, o_awid, awaddr} = awch;
    assign {o_wstrb, o_wdata, o_wid} = wch;
    assign bch = {o_bresp, o_bid};
    assign {o_arlock, o_arburst, o_arsize, o_arlen, o_arid, araddr} = arch;
    assign rch = {o_rdata, o_rresp, o_rid};
    assign rlast = o_rlast;

    assign o_awaddr = awaddr - BASE_ADDR[0 +: AXI_ADDR_W];
    assign o_araddr = araddr - BASE_ADDR[0 +: AXI_ADDR_W];

    logic aw_wren;
    logic aw_full;
    logic aw_rden;
    logic aw_empty;
    logic w_wren;
    logic w_full;
    logic w_rden;
    logic w_empty;
    logic b_wren;
    logic b_full;
    logic b_rden;
    logic b_empty;
    logic ar_wren;
    logic ar_full;
    logic ar_rden;
    logic ar_empty;
    logic r_wren;
    logic r_full;
    logic r_rden;
    logic r_empty;

    //AW Channel Async FIFO
    Async_FIFO #(.DATA_WIDTH(AWCH_W),
                 .ADDR_SIZE(AW_ASIZE)) 
        aw_async_fifo
                (.wr_clk(i_aclk), 
                 .wr_rstn(i_aresetn), 
                 .wr_en(aw_wren),
                 .din(i_awch),
                 .full(aw_full),
                 .rd_clk(o_aclk),
                 .rd_rstn(o_aresetn), 
                 .rd_en(aw_rden),
                 .empty(aw_empty), 
                 .dout(awch));
    
    assign i_awready = ~aw_full;
    assign aw_wren = i_awvalid & (~aw_full);

    assign o_awvalid = ~aw_empty;
    assign aw_rden = o_awready & (~aw_empty);

    //W Channel Async FIFO
    Async_FIFO #(.DATA_WIDTH(WCH_W + 1),
                 .ADDR_SIZE(W_ASIZE)) 
        w_async_fifo
                (.wr_clk(i_aclk), 
                 .wr_rstn(i_aresetn), 
                 .wr_en(w_wren),
                 .din({i_wlast, i_wch}),
                 .full(w_full),
                 .rd_clk(o_aclk),
                 .rd_rstn(o_aresetn), 
                 .rd_en(w_rden),
                 .empty(w_empty), 
                 .dout({o_wlast, wch}));
    
    assign i_wready = ~w_full;
    assign w_wren = i_wvalid & (~w_full);

    assign o_wvalid = ~w_empty;
    assign w_rden = o_wready & (~w_empty);

     //B Channel Async FIFO
    Async_FIFO #(.DATA_WIDTH(BCH_W),
                 .ADDR_SIZE(B_ASIZE)) 
        b_async_fifo
                (.wr_clk(o_aclk), 
                 .wr_rstn(o_aresetn), 
                 .wr_en(b_wren),
                 .din(bch),
                 .full(b_full),
                 .rd_clk(i_aclk),
                 .rd_rstn(i_aresetn), 
                 .rd_en(b_rden),
                 .empty(b_empty), 
                 .dout(i_bch));
    
    assign i_bvalid = ~b_empty;
    assign b_rden = i_bready & (~b_empty);

    assign o_bready = ~b_full;
    assign b_wren = o_bvalid & (~b_full);

    //AR Channel Async FIFO
    Async_FIFO #(.DATA_WIDTH(ARCH_W),
                 .ADDR_SIZE(AR_ASIZE)) 
        ar_async_fifo
                (.wr_clk(i_aclk), 
                 .wr_rstn(i_aresetn), 
                 .wr_en(ar_wren),
                 .din(i_arch),
                 .full(ar_full),
                 .rd_clk(o_aclk),
                 .rd_rstn(o_aresetn), 
                 .rd_en(ar_rden),
                 .empty(ar_empty), 
                 .dout(arch));
    
    assign i_arready = ~ar_full;
    assign ar_wren = i_arvalid & (~ar_full);

    assign o_arvalid = ~ar_empty;
    assign ar_rden = o_arready & (~ar_empty);

    //AR Channel Async FIFO
    Async_FIFO #(.DATA_WIDTH(RCH_W + 1),
                 .ADDR_SIZE(R_ASIZE)) 
        r_async_fifo
                (.wr_clk(o_aclk), 
                 .wr_rstn(o_aresetn), 
                 .wr_en(r_wren),
                 .din({rlast, rch}),
                 .full(r_full),
                 .rd_clk(i_aclk),
                 .rd_rstn(i_aresetn), 
                 .rd_en(r_rden),
                 .empty(r_empty), 
                 .dout({i_rlast, i_rch}));
    
    assign i_rvalid = ~r_empty;
    assign r_rden = i_rready & (~r_empty);

    assign o_rready = ~r_full;
    assign r_wren = o_rvalid & (~r_full);

endmodule

`resetall