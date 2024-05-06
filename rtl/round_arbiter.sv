`timescale 1ps/1ps
`default_nettype none

module round_arbiter#(parameter REQ_NB = 3,
                    parameter REQ0_PRIORITY = 0,
                    parameter REQ1_PRIORITY = 1,
                    parameter REQ2_PRIORITY = 2)
                   (aclk, aresetn, srst, en, req,
                    grant);
    input  wire aclk;
    input  wire aresetn;
    input  wire srst;
    input  wire en;
    input  wire [REQ_NB - 1 : 0] req;
    output logic [REQ_NB - 1 : 0] grant;

    logic p0_active;
    logic p1_active;
    logic p2_active;

    logic [REQ_NB - 1 : 0] p0_req;
    logic [REQ_NB - 1 : 0] p1_req;
    logic [REQ_NB - 1 : 0] p2_req;

    logic [REQ_NB - 1 : 0] p0_grant;
    logic [REQ_NB - 1 : 0] p1_grant;
    logic [REQ_NB - 1 : 0] p2_grant;


    assign p0_req[0] = (REQ0_PRIORITY == 0) ? req[0] : 0;
    assign p0_req[1] = (REQ1_PRIORITY == 0) ? req[1] : 0;
    assign p0_req[2] = (REQ2_PRIORITY == 0) ? req[2] : 0;

    assign p1_req[0] = (REQ0_PRIORITY == 1) ? req[0] : 0;
    assign p1_req[1] = (REQ1_PRIORITY == 1) ? req[1] : 0;
    assign p1_req[2] = (REQ2_PRIORITY == 1) ? req[2] : 0;

    assign p2_req[0] = (REQ0_PRIORITY == 2) ? req[0] : 0;
    assign p2_req[1] = (REQ1_PRIORITY == 2) ? req[1] : 0;
    assign p2_req[2] = (REQ2_PRIORITY == 2) ? req[2] : 0;

    assign p2_active = |p2_req;
    assign p1_active = (|p1_req) && (!p2_active);
    assign p0_active = (|p0_req) && (!p1_active);

    generate
        if(REQ0_PRIORITY == 0 || REQ1_PRIORITY == 0 || REQ2_PRIORITY == 0) begin : P0_ROUND
            rond_arbiter_core #(.REQ_NB(REQ_NB))
                p0_round_core(.aclk(aclk), 
                              .aresetn(aresetn), 
                              .srst(srst), 
                              .en(en && p0_active), 
                              .req(p0_req),
                              .grant(p0_grant));
        end else begin
            assign p0_grant = {REQ_NB{1'b0}};
        end
    endgenerate

    generate
        if(REQ0_PRIORITY == 1 || REQ1_PRIORITY == 1 || REQ2_PRIORITY == 1) begin : P1_ROUND
            rond_arbiter_core #(.REQ_NB(REQ_NB))
                p1_round_core(.aclk(aclk), 
                              .aresetn(aresetn), 
                              .srst(srst), 
                              .en(en && p1_active), 
                              .req(p1_req),
                              .grant(p1_grant));
        end else begin : SET_P1_ZERO
            assign p1_grant = {REQ_NB{1'b0}};
        end
    endgenerate

    generate
        if(REQ0_PRIORITY == 2 || REQ1_PRIORITY == 2 || REQ2_PRIORITY == 2) begin : P2_ROUND
            rond_arbiter_core #(.REQ_NB(REQ_NB))
                p2_round_core(.aclk(aclk), 
                              .aresetn(aresetn), 
                              .srst(srst), 
                              .en(en && p2_active), 
                              .req(p2_req),
                              .grant(p2_grant));
        end else begin
            assign p2_grant = {REQ_NB{1'b0}};
        end
    endgenerate

    assign grant = (|p2_grant) ? p2_grant :
                   (|p1_grant) ? p1_grant : 
                                 p0_grant ;

endmodule

`resetall       