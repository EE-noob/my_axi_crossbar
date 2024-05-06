`timescale 1ps/1ps
`default_nettype none

module rond_arbiter_core#(parameter REQ_NB = 3)
                       (aclk, aresetn, srst, en, req,
                        grant);
    input  wire aclk;
    input  wire aresetn;
    input  wire srst;
    input  wire en;
    input  wire [REQ_NB - 1 : 0] req;
    output logic [REQ_NB - 1 : 0] grant;

    logic [REQ_NB - 1 : 0] mask;
    logic [REQ_NB - 1 : 0] masked;

    //round arbiter mask 
    //使用并行case语句简化综合后的电路
    always @(posedge aclk or negedge aresetn)begin
        if(!aresetn) begin
            mask <= {REQ_NB{1'b1}};
        end else if(srst) begin
            mask <= {REQ_NB{1'b1}};
        end else begin
            if(en && |grant) begin
                case(grant)
                    3'b001 : mask <= 3'b110;
                    3'b010 : mask <= 3'b100;
                    3'b100 : mask <= 3'b111;
                    default: mask <= mask;
                endcase
            end else begin
                mask <= mask;
            end
        end
    end

    //generate grant by mask and req
    //使用串行语句保证优先级
    always @(*) begin
        masked = mask & req;

        if(|masked) begin
            if (masked[0]) begin
                grant = 3'b001;
            end else if (masked[1]) begin
                grant = 3'b010;
            end else if (masked[2]) begin
                grant = 3'b100;
            end
        end else begin
            if (req[0]) begin
                grant = 3'b001;
            end else if (req[1]) begin
                grant = 3'b010;
            end else if (req[2]) begin
                grant = 3'b100;
            end else begin
                grant = 3'b000;
            end
        end
    end

endmodule

`resetall       