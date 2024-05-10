`timescale 1ps/1ps
`default_nettype none

module axi_crossbar_mst_switch#(
    parameter AXI_ADDR_W = 32,
    parameter AXI_ID_W   = 4,
    parameter SLV_NB     = 3,

    //决定MST的访问权限
    parameter MST_ROUTES = 3'b1_1_1,

    // Slaves memory mapping
    parameter SLV0_START_ADDR = 0,
    parameter SLV0_END_ADDR = 4095,
    parameter SLV1_START_ADDR = 4096,
    parameter SLV1_END_ADDR = 8191,
    parameter SLV2_START_ADDR = 8192,
    parameter SLV2_END_ADDR = 12287,

    //PRIORITY
    parameter SLV0_PRIORITY = 0,
    parameter SLV1_PRIORITY = 0,
    parameter SLV2_PRIORITY = 0,

    parameter MST_OSTDREQ_NUM = 4,
    parameter MST_OSTDREQ_SIZE = 1,

    // Channels' width (concatenated)
    parameter AWCH_W = 49,
    parameter WCH_W  = 43,
    parameter BCH_W  = 8,
    parameter ARCH_W = 49,
    parameter RCH_W  = 41,

    //CAM parameters
    parameter CAM_ADDR_WIDTH = 4)(
    //AXI Global Interface
    input  wire  aclk,
    input  wire  aresetn,
    input  wire  srst,
    //Interface from mst_if
    //AW Channel
    input  wire  i_awvalid,
    output logic i_awready,
    input  wire  [AWCH_W        - 1 : 0] i_awch,
    //W Channel
    input  wire  i_wvalid,
    output logic i_wready,
    input  wire  [WCH_W         - 1 : 0] i_wch,
    input  wire  i_wlast,
    //B Channel
    output logic i_bvalid,
    input  wire  i_bready,
    output logic [BCH_W         - 1 : 0] i_bch,
    //AR Channel
    input  wire  i_arvalid,
    output logic i_arready,
    input  wire  [ARCH_W        - 1 : 0] i_arch,
    //R Channel
    output logic i_rvalid,
    input  wire  i_rready,
    output logic i_rlast,
    output logic [RCH_W        - 1 : 0] i_rch,
    //Interface to slv_switch
    //AW Channel
    output logic [SLV_NB       - 1 : 0] o_awvalid,
    input  wire  [SLV_NB       - 1 : 0] o_awready,
    output logic [AWCH_W       - 1 : 0] o_awch,
    //W Channel
    output logic [SLV_NB       - 1 : 0] o_wvalid,
    input  wire  [SLV_NB       - 1 : 0] o_wready,
    output logic [SLV_NB       - 1 : 0] o_wlast,
    output logic [WCH_W        - 1 : 0] o_wch,
    //B Channel
    input  wire  [SLV_NB       - 1 : 0] o_bvalid,
    output logic [SLV_NB       - 1 : 0] o_bready,
    input  wire  [BCH_W*SLV_NB - 1 : 0] o_bch,
    //AR Channel
    output logic [SLV_NB       - 1 : 0] o_arvalid,
    input  wire  [SLV_NB       - 1 : 0] o_arready,
    output logic [ARCH_W       - 1 : 0] o_arch,
    //R Channel
    input  wire  [SLV_NB       - 1 : 0] o_rvalid,
    output logic [SLV_NB       - 1 : 0] o_rready,
    input  wire  [SLV_NB       - 1 : 0] o_rlast,
    input  wire  [RCH_W*SLV_NB - 1 : 0] o_rch
    );

    //始末地址的计算
    logic [AXI_ADDR_W-1:0] slv0_start_addr = SLV0_START_ADDR[0+:AXI_ADDR_W];
    logic [AXI_ADDR_W-1:0] slv0_end_addr =   SLV0_END_ADDR[0+:AXI_ADDR_W];
    logic [AXI_ADDR_W-1:0] slv1_start_addr = SLV1_START_ADDR[0+:AXI_ADDR_W];
    logic [AXI_ADDR_W-1:0] slv1_end_addr =   SLV1_END_ADDR[0+:AXI_ADDR_W];
    logic [AXI_ADDR_W-1:0] slv2_start_addr = SLV2_START_ADDR[0+:AXI_ADDR_W];
    logic [AXI_ADDR_W-1:0] slv2_end_addr =   SLV2_END_ADDR[0+:AXI_ADDR_W];

    //route计算
    logic [SLV_NB    -1:0] slv_aw_targeted;
    logic [SLV_NB    -1:0] slv_w_targeted;
    logic [SLV_NB    -1:0] slv_ar_targeted;

    logic w_misrouting;
    logic r_misrouting;

    //aw channel 4k boundary
    logic                  aw_cross_4k_boundary;
    logic [AXI_ADDR_W-1:0] i_awaddr;
    logic [4         -1:0] i_awlen;
    logic [3         -1:0] i_awsize;
    logic [2         -1:0] i_awburst;

    logic [AXI_ADDR_W-1:0] end_awaddr;

    logic                  i_awready_reg;
    logic [SLV_NB    -1:0] o_awvalid_reg;          
    logic [AXI_ID_W  -1:0] aw_id_reg;

    //wch round robin signal
    logic                  wch_en;
    logic [SLV_NB    -1:0] wch_req;
    logic [SLV_NB    -1:0] wch_grant;

    //cam control signal
    logic [AXI_ID_W -1 :0] cam_awid;
    //misroute需要再aw输入的下一个周期才能拉高，所以需要对应的AWID延迟一个周期
    logic [AXI_ID_W -1 :0] cam_awid_in;
    logic                  cam_write_enable;
    logic                  cam_write_delete;
    logic [AXI_ID_W -1 :0] cam_compare_wid;
    logic                  cam_match;
    logic                  cam_write_busy;
    logic [SLV_NB - 1 : 0] cam_target;
    logic [SLV_NB - 1 : 0] cam_target_in;
    logic [SLV_NB - 1 : 0] cam_match_target;
    logic cam_match_valid;
    logic cam_locked;

    logic                  bch_error_full;
    logic                  bch_error_empty;
    logic [AXI_ID_W  -1:0] bch_error_id;
    
    logic                  bch_en;
    logic [SLV_NB    -1:0] bch_req;
    logic [SLV_NB    -1:0] bch_grant;

    //ar channel 4k boundary
    logic                  ar_cross_4k_boundary;
    logic [AXI_ADDR_W-1:0] i_araddr;
    logic [4         -1:0] i_arlen;
    logic [3         -1:0] i_arsize;
    logic [2         -1:0] i_arburst;

    logic [AXI_ADDR_W-1:0] end_araddr;

    logic                  i_arready_reg;
    logic [SLV_NB    -1:0] o_arvalid_reg;     
    logic [AXI_ID_W  -1:0] cam_arid;     
    logic [AXI_ID_W  -1:0] ar_id_reg;

    logic                  rch_en;
    logic [SLV_NB    -1:0] rch_req;
    logic [SLV_NB    -1:0] rch_grant;

    logic                  rch_error_full;
    logic                  rch_error_empty;

    logic [AXI_ID_W+4-1:0] rch_error_info;
    logic [AXI_ID_W  -1:0] rch_error_id;
    logic [4         -1:0] rch_error_len;
    logic [4         -1:0] rlen;
    logic                  rch_running;

    //////////////////////////////////////
    //AW Channel
    /////////////////////////////////////
    //Include 4K boundary
        generate

    if (MST_ROUTES[0]==1'b1) begin : SLV0_AW_ROUTE_ON
        assign slv_aw_targeted[0] = (i_awch[0+:AXI_ADDR_W] >= slv0_start_addr[0+:AXI_ADDR_W] &&
                                     i_awch[0+:AXI_ADDR_W] <= slv0_end_addr[0+:AXI_ADDR_W]) ? 1'b1:
                                                                                              1'b0;
    end else begin : SLV0_AW_ROUTE_OFF
        assign slv_aw_targeted[0] = 1'b0;
    end

    if (MST_ROUTES[1]==1'b1) begin : SLV1_AW_ROUTE_ON
        assign slv_aw_targeted[1] = (i_awch[0+:AXI_ADDR_W] >= slv1_start_addr[0+:AXI_ADDR_W] &&
                                     i_awch[0+:AXI_ADDR_W] <= slv1_end_addr[0+:AXI_ADDR_W]) ? 1'b1 :
                                                                                              1'b0;
    end else begin : SLV1_AW_ROUTE_OFF
        assign slv_aw_targeted[1] = 1'b0;
    end

    if (MST_ROUTES[2]==1'b1) begin : SLV2_AW_ROUTE_ON
        assign slv_aw_targeted[2] = (i_awch[0+:AXI_ADDR_W] >= slv2_start_addr[0+:AXI_ADDR_W] &&
                                     i_awch[0+:AXI_ADDR_W] <= slv2_end_addr[0+:AXI_ADDR_W]) ? 1'b1 :
                                                                                              1'b0;
    end else begin : SLV2_AW_ROUTE_OFF
        assign slv_aw_targeted[2] = 1'b0;
    end

    endgenerate

    //加握手来解决misroute的问题
    always @ (posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            w_misrouting <= 1'b0;
        end else if (srst) begin
            w_misrouting <= 1'b0;
        end else begin
            if (w_misrouting) begin
                w_misrouting <= 1'b0;
            end else if (i_awvalid && |slv_aw_targeted==1'b0 && !bch_error_full) begin     
            //接收到地址有效信号（'i_awvalid'）且没有从目标设备（'slv_aw_targeted'全部为零）并且接收缓冲区未满（'bch_error_full'为假）
                w_misrouting <= 1'b1;
            end
        end
    end

    //从握手的AW通道中提取出握手的ID号
    assign cam_awid = i_awch[AXI_ADDR_W+:AXI_ID_W];
    assign cam_target = slv_aw_targeted;

    assign i_awaddr = i_awch[0 +: AXI_ADDR_W];
    assign i_awlen = i_awch[AXI_ADDR_W+AXI_ID_W +: 4];
    assign i_awsize = i_awch[AXI_ADDR_W+AXI_ID_W+4 +: 3];
    assign i_awburst = i_awch[AXI_ADDR_W+AXI_ID_W+4+3 +: 2];
    assign end_awaddr = i_awaddr + i_awlen * i_awsize;

    //4K边界识别
    always @ (posedge aclk or negedge aresetn) begin
        if(!aresetn) begin
            aw_cross_4k_boundary <= 1'b0;
        end else if(srst) begin
            aw_cross_4k_boundary <= 1'b0;
        end else begin
            if(aw_cross_4k_boundary) begin
                aw_cross_4k_boundary <= 1'b0;
            end else if(i_awvalid && (|slv_aw_targeted != 'b0) && !bch_error_full && i_awburst == 2'b01 && (i_awaddr[12 +:4] != end_awaddr[12 +:4])) begin
                aw_cross_4k_boundary <= 1'b1;
            end else begin
                aw_cross_4k_boundary <= 1'b0;
            end
        end
    end

    // // //o_awvalid信号的传递
    // // assign o_awvalid[0] = (slv_aw_targeted[0]) ? i_awvalid : 1'b0;
    // // assign o_awvalid[1] = (slv_aw_targeted[1]) ? i_awvalid : 1'b0;
    // // assign o_awvalid[2] = (slv_aw_targeted[2]) ? i_awvalid : 1'b0;
    // //i_awready延迟一个周期传递，对应的o_awvalid也应该延迟一个周期再传递
    // always @(posedge aclk or negedge aresetn) begin
    //     if(!aresetn) begin
    //         o_awvalid_reg[0] <= 'b0;
    //         o_awvalid_reg[1] <= 'b0;
    //         o_awvalid_reg[2] <= 'b0;
    //     end else if(srst) begin
    //         o_awvalid_reg[0] <= 'b0;
    //         o_awvalid_reg[1] <= 'b0;
    //         o_awvalid_reg[2] <= 'b0;
    //     end else if(aw_id_reg != cam_awid) begin
    //         o_awvalid_reg[0] <= 'b0;
    //         o_awvalid_reg[1] <= 'b0;
    //         o_awvalid_reg[2] <= 'b0;
    //     end else if(aw_cross_4k_boundary | w_misrouting) begin
    //         o_awvalid_reg[0] <= 'b0;
    //         o_awvalid_reg[1] <= 'b0;
    //         o_awvalid_reg[2] <= 'b0;
    //     end else if(slv_aw_targeted[0]) begin
    //         o_awvalid_reg[0] <= i_awvalid;
    //         o_awvalid_reg[1] <= 'b0;
    //         o_awvalid_reg[2] <= 'b0;
    //     end else if(slv_aw_targeted[1]) begin
    //         o_awvalid_reg[0] <= 'b0;
    //         o_awvalid_reg[1] <= i_awvalid;
    //         o_awvalid_reg[2] <= 'b0;
    //     end else if(slv_aw_targeted[2]) begin
    //         o_awvalid_reg[0] <= 'b0;
    //         o_awvalid_reg[1] <= 'b0;
    //         o_awvalid_reg[2] <= i_awvalid;
    //     end else begin
    //         o_awvalid_reg[0] <= 'b0;
    //         o_awvalid_reg[1] <= 'b0;
    //         o_awvalid_reg[2] <= 'b0;            
    //     end
    // end

    // assign o_awvalid = o_awvalid_reg;
    assign o_awvalid[0] = (aw_id_reg != cam_awid) ? 1'b0     : 
                          (aw_cross_4k_boundary)  ? 1'b0     :
                          (w_misrouting)          ? 1'b0     :
                          (slv_aw_targeted[0])    ? i_awvalid:
                                                    1'b0;
    assign o_awvalid[1] = (aw_id_reg != cam_awid) ? 1'b0     : 
                          (aw_cross_4k_boundary)  ? 1'b0     :
                          (w_misrouting)          ? 1'b0     :
                          (slv_aw_targeted[1])    ? i_awvalid:
                                                    1'b0;     

    assign o_awvalid[2] = (aw_id_reg != cam_awid) ? 1'b0     : 
                          (aw_cross_4k_boundary)  ? 1'b0     :
                          (w_misrouting)          ? 1'b0     :
                          (slv_aw_targeted[2])    ? i_awvalid:
                                                    1'b0; 

    //4K边界处理方式应该和misroute相同
    //由于aw_cross_4K_boundary需要再AW指令改变后的下一个周期才会发生改变，因此对于i_awready也需要等待一个周期
    always @(posedge aclk or negedge aresetn) begin
        if(!aresetn) begin
            aw_id_reg <= 'b0;
        end else if(srst) begin
            aw_id_reg <= 'b0;
        end else if(i_awvalid)begin 
            aw_id_reg <= cam_awid;
        end else begin
            aw_id_reg <= aw_id_reg;
        end
    end

    //i_awready信号的产生处理
    //此处默认Response Channel内FIFO不会满，下一个周期一定出结果
    // always @(posedge aclk or negedge aresetn) begin
    //     if(!aresetn) begin
    //         i_awready_reg <= 'b0;
    //     end else if (srst) begin
    //         i_awready_reg <= 'b0;
    //     end else if (aw_id_reg != cam_awid) begin
    //         i_awready_reg <= 'b0;
    //     end else if (aw_cross_4k_boundary) begin
    //         i_awready_reg <= 'b1;
    //     end else if(w_misrouting) begin
    //         i_awready_reg <= 'b1;
    //     end else if(slv_aw_targeted[0]) begin
    //         i_awready_reg <= o_awready[0];
    //     end else if(slv_aw_targeted[1]) begin
    //         i_awready_reg <= o_awready[1];
    //     end else if(slv_aw_targeted[2]) begin
    //         i_awready_reg <= o_awready[2];
    //     end else begin
    //         i_awready_reg <= 'b0;
    //     end
    // end
                                      
    // assign i_awready = i_awready_reg;
    assign i_awready =    (aw_id_reg != cam_awid) ? 1'b0        : 
                          (aw_cross_4k_boundary)  ? 1'b1        :
                          (w_misrouting)          ? 1'b1        :
                          (slv_aw_targeted[0])    ? o_awready[0]:                          
                          (slv_aw_targeted[1])    ? o_awready[1]:                          
                          (slv_aw_targeted[2])    ? o_awready[2]:
                                                    1'b0;




    //o_awch信号的传递
    assign o_awch = i_awch;

    //cam写入信号的产生
    always @(posedge aclk or negedge aresetn) begin
        if(!aresetn) begin
            cam_awid_in <= 'h00;
            cam_target_in <= 'h0;
        end else if (srst) begin
            cam_awid_in <= 'h00;
            cam_target_in <= 'h0;
        end else begin
            cam_awid_in <= cam_awid;
            cam_target_in <= cam_target;
        end 
    end

    always @(posedge aclk or negedge aresetn) begin
        if(!aresetn) begin
            cam_write_enable <= 'b0;
        end else if(srst) begin
            cam_write_enable <= 'b0;
        end else begin
            //misroute 不写入cam
            if(i_awvalid && |slv_aw_targeted==1'b0) begin
                cam_write_enable <= 'b0;
            //4K boundary不写入cam
            end else if (i_awvalid && |slv_aw_targeted != 'b0 && i_awburst == 2'b01 && (i_awaddr[12 +:4] != end_awaddr[12 +:4])) begin
                cam_write_enable <= 'b0;
            end else if(i_awvalid) begin
                cam_write_enable <= 'b1;
            end else begin
                cam_write_enable <= 'b0;
            end
        end
    end

    //////////////////////////////////////
    //AW Channel
    /////////////////////////////////////
    //取出WID在CAM内进行查找
    assign cam_compare_wid =  i_wch[0 +: AXI_ID_W];

    //当i_wlast为1且i_wready为1和i_wvalid握手过了
    assign cam_write_delete = i_wvalid & i_wready & i_wlast;

    cam_bram
    #(.DATA_WIDTH(AXI_ID_W), 
      .CAM_TARGET_WIDTH(SLV_NB),
      .ADDR_WIDTH(CAM_ADDR_WIDTH))
    mst_switch_wch_cam
    (.clk(aclk), 
     .rstn(aresetn),
     .write_data(cam_awid_in),
     .write_delete(cam_write_delete),
     .write_enable(cam_write_enable),
     .write_target(cam_target_in),
     .compare_data(cam_compare_wid),
     .match(cam_match),
     .match_target(cam_match_target),
     .match_valid(cam_match_valid),
     .write_busy(cam_write_busy));

    // assign cam_locked = cam_write_busy | cam_write_delete;

    //匹配到了根据cam_match_target转发
    assign o_wvalid[0] = (!cam_write_busy & cam_match_valid & cam_match & cam_match_target[0]) ? i_wvalid : 1'b0;
    assign o_wvalid[1] = (!cam_write_busy & cam_match_valid & cam_match & cam_match_target[1]) ? i_wvalid : 1'b0;
    assign o_wvalid[2] = (!cam_write_busy & cam_match_valid & cam_match & cam_match_target[2]) ? i_wvalid : 1'b0;

    assign i_wready = (!cam_write_busy & cam_match_valid & cam_match & cam_match_target[0]) ? o_wready[0] :
                      (!cam_write_busy & cam_match_valid & cam_match & cam_match_target[1]) ? o_wready[1] :
                      (!cam_write_busy & cam_match_valid & cam_match & cam_match_target[2]) ? o_wready[2] :
                      // 若没有匹配到，则可以确定是特殊情况吗misroute或者4K边界处理，则返回1’1；
                      // 否则需要继续等待，暂时先返回1'b0
                      (!cam_write_busy & cam_match_valid & ~cam_match                     ) ? 1'b1 :
                                                                            1'b0;
    
    assign o_wlast[0] = (!cam_write_busy & cam_match_valid & cam_match & cam_match_target[0]) ? i_wlast : 1'b0;
    assign o_wlast[1] = (!cam_write_busy & cam_match_valid & cam_match & cam_match_target[1]) ? i_wlast : 1'b0;
    assign o_wlast[2] = (!cam_write_busy & cam_match_valid & cam_match & cam_match_target[2]) ? i_wlast : 1'b0;

    assign o_wch = i_wch;

    //////////////////////////////////////
    //B Channel
    /////////////////////////////////////
    //优先处理mis_route和4k boundary
    sync_fifo #(.ADDR_WIDTH($clog2(MST_OSTDREQ_NUM)),
                .DATA_WIDTH(AXI_ID_W))
    bch_error_fifo
               (.aclk(aclk), 
                .aresetn(aresetn), 
                .srst(srst), 
                .data_in(cam_awid), 
                .push(w_misrouting | aw_cross_4k_boundary), 
                .pull(i_bvalid & i_bready),
                .full(bch_error_full), 
                .empty(bch_error_empty), 
                .data_out(bch_error_id));

    round_arbiter#(.REQ_NB(SLV_NB),
                   .REQ0_PRIORITY(SLV0_PRIORITY),
                   .REQ1_PRIORITY(SLV1_PRIORITY),
                   .REQ2_PRIORITY(SLV2_PRIORITY))
    bch_round_arbiter
                  (.aclk(aclk), 
                   .aresetn(aresetn), 
                   .srst(srst), 
                   .en(bch_en), 
                   .req(bch_req),
                   .grant(bch_grant));
    
    assign bch_en  = i_bvalid & i_bready & bch_error_empty;
    assign bch_req =  o_bvalid;
    
    assign i_bvalid = (!bch_error_empty) ?    1'b1 :
                      (bch_grant[0]) ? o_bvalid[0] :
                      (bch_grant[1]) ? o_bvalid[1] :
                      (bch_grant[2]) ? o_bvalid[2] :
                                       1'b0;

    assign i_bch = (!bch_error_empty) ? {{BCH_W - AXI_ID_W{1'b0}}, bch_error_id} :
                   (bch_grant[0])  ? o_bch[0*BCH_W+:BCH_W] :
                   (bch_grant[1])  ? o_bch[1*BCH_W+:BCH_W] :
                   (bch_grant[2])  ? o_bch[2*BCH_W+:BCH_W] :
                                     {BCH_W{1'b0}};

    //////////////////////////////////////
    //AR Channel
    /////////////////////////////////////
    generate

    if (MST_ROUTES[0]==1'b1) begin : SLV0_AR_ROUTE_ON
        assign slv_ar_targeted[0] = (i_arch[0+:AXI_ADDR_W] >= slv0_start_addr[0+:AXI_ADDR_W] &&
                                     i_arch[0+:AXI_ADDR_W] <= slv0_end_addr[0+:AXI_ADDR_W]) ? 1'b1:
                                                                                              1'b0;
    end else begin : SLV0_AR_ROUTE_OFF
        assign slv_ar_targeted[0] = 1'b0;
    end

    if (MST_ROUTES[1]==1'b1) begin : SLV1_AR_ROUTE_ON
        assign slv_ar_targeted[1] = (i_arch[0+:AXI_ADDR_W] >= slv1_start_addr[0+:AXI_ADDR_W] &&
                                     i_arch[0+:AXI_ADDR_W] <= slv1_end_addr[0+:AXI_ADDR_W]) ? 1'b1 :
                                                                                              1'b0;
    end else begin : SLV1_AR_ROUTE_OFF
        assign slv_ar_targeted[1] = 1'b0;
    end

    if (MST_ROUTES[2]==1'b1) begin : SLV2_AR_ROUTE_ON
        assign slv_ar_targeted[2] = (i_arch[0+:AXI_ADDR_W] >= slv2_start_addr[0+:AXI_ADDR_W] &&
                                     i_arch[0+:AXI_ADDR_W] <= slv2_end_addr[0+:AXI_ADDR_W]) ? 1'b1 :
                                                                                              1'b0;
    end else begin : SLV2_AR_ROUTE_OFF
        assign slv_ar_targeted[2] = 1'b0;
    end

    endgenerate

    // 检测misroute
    always @ (posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            r_misrouting <= 1'b0;
        end else if (srst) begin
            r_misrouting <= 1'b0;
        end else begin
            if (r_misrouting) begin
                r_misrouting <= 1'b0;
            end else if (i_arvalid && |slv_ar_targeted==1'b0 && !rch_error_full) begin
                r_misrouting <= 1'b1;
            end
        end
    end

    //提取AR通道的ID
    //4K边界处理方式应该和misroute相同
    //由于ar_cross_4K_boundary需要再AR指令改变后的下一个周期才会发生改变，因此对于i_arready也需要等待一个周期
    always @(posedge aclk or negedge aresetn) begin
        if(!aresetn) begin
            ar_id_reg <= 'b0;
        end else if(srst) begin
            ar_id_reg <= 'b0;
        end else begin
            ar_id_reg <= i_arch[AXI_ADDR_W +:AXI_ID_W];
        end
    end

    
    assign i_araddr = i_arch[0 +: AXI_ADDR_W];
    assign i_arlen = i_arch[AXI_ADDR_W+AXI_ID_W +:4];
    assign i_arsize = i_arch[AXI_ADDR_W+AXI_ID_W+4 +:3];
    assign i_arburst = i_arch[AXI_ADDR_W+AXI_ID_W+4+3 +:2];
    assign end_araddr = i_araddr + i_arlen * i_arsize;

        //4K边界处理
    always @ (posedge aclk or negedge aresetn) begin
        if(!aresetn) begin
            ar_cross_4k_boundary <= 1'b0;
        end else if(srst) begin
            ar_cross_4k_boundary <= 1'b0;
        end else begin
            if(ar_cross_4k_boundary) begin
                ar_cross_4k_boundary <= 1'b0;
            end else if(i_arvalid && |slv_ar_targeted != 'b0 && !rch_error_full && i_arburst == 2'b01 && (i_araddr[12 +:4] != end_araddr[12 +:4])) begin
                ar_cross_4k_boundary <= 1'b1;
            end else begin
                ar_cross_4k_boundary <= 1'b0;
            end
        end
    end

        //此处默认Read Channel内FIFO不会满，下一个周期一定出结果
    // always @(posedge aclk or negedge aresetn) begin
    //     if(!aresetn) begin
    //         i_arready_reg <= 'b0;
    //     end else if (srst) begin
    //         i_arready_reg <= 'b0;
    //     end else if (ar_id_reg != i_arch[AXI_ADDR_W +:AXI_ID_W]) begin
    //         i_arready_reg <= 'b0;
    //     end else if (ar_cross_4k_boundary) begin
    //         i_arready_reg <= 'b1;
    //     end else if(r_misrouting) begin
    //         i_arready_reg <= 'b1;
    //     end else if(slv_ar_targeted[0]) begin
    //         i_arready_reg <= o_arready[0];
    //     end else if(slv_ar_targeted[1]) begin
    //         i_arready_reg <= o_arready[1];
    //     end else if(slv_ar_targeted[2]) begin
    //         i_arready_reg <= o_arready[2];
    //     end else begin
    //         i_arready_reg <= 'b0;
    //     end
    // end

    // assign i_arready = i_arready_reg;
    assign cam_arid  = i_arch[AXI_ADDR_W +:AXI_ID_W];
    assign i_arready =    (ar_id_reg != cam_arid) ? 1'b0        : 
                          (ar_cross_4k_boundary)  ? 1'b1        :
                          (r_misrouting)          ? 1'b1        :
                          (slv_ar_targeted[0])    ? o_arready[0]:                          
                          (slv_ar_targeted[1])    ? o_arready[1]:                          
                          (slv_ar_targeted[2])    ? o_arready[2]:
                                                    1'b0;

    assign o_arch = i_arch;

    // assign o_arvalid[0] = (slv_ar_targeted[0]) ? i_arvalid : 1'b0;
    // assign o_arvalid[1] = (slv_ar_targeted[1]) ? i_arvalid : 1'b0;
    // assign o_arvalid[2] = (slv_ar_targeted[2]) ? i_arvalid : 1'b0;
    //i_arready延迟一个周期传递，对应的o_arvalid也应该延迟一个周期再传递
    // always @(posedge aclk or negedge aresetn) begin
    //     if(!aresetn) begin
    //         o_arvalid_reg[0] <= 'b0;
    //         o_arvalid_reg[1] <= 'b0;
    //         o_arvalid_reg[2] <= 'b0;
    //     end else if(srst) begin
    //         o_arvalid_reg[0] <= 'b0;
    //         o_arvalid_reg[1] <= 'b0;
    //         o_arvalid_reg[2] <= 'b0;
    //     end else if(ar_id_reg != i_arch[AXI_ADDR_W +:AXI_ID_W]) begin
    //         o_arvalid_reg[0] <= 'b0;
    //         o_arvalid_reg[1] <= 'b0;
    //         o_arvalid_reg[2] <= 'b0;
    //     end else if(ar_cross_4k_boundary | r_misrouting) begin
    //         o_arvalid_reg[0] <= 'b0;
    //         o_arvalid_reg[1] <= 'b0;
    //         o_arvalid_reg[2] <= 'b0;
    //     end else if(slv_ar_targeted[0]) begin
    //         o_arvalid_reg[0] <= i_arvalid;
    //         o_arvalid_reg[1] <= 'b0;
    //         o_arvalid_reg[2] <= 'b0;
    //     end else if(slv_ar_targeted[1]) begin
    //         o_arvalid_reg[0] <= 'b0;
    //         o_arvalid_reg[1] <= i_arvalid;
    //         o_arvalid_reg[2] <= 'b0;
    //     end else if(slv_ar_targeted[2]) begin
    //         o_arvalid_reg[0] <= 'b0;
    //         o_arvalid_reg[1] <= 'b0;
    //         o_arvalid_reg[2] <= i_arvalid;
    //     end else begin
    //         o_arvalid_reg[0] <= 'b0;
    //         o_arvalid_reg[1] <= 'b0;
    //         o_arvalid_reg[2] <= 'b0;            
    //     end
    // end

    // assign o_arvalid = o_arvalid_reg;
    assign o_arvalid[0] = (ar_id_reg != cam_arid) ? 1'b0     : 
                          (ar_cross_4k_boundary)  ? 1'b0     :
                          (r_misrouting)          ? 1'b0     :
                          (slv_ar_targeted[0])    ? i_arvalid:
                                                    1'b0;
    assign o_arvalid[1] = (ar_id_reg != cam_arid) ? 1'b0     : 
                          (ar_cross_4k_boundary)  ? 1'b0     :
                          (r_misrouting)          ? 1'b0     :
                          (slv_ar_targeted[1])    ? i_arvalid:
                                                    1'b0;     

    assign o_arvalid[2] = (ar_id_reg != cam_arid) ? 1'b0     : 
                          (ar_cross_4k_boundary)  ? 1'b0     :
                          (r_misrouting)          ? 1'b0     :
                          (slv_ar_targeted[2])    ? i_arvalid:
                                                    1'b0; 


    //////////////////////////////////////
    //R Channel
    /////////////////////////////////////
    //优先处理mis_route和4k boundary
    sync_fifo #(.ADDR_WIDTH($clog2(MST_OSTDREQ_NUM)),
                .DATA_WIDTH(AXI_ID_W+4))
    rch_error_fifo
               (.aclk(aclk), 
                .aresetn(aresetn), 
                .srst(srst), 
                .data_in(rch_error_info), 
                .push(r_misrouting | ar_cross_4k_boundary), 
                .pull(i_rvalid & i_rready & i_rlast & (!rch_running)),
                .full(rch_error_full), 
                .empty(rch_error_empty), 
                .data_out({rch_error_len, rch_error_id}));

    assign rch_error_info = {i_arch[AXI_ADDR_W+AXI_ID_W +: 4], i_arch[AXI_ADDR_W+:AXI_ID_W]};

    round_arbiter#(.REQ_NB(SLV_NB),
                   .REQ0_PRIORITY(SLV0_PRIORITY),
                   .REQ1_PRIORITY(SLV1_PRIORITY),
                   .REQ2_PRIORITY(SLV2_PRIORITY))
    rch_round_arbiter
                  (.aclk(aclk), 
                   .aresetn(aresetn), 
                   .srst(srst), 
                   .en(rch_en), 
                   .req(rch_req),
                   .grant(rch_grant));

    //正确的信号在传递过程中是会有rch_running拉高的，一次传输完之后才允许错误情况插进来，
    //一旦错误情况插进来则优先处理完错误情况
    always @ (posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            rch_running <= 1'b0;
        end else if (srst) begin
            rch_running <= 1'b0;
        end else begin
            if (rch_running && i_rvalid && i_rready && i_rlast) begin
                rch_running <= 1'b0;
            end else if (rch_error_empty && i_rvalid && !i_rlast) begin
                rch_running <= 1'b1;
            end else begin
                rch_running <= rch_running;
            end
        end
    end

    always @ (posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            rlen <= 8'h0;
        end else if (srst) begin
            rlen <= 8'h0;
        end else begin
            if (rch_error_empty) begin
                rlen <= 8'h0;
            end else if (i_rvalid && i_rready && i_rlast && !rch_running) begin
                rlen <= 8'h0;
            end else begin
                if (i_rvalid && i_rready && !rch_running) begin
                    rlen <= rlen + 1'b1;
                end else begin
                    rlen <= rlen;
                end
            end 
        end
    end

    assign rch_en = i_rvalid & i_rready & rch_running;

    
    assign i_rvalid = (!rch_error_empty && !rch_running) ? 1'b1 :
                                (rch_grant[0]) ? o_rvalid[0] :
                                (rch_grant[1]) ? o_rvalid[1] :
                                (rch_grant[2]) ? o_rvalid[2] :
                                                1'b0;

    assign i_rlast = (!rch_error_empty && !rch_running) ? (rlen==rch_error_len) & i_rvalid & i_rready :
                                                                    (rch_grant[0]) ? o_rlast[0] :
                                                                    (rch_grant[1]) ? o_rlast[1] :
                                                                    (rch_grant[2]) ? o_rlast[2] :
                                                                                    1'b0;

    assign o_rready[0] = rch_grant[0] & i_rready & (rch_error_empty | rch_running);
    assign o_rready[1] = rch_grant[1] & i_rready & (rch_error_empty | rch_running);
    assign o_rready[2] = rch_grant[2] & i_rready & (rch_error_empty | rch_running);


    assign i_rch = (!rch_error_empty && !rch_running) ? {{RCH_W-AXI_ID_W-2{1'b0}}, 2'h3, rch_error_id} :
                                                        (rch_grant[0]) ? o_rch[0*RCH_W+:RCH_W] :
                                                        (rch_grant[1]) ? o_rch[1*RCH_W+:RCH_W] :
                                                        (rch_grant[2]) ? o_rch[2*RCH_W+:RCH_W] :
                                                                            {RCH_W{1'b0}};


endmodule

`resetall