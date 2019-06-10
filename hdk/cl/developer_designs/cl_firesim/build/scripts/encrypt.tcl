# Amazon FPGA Hardware Development Kit
#
# Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License"). You may not use
# this file except in compliance with the License. A copy of the License is
# located at
#
#    http://aws.amazon.com/asl/
#
# or in the "license" file accompanying this file. This file is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
# implied. See the License for the specific language governing permissions and
# limitations under the License.

# TODO:
# Add check if CL_DIR and HDK_SHELL_DIR directories exist
# Add check if /build and /build/src_port_encryption directories exist
# Add check if the vivado_keyfile exist

set HDK_SHELL_DIR $::env(HDK_SHELL_DIR)
set HDK_SHELL_DESIGN_DIR $::env(HDK_SHELL_DESIGN_DIR)
set CL_DIR $::env(CL_DIR)

set TARGET_DIR $CL_DIR/build/src_post_encryption
set UNUSED_TEMPLATES_DIR $HDK_SHELL_DESIGN_DIR/interfaces


# Remove any previously encrypted files, that may no longer be used
if {[llength [glob -nocomplain -dir $TARGET_DIR *]] != 0} {
  eval file delete -force [glob $TARGET_DIR/*]
}

#---- Developr would replace this section with design files ----

## Change file names and paths below to reflect your CL area.  DO NOT include AWS RTL files.
file copy -force $CL_DIR/design/cl_firesim_defines.vh                 $TARGET_DIR
file copy -force $CL_DIR/design/cl_firesim_generated_defines.vh       $TARGET_DIR
file copy -force $CL_DIR/design/ila_files/firesim_ila_insert_inst.v   $TARGET_DIR
file copy -force $CL_DIR/design/ila_files/firesim_ila_insert_ports.v  $TARGET_DIR
file copy -force $CL_DIR/design/ila_files/firesim_ila_insert_wires.v  $TARGET_DIR
file copy -force $CL_DIR/design/cl_id_defines.vh                      $TARGET_DIR
file copy -force $CL_DIR/design/cl_firesim.sv                         $TARGET_DIR 
file copy -force $CL_DIR/design/cl_firesim_generated.sv               $TARGET_DIR 
file copy -force $CL_DIR/../common/design/cl_common_defines.vh        $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/CKLNQD12.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsp_80x65.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_unpack.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/NV_CLK_gate_power.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/NV_BLKBOX_SINK.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/p_SSYNC3DO_C_PPP.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsp_80x14.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsp_160x65.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsp_160x16.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsp_128x11.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/include/simulate_x_tick.vh $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_XXIF_libs.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_EG_ro.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_EG_dout.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_EG_din.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_EG_cmd.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_sync2data.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_relu.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_prelu.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/NV_NVDLA_HLS_shiftrightsatsu.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/NV_NVDLA_HLS_shiftleftsu.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/NV_NVDLA_HLS_saturate.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_DMAIF_rdrsp.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_DMAIF_rdreq.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/NV_NVDLA_HLS_shiftrightsu.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/sync3d_c_ppp.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rws_256x7.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rws_256x3.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rws_128x18.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwst_256x8.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsthp_80x9.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsthp_80x15.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsthp_60x21.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsthp_19x4.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsp_61x65.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsp_128x6.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_DAT_out.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_DAT_in.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_REG_single.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_REG_dual.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_ig.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_eg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_dmaif.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_NRDMA_lat_fifo.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_NRDMA_gate.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_NRDMA_cq.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_ig.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_gate.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_eg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_cq.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_X_int_trt.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_X_int_relu.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_X_int_mul.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_X_int_alu.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_C_int.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_BRDMA_lat_fifo.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_BRDMA_gate.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_BRDMA_cq.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_RDMA_REG_single.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_RDMA_REG_dual.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_CORE_unit1d.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_WRITE_IG_spt.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_WRITE_IG_cvt.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_WRITE_IG_bpt.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_WRITE_IG_arb.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_READ_IG_spt.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_READ_IG_cvt.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_READ_IG_bpt.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_READ_IG_arb.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_RDMA_REG_single.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_RDMA_REG_dual.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_MUL_unit.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_LUT_CTRL_unit.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_INTP_unit.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_IMG_sg2pack_fifo.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_IMG_fifo.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/NV_BLKBOX_SRC0.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/MUX2HDD2.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/int_sum_block_tp1.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/HLS_cdp_ocvt.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/HLS_cdp_icvt.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/p_STRICTSYNC3DOTM_C_PPP.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/p_SSYNC3DO_S_PPP.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/p_SSYNC3DO.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/p_SSYNC2DO_C_PP.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/OR2D1.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/oneHotClk_async_write_clock.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/oneHotClk_async_read_clock.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rws_16x64.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rws_16x272.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rws_16x256.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rwsp_8x65.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/car/NV_NVDLA_sync3d_c.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_intr.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_gate.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_dat.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_cmd.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_REG_single.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_REG_dual.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_pack.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_nrdma.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_mrdma.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_x2_int.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_x1_int.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_c.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_CORE_unpack.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_CORE_pack.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_CORE_gate.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_cmux.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_brdma.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_WDMA_dat.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_WDMA_cmd.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_slcg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_REG_single.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_REG_dual.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_RDMA_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_RDMA_ig.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_RDMA_eg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_RDMA_cq.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_CORE_preproc.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_CORE_cal2d.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_CORE_cal1d.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_WRITE_ig.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_WRITE_eg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_WRITE_cq.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_READ_ig.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_READ_eg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_READ_cq.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_MCIF_CSB_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/glb/NV_NVDLA_GLB_CSB_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_DMAIF_wr.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csc/NV_NVDLA_CSC_WL_dec.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csc/NV_NVDLA_CSC_single_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csc/NV_NVDLA_CSC_SG_wt_fifo.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csc/NV_NVDLA_CSC_SG_dat_fifo.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csc/NV_NVDLA_CSC_dual_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cmac/NV_NVDLA_CMAC_REG_single.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cmac/NV_NVDLA_CMAC_REG_dual.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_slcg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_rt_out.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_rt_in.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_mac.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_cfg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_active.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_slcg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_REG_single.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_REG_dual.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_RDMA_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_RDMA_ig.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_RDMA_eg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_RDMA_cq.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_syncfifo.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_sum.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_mul.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_LUT_ctrl.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_lut.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_intp.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_cvtout.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_cvtin.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_bufferin_tp1.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_WT_fifo.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_single_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_IMG_sg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_IMG_pack.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_IMG_ctrl.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_dual_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_DC_fifo.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_CVT_cell.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cacc/NV_NVDLA_CACC_single_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cacc/NV_NVDLA_CACC_dual_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cacc/NV_NVDLA_CACC_CALC_int8.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/MUX2D4.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/sync_reset.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/sync3d_s_ppp.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/vlibs/sync3d.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/rams/fpga/small_rams/nv_ram_rws_256x64.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_wdma.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_rdma.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_SDP_core.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_wdma.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_rdma.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_nan.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_PDP_core.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_write.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_DRAM_read.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_MCIF_csb.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/glb/NV_NVDLA_GLB_ic.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/glb/NV_NVDLA_GLB_csb.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csc/NV_NVDLA_CSC_wl.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csc/NV_NVDLA_CSC_slcg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csc/NV_NVDLA_CSC_sg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csc/NV_NVDLA_CSC_regfile.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csc/NV_NVDLA_CSC_dl.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csb_master/NV_NVDLA_CSB_MASTER_falcon2csb_fifo.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csb_master/NV_NVDLA_CSB_MASTER_csb2falcon_fifo.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cmac/NV_NVDLA_CMAC_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cmac/NV_NVDLA_CMAC_core.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cfgrom/NV_NVDLA_CFGROM_rom.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_wdma.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_reg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_rdma.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_DP_nan.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_CDP_dp.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_wt.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_status.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_slcg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_shared_buffer.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_regfile.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_img.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_dma_mux.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_dc.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_CDMA_cvt.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cacc/NV_NVDLA_CACC_slcg.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cacc/NV_NVDLA_CACC_regfile.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cacc/NV_NVDLA_CACC_delivery_ctrl.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cacc/NV_NVDLA_CACC_delivery_buffer.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cacc/NV_NVDLA_CACC_calculator.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cacc/NV_NVDLA_CACC_assembly_ctrl.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cacc/NV_NVDLA_CACC_assembly_buffer.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/car/NV_NVDLA_sync3d_s.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/car/NV_NVDLA_sync3d.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/sdp/NV_NVDLA_sdp.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/car/NV_NVDLA_reset.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/pdp/NV_NVDLA_pdp.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/nocif/NV_NVDLA_NOCIF_dram.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/glb/NV_NVDLA_glb.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csc/NV_NVDLA_csc.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/csb_master/NV_NVDLA_csb_master.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/car/NV_NVDLA_core_reset.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cmac/NV_NVDLA_cmac.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cfgrom/NV_NVDLA_cfgrom.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdp/NV_NVDLA_cdp.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cdma/NV_NVDLA_cdma.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cbuf/NV_NVDLA_cbuf.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/cacc/NV_NVDLA_cacc.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/include/NV_HWACC_NVDLA_tick_defines.vh $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/top/NV_NVDLA_partition_p.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/top/NV_NVDLA_partition_o.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/top/NV_NVDLA_partition_m.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/top/NV_NVDLA_partition_c.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/top/NV_NVDLA_partition_a.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/apb2csb/NV_NVDLA_apb2csb.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/vmod/nvdla/top/NV_nvdla.v $TARGET_DIR
file copy -force $CL_DIR/design/nvdla_small/nvdla_small.v $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_apppf_irq_template.inc  $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_cl_sda_template.inc     $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_ddr_a_b_d_template.inc  $TARGET_DIR
# we will use ddr_c unlike hello world:
#file copy -force $UNUSED_TEMPLATES_DIR/unused_ddr_c_template.inc      $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_dma_pcis_template.inc   $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_pcim_template.inc       $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_sh_bar1_template.inc    $TARGET_DIR
file copy -force $UNUSED_TEMPLATES_DIR/unused_flr_template.inc        $TARGET_DIR

#---- End of section replaced by Developr ---



# Make sure files have write permissions for the encryption

exec chmod +w {*}[glob $TARGET_DIR/*]

set TOOL_VERSION $::env(VIVADO_TOOL_VERSION)
set vivado_version [string range [version -short] 0 5]
puts "AWS FPGA: VIVADO_TOOL_VERSION $TOOL_VERSION"
puts "vivado_version $vivado_version"

# encrypt .v/.sv/.vh/inc as verilog files
encrypt -k $HDK_SHELL_DIR/build/scripts/vivado_keyfile_2017_4.txt -lang verilog  [glob -nocomplain -- $TARGET_DIR/*.{v,sv}] [glob -nocomplain -- $TARGET_DIR/*.vh] [glob -nocomplain -- $TARGET_DIR/*.inc]
# encrypt *vhdl files
encrypt -k $HDK_SHELL_DIR/build/scripts/vivado_vhdl_keyfile_2017_4.txt -lang vhdl -quiet [ glob -nocomplain -- $TARGET_DIR/*.vhd? ]
