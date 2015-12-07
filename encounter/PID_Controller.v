// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.4
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ===========================================================

//`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="PID_Controller,hls_ip_2014_4,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=17.025625,HLS_SYN_LAT=4,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=2,HLS_SYN_FF=306,HLS_SYN_LUT=638}" *)

module PID_Controller (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        InitN,
        coeff_0_V,
        coeff_1_V,
        coeff_2_V,
        coeff_3_V,
        coeff_4_V,
        coeff_5_V,
        din_0_V,
        din_1_V,
        dout_0_V,
        dout_1_V,
        ap_ce
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 5'b1;
parameter    ap_ST_st2_fsm_1 = 5'b10;
parameter    ap_ST_st3_fsm_2 = 5'b100;
parameter    ap_ST_st4_fsm_3 = 5'b1000;
parameter    ap_ST_st5_fsm_4 = 5'b10000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv25_0 = 25'b0000000000000000000000000;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv32_F = 32'b1111;
parameter    ap_const_lv32_27 = 32'b100111;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   InitN;
input  [24:0] coeff_0_V;
input  [24:0] coeff_1_V;
input  [24:0] coeff_2_V;
input  [24:0] coeff_3_V;
input  [24:0] coeff_4_V;
input  [24:0] coeff_5_V;
input  [24:0] din_0_V;
input  [24:0] din_1_V;
output  [24:0] dout_0_V;
output  [24:0] dout_1_V;
input   ap_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[24:0] dout_1_V;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm = 5'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_21;
reg   [24:0] prev_yi_V = 25'b0000000000000000000000000;
reg   [24:0] prev_x2_V = 25'b0000000000000000000000000;
reg   [24:0] prev_x1_V = 25'b0000000000000000000000000;
reg   [24:0] prev_yd_V = 25'b0000000000000000000000000;
wire  signed [49:0] OP2_V_fu_204_p1;
reg  signed [49:0] OP2_V_reg_392;
wire   [24:0] grp_fu_154_p4;
reg   [24:0] p_Val2_5_reg_397;
reg   [24:0] pid_mult2_V_reg_403;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_65;
wire   [24:0] p_Val2_10_fu_277_p2;
reg   [24:0] p_Val2_10_reg_409;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_bdd_75;
wire   [24:0] pid_addsub2_V_fu_288_p2;
reg   [24:0] pid_addsub2_V_reg_414;
wire   [24:0] tmp_V_fu_352_p3;
reg   [24:0] tmp_V_reg_421;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_bdd_87;
wire   [0:0] tmp_9_fu_359_p2;
reg   [0:0] tmp_9_reg_426;
wire   [24:0] p_Val2_15_fu_324_p3;
wire   [24:0] e_V_1_fu_190_p3;
reg   [24:0] dout_1_V_preg = 25'b0000000000000000000000000;
reg    ap_sig_cseq_ST_st5_fsm_4;
reg    ap_sig_bdd_116;
reg  signed [24:0] grp_fu_134_p0;
wire  signed [49:0] OP2_V_1_fu_267_p1;
reg  signed [24:0] grp_fu_134_p1;
wire  signed [49:0] OP1_V_fu_199_p1;
wire  signed [49:0] OP1_V_1_fu_209_p1;
wire  signed [49:0] OP1_V_2_fu_262_p1;
wire  signed [49:0] OP1_V_3_fu_331_p1;
wire  signed [49:0] grp_fu_134_p2;
wire   [24:0] pid_addsub_V_fu_164_p2;
wire   [0:0] tmp_6_fu_170_p2;
wire   [0:0] tmp_7_fu_184_p2;
wire   [24:0] e_V_fu_176_p3;
wire   [0:0] p_Val2_12_fu_230_p0;
wire   [0:0] p_Val2_9_fu_238_p0;
wire   [0:0] p_Val2_6_fu_246_p0;
wire   [0:0] prev_yd_V_load_s_fu_254_p0;
wire   [24:0] prev_yd_V_load_s_fu_254_p3;
wire   [24:0] p_Val2_6_fu_246_p3;
wire   [24:0] p_Val2_7_fu_272_p2;
wire   [24:0] p_Val2_12_fu_230_p3;
wire   [24:0] tmp_fu_283_p2;
wire   [24:0] p_Val2_9_fu_238_p3;
wire   [0:0] tmp_1_fu_310_p2;
wire   [0:0] tmp_2_fu_320_p2;
wire   [24:0] yi_V_fu_314_p3;
wire   [24:0] tmp1_fu_336_p2;
wire   [24:0] pid_addsub2_V_1_fu_341_p2;
wire   [0:0] tmp_4_fu_347_p2;
reg   [4:0] ap_NS_fsm;




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

/// dout_1_V_preg assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_dout_1_V_preg
    if (ap_rst == 1'b1) begin
        dout_1_V_preg <= ap_const_lv25_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & (ap_const_logic_1 == ap_ce) & ~(ap_start == ap_const_logic_0))) begin
            dout_1_V_preg <= e_V_1_fu_190_p3;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & (ap_const_logic_1 == ap_ce) & ~(ap_start == ap_const_logic_0))) begin
        OP2_V_reg_392 <= OP2_V_fu_204_p1;
        p_Val2_5_reg_397 <= {{grp_fu_134_p2[ap_const_lv32_27 : ap_const_lv32_F]}};
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2))) begin
        p_Val2_10_reg_409 <= p_Val2_10_fu_277_p2;
        pid_addsub2_V_reg_414 <= pid_addsub2_V_fu_288_p2;
        prev_x1_V <= p_Val2_5_reg_397;
        prev_x2_V <= pid_mult2_V_reg_403;
        prev_yd_V <= p_Val2_10_fu_277_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1))) begin
        pid_mult2_V_reg_403 <= {{grp_fu_134_p2[ap_const_lv32_27 : ap_const_lv32_F]}};
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3))) begin
        prev_yi_V <= p_Val2_15_fu_324_p3;
        tmp_9_reg_426 <= tmp_9_fu_359_p2;
        tmp_V_reg_421 <= tmp_V_fu_352_p3;
    end
end

/// ap_done assign process. ///
always @ (ap_ce or ap_sig_cseq_ST_st5_fsm_4)
begin
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4))) begin
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
always @ (ap_ce or ap_sig_cseq_ST_st5_fsm_4)
begin
    if (((ap_const_logic_1 == ap_ce) & (ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st1_fsm_0 assign process. ///
always @ (ap_sig_bdd_21)
begin
    if (ap_sig_bdd_21) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st2_fsm_1 assign process. ///
always @ (ap_sig_bdd_65)
begin
    if (ap_sig_bdd_65) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st3_fsm_2 assign process. ///
always @ (ap_sig_bdd_75)
begin
    if (ap_sig_bdd_75) begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st4_fsm_3 assign process. ///
always @ (ap_sig_bdd_87)
begin
    if (ap_sig_bdd_87) begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st5_fsm_4 assign process. ///
always @ (ap_sig_bdd_116)
begin
    if (ap_sig_bdd_116) begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_0;
    end
end

/// dout_1_V assign process. ///
always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0 or ap_ce or e_V_1_fu_190_p3 or dout_1_V_preg)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & (ap_const_logic_1 == ap_ce) & ~(ap_start == ap_const_logic_0))) begin
        dout_1_V = e_V_1_fu_190_p3;
    end else begin
        dout_1_V = dout_1_V_preg;
    end
end

/// grp_fu_134_p0 assign process. ///
always @ (ap_sig_cseq_ST_st1_fsm_0 or OP2_V_fu_204_p1 or OP2_V_reg_392 or ap_sig_cseq_ST_st2_fsm_1 or ap_sig_cseq_ST_st3_fsm_2 or ap_sig_cseq_ST_st4_fsm_3 or OP2_V_1_fu_267_p1)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        grp_fu_134_p0 = OP2_V_1_fu_267_p1;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) | (ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3))) begin
        grp_fu_134_p0 = OP2_V_reg_392;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) begin
        grp_fu_134_p0 = OP2_V_fu_204_p1;
    end else begin
        grp_fu_134_p0 = 'bx;
    end
end

/// grp_fu_134_p1 assign process. ///
always @ (ap_sig_cseq_ST_st1_fsm_0 or ap_sig_cseq_ST_st2_fsm_1 or ap_sig_cseq_ST_st3_fsm_2 or ap_sig_cseq_ST_st4_fsm_3 or OP1_V_fu_199_p1 or OP1_V_1_fu_209_p1 or OP1_V_2_fu_262_p1 or OP1_V_3_fu_331_p1)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        grp_fu_134_p1 = OP1_V_3_fu_331_p1;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        grp_fu_134_p1 = OP1_V_2_fu_262_p1;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        grp_fu_134_p1 = OP1_V_1_fu_209_p1;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) begin
        grp_fu_134_p1 = OP1_V_fu_199_p1;
    end else begin
        grp_fu_134_p1 = 'bx;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_start or ap_CS_fsm or ap_ce)
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
            ap_NS_fsm = ap_ST_st3_fsm_2;
        end
        ap_ST_st3_fsm_2 : 
        begin
            ap_NS_fsm = ap_ST_st4_fsm_3;
        end
        ap_ST_st4_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st5_fsm_4;
        end
        ap_ST_st5_fsm_4 : 
        begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign OP1_V_1_fu_209_p1 = $signed(coeff_0_V);
assign OP1_V_2_fu_262_p1 = $signed(coeff_2_V);
assign OP1_V_3_fu_331_p1 = $signed(coeff_3_V);
assign OP1_V_fu_199_p1 = $signed(coeff_1_V);
assign OP2_V_1_fu_267_p1 = $signed(prev_yd_V_load_s_fu_254_p3);
assign OP2_V_fu_204_p1 = $signed(e_V_1_fu_190_p3);

/// ap_sig_bdd_116 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_116 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_4]);
end

/// ap_sig_bdd_21 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_21 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_65 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_65 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

/// ap_sig_bdd_75 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_75 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end

/// ap_sig_bdd_87 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_87 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end
assign dout_0_V = ((tmp_9_reg_426)? coeff_5_V: tmp_V_reg_421);
assign e_V_1_fu_190_p3 = ((tmp_7_fu_184_p2)? coeff_5_V: e_V_fu_176_p3);
assign e_V_fu_176_p3 = ((tmp_6_fu_170_p2)? coeff_4_V: pid_addsub_V_fu_164_p2);
assign grp_fu_134_p2 = ($signed(grp_fu_134_p0) * $signed(grp_fu_134_p1));
assign grp_fu_154_p4 = {{grp_fu_134_p2[ap_const_lv32_27 : ap_const_lv32_F]}};
assign p_Val2_10_fu_277_p2 = (p_Val2_7_fu_272_p2 - grp_fu_154_p4);
assign p_Val2_12_fu_230_p0 = InitN;
assign p_Val2_12_fu_230_p3 = ((p_Val2_12_fu_230_p0)? prev_yi_V: ap_const_lv25_0);
assign p_Val2_15_fu_324_p3 = ((tmp_2_fu_320_p2)? coeff_5_V: yi_V_fu_314_p3);
assign p_Val2_6_fu_246_p0 = InitN;
assign p_Val2_6_fu_246_p3 = ((p_Val2_6_fu_246_p0)? prev_x1_V: ap_const_lv25_0);
assign p_Val2_7_fu_272_p2 = (p_Val2_5_reg_397 - p_Val2_6_fu_246_p3);
assign p_Val2_9_fu_238_p0 = InitN;
assign p_Val2_9_fu_238_p3 = ((p_Val2_9_fu_238_p0)? prev_x2_V: ap_const_lv25_0);
assign pid_addsub2_V_1_fu_341_p2 = (tmp1_fu_336_p2 + p_Val2_15_fu_324_p3);
assign pid_addsub2_V_fu_288_p2 = (tmp_fu_283_p2 + p_Val2_9_fu_238_p3);
assign pid_addsub_V_fu_164_p2 = (din_0_V - din_1_V);
assign prev_yd_V_load_s_fu_254_p0 = InitN;
assign prev_yd_V_load_s_fu_254_p3 = ((prev_yd_V_load_s_fu_254_p0)? prev_yd_V: ap_const_lv25_0);
assign tmp1_fu_336_p2 = (p_Val2_10_reg_409 + grp_fu_154_p4);
assign tmp_1_fu_310_p2 = ($signed(pid_addsub2_V_reg_414) > $signed(coeff_4_V)? 1'b1: 1'b0);
assign tmp_2_fu_320_p2 = ($signed(pid_addsub2_V_reg_414) < $signed(coeff_5_V)? 1'b1: 1'b0);
assign tmp_4_fu_347_p2 = ($signed(pid_addsub2_V_1_fu_341_p2) > $signed(coeff_4_V)? 1'b1: 1'b0);
assign tmp_6_fu_170_p2 = ($signed(pid_addsub_V_fu_164_p2) > $signed(coeff_4_V)? 1'b1: 1'b0);
assign tmp_7_fu_184_p2 = ($signed(pid_addsub_V_fu_164_p2) < $signed(coeff_5_V)? 1'b1: 1'b0);
assign tmp_9_fu_359_p2 = ($signed(pid_addsub2_V_1_fu_341_p2) < $signed(coeff_5_V)? 1'b1: 1'b0);
assign tmp_V_fu_352_p3 = ((tmp_4_fu_347_p2)? coeff_4_V: pid_addsub2_V_1_fu_341_p2);
assign tmp_fu_283_p2 = (pid_mult2_V_reg_403 + p_Val2_12_fu_230_p3);
assign yi_V_fu_314_p3 = ((tmp_1_fu_310_p2)? coeff_4_V: pid_addsub2_V_reg_414);


endmodule //PID_Controller

