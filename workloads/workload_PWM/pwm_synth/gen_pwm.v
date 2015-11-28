// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.4
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="gen_pwm,hls_ip_2014_4,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.518000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=33,HLS_SYN_LUT=145}" *)

module gen_pwm (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        duty,
        freq,
        out_r,
        out_r_ap_vld,
        ap_ce
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 2'b1;
parameter    ap_ST_st2_fsm_1 = 2'b10;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv31_0 = 31'b0000000000000000000000000000000;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv31_1 = 31'b1;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] duty;
input  [31:0] freq;
output  [7:0] out_r;
output   out_r_ap_vld;
input   ap_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out_r_ap_vld;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm = 2'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_18;
wire   [30:0] i_1_fu_60_p2;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_47;
reg   [30:0] i_reg_39;
wire   [0:0] tmp_fu_55_p2;
wire   [31:0] i_cast_fu_51_p1;
wire   [0:0] tmp_1_fu_66_p2;
reg   [1:0] ap_NS_fsm;
reg    ap_sig_bdd_36;
reg    ap_sig_bdd_91;




/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        if ((ap_const_logic_1 == ap_ce)) begin
            ap_CS_fsm <= ap_NS_fsm;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_const_logic_1 == ap_ce)) begin
        if (ap_sig_bdd_91) begin
            i_reg_39 <= i_1_fu_60_p2;
        end else if (ap_sig_bdd_36) begin
            i_reg_39 <= ap_const_lv31_0;
        end
    end
end

/// ap_done assign process. ///
always @ (ap_ce or ap_sig_cseq_ST_st2_fsm_1 or tmp_fu_55_p2)
begin
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (tmp_fu_55_p2 == ap_const_lv1_0))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0)
begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// ap_ready assign process. ///
always @ (ap_ce or ap_sig_cseq_ST_st2_fsm_1 or tmp_fu_55_p2)
begin
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (tmp_fu_55_p2 == ap_const_lv1_0))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st1_fsm_0 assign process. ///
always @ (ap_sig_bdd_18)
begin
    if (ap_sig_bdd_18) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st2_fsm_1 assign process. ///
always @ (ap_sig_bdd_47)
begin
    if (ap_sig_bdd_47) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

/// out_r_ap_vld assign process. ///
always @ (ap_ce or ap_sig_cseq_ST_st2_fsm_1 or tmp_fu_55_p2)
begin
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(tmp_fu_55_p2 == ap_const_lv1_0))) begin
        out_r_ap_vld = ap_const_logic_1;
    end else begin
        out_r_ap_vld = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_start or ap_CS_fsm or ap_ce or tmp_fu_55_p2)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (((ap_const_logic_1 == ap_ce) & ~(ap_start == ap_const_logic_0))) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (((ap_const_logic_1 == ap_ce) & (tmp_fu_55_p2 == ap_const_lv1_0))) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end


/// ap_sig_bdd_18 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_18 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_36 assign process. ///
always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0)
begin
    ap_sig_bdd_36 = ((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0));
end

/// ap_sig_bdd_47 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_47 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

/// ap_sig_bdd_91 assign process. ///
always @ (ap_sig_cseq_ST_st2_fsm_1 or tmp_fu_55_p2)
begin
    ap_sig_bdd_91 = ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(tmp_fu_55_p2 == ap_const_lv1_0));
end
assign i_1_fu_60_p2 = (i_reg_39 + ap_const_lv31_1);
assign i_cast_fu_51_p1 = i_reg_39;
assign out_r = tmp_1_fu_66_p2;
assign tmp_1_fu_66_p2 = ($signed(i_cast_fu_51_p1) < $signed(duty)? 1'b1: 1'b0);
assign tmp_fu_55_p2 = ($signed(i_cast_fu_51_p1) < $signed(freq)? 1'b1: 1'b0);


endmodule //gen_pwm

