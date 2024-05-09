`timescale 1ps/1ps
`default_nettype none

module axi_crossbar_mst_if #(
    parameter AXI_ADDR_W = 32,
    //主机输入ID宽度
    parameter AXI_ID_W  =4,
    parameter AXI_DATA_W = 32,

    //OSTD REQ NUM
    parameter MST_OSTDREQ_NUM = 4,
    //The data size of each OSTD REG
    parameter MST_OSTDREQ_SIZE = 1,

    parameter AWCH_W = 53,
    parameter WCH_W  = 47,
    parameter BCH_W  = 12,
    parameter ARCH_W = 53,
    parameter RCH_W  = 45,
    
    parameter [AXI_ID_W - 1 : 0] MST_ID_MASK = 'b0100
    )(
    input  wire  i_aclk,
    input  wire  i_aresetn,
    input  wire  i_srst,
    //interface from mst
    //aw channel
    input  wire  i_awvalid,
    output logic i_awready,
    input  wire  [AXI_ADDR_W - 1 : 0] i_awaddr,
    input  wire  [4          - 1 : 0] i_awlen,
    input  wire  [3          - 1 : 0] i_awsize,
    input  wire  [2          - 1 : 0] i_awburst,
    input  wire  [AXI_ID_W   - 1 : 0] i_awid,
    input  wire  [2          - 1 : 0] i_awlock,
    //w channel
    input  wire  i_wvalid,
    output logic i_wready,
    input  wire  i_wlast,
    input  wire  [AXI_ID_W   - 1 : 0] i_wid,
    input  wire  [AXI_DATA_W - 1 : 0] i_wdata,
    input  wire  [4          - 1 : 0] i_wstrb,
    //B channel
    output logic i_bvalid,
    input  wire  i_bready,
    output logic [AXI_ID_W   - 1 : 0] i_bid,
    output logic [2          - 1 : 0] i_bresp,
    //AR channel
    input  wire  i_arvalid,
    output logic i_arready,
    input  wire  [AXI_ADDR_W - 1 : 0] i_araddr,
    input  wire  [4          - 1 : 0] i_arlen,
    input  wire  [3          - 1 : 0] i_arsize,
    input  wire  [2          - 1 : 0] i_arburst,
    input  wire  [AXI_ID_W   - 1 : 0] i_arid,
    input  wire  [2          - 1 : 0] i_arlock,
    //R channel
    output logic i_rvalid,
    input  wire  i_rready,
    output logic [AXI_ID_W   - 1 : 0] i_rid,
    output logic [2          - 1 : 0] i_rresp,
    output logic [AXI_DATA_W - 1 : 0] i_rdata,
    output logic i_rlast,
    //interface to axi switch
    input  wire  o_aclk,
    input  wire  o_aresetn,
    input  wire  o_srst,
    //AW Channel
    output logic o_awvalid,
    input  wire  o_awready,
    output logic [AWCH_W     - 1 : 0] o_awch,
    //W Channel
    output logic o_wvalid,
    input  wire  o_wready,
    output logic o_wlast,
    output logic [WCH_W      - 1 : 0] o_wch,
    //B Channel
    input  wire  o_bvalid,
    output logic o_bready,
    input  wire  [BCH_W      - 1 : 0] o_bch,
    //AR Channel
    output logic o_arvalid,
    input  wire  o_arready,
    output logic [ARCH_W     - 1 : 0] o_arch,
    //R Channel
    input  wire  o_rvalid,
    output logic o_rready,
    input  wire  o_rlast,
    input  wire  [RCH_W      - 1 : 0] o_rch
    );

    localparam AW_ASIZE = $clog2(MST_OSTDREQ_NUM);
    localparam W_ASIZE  = $clog2(MST_OSTDREQ_NUM * MST_OSTDREQ_SIZE);
    localparam B_ASIZE  = $clog2(MST_OSTDREQ_NUM);
    localparam AR_ASIZE = $clog2(MST_OSTDREQ_NUM);
    localparam R_ASIZE  = $clog2(MST_OSTDREQ_NUM * MST_OSTDREQ_SIZE);

    logic [AXI_ID_W - 1 : 0] i_awid_ex;
    logic [AXI_ID_W - 1 : 0] i_wid_ex;
    logic [AXI_ID_W - 1 : 0] i_bid_ex;
    logic [AXI_ID_W - 1 : 0] i_arid_ex;
    logic [AXI_ID_W - 1 : 0] i_rid_ex;

    logic [AWCH_W - 1 : 0] awch;
    logic [WCH_W  - 1 : 0] wch;
    logic [BCH_W  - 1 : 0] bch;
    logic [ARCH_W - 1 : 0] arch;
    logic [RCH_W  - 1 : 0] rch;
    logic wlast;

    //添加主机掩码
    assign i_awid_ex = {MST_ID_MASK[2 +: 2], i_awid[0 +: 2]};
    assign i_wid_ex  = {MST_ID_MASK[2 +: 2], i_wid[0 +: 2]};
    assign i_arid_ex = {MST_ID_MASK[2 +: 2], i_arid[0 +: 2]};
    assign i_bid = {{2'b00}, i_bid_ex[0 +: 2]};
    assign i_rid = {{2'b00}, i_rid_ex[0 +: 2]};

    //信号合并与拆解
    assign awch = {i_awlock, i_awburst, i_awsize, i_awlen, i_awid_ex, i_awaddr};
    assign wch  = {i_wstrb, i_wdata, i_wid_ex};
    assign arch = {i_arlock, i_arburst, i_arsize, i_arlen, i_arid_ex, i_araddr};
    assign {i_bresp, i_bid_ex} = bch;
    assign {i_rdata, i_rresp, i_rid_ex} = rch;
    assign wlast = i_wlast;

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
                 .din(awch),
                 .full(aw_full),
                 .rd_clk(o_aclk),
                 .rd_rstn(o_aresetn), 
                 .rd_en(aw_rden),
                 .empty(aw_empty), 
                 .dout(o_awch));
    
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
                 .din({wlast, wch}),
                 .full(w_full),
                 .rd_clk(o_aclk),
                 .rd_rstn(o_aresetn), 
                 .rd_en(w_rden),
                 .empty(w_empty), 
                 .dout({o_wlast, o_wch}));
    
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
                 .din(o_bch),
                 .full(b_full),
                 .rd_clk(i_aclk),
                 .rd_rstn(i_aresetn), 
                 .rd_en(b_rden),
                 .empty(b_empty), 
                 .dout(bch));
    
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
                 .din(arch),
                 .full(ar_full),
                 .rd_clk(o_aclk),
                 .rd_rstn(o_aresetn), 
                 .rd_en(ar_rden),
                 .empty(ar_empty), 
                 .dout(o_arch));
    
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
                 .din({o_rlast, o_rch}),
                 .full(r_full),
                 .rd_clk(i_aclk),
                 .rd_rstn(i_aresetn), 
                 .rd_en(r_rden),
                 .empty(r_empty), 
                 .dout({i_rlast, rch}));
    
    assign i_rvalid = ~r_empty;
    assign r_rden = i_rready & (~r_empty);

    assign o_rready = ~r_full;
    assign r_wren = o_rvalid & (~r_full);

endmodule

`resetall