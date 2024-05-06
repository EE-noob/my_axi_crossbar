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

endmodule