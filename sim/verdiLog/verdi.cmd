debImport "-sv" "-f" "rtl_list.f" "-f" "sim_list.f"
debLoadSimResult /home/ICer/work/my_axi_crossbar/sim/testname.fsdb
wvCreateWindow
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 189285597.341725
wvRestoreSignal -win $_nWave2 \
           "/home/ICer/work/IC_Com_axi_crossbar/sim/signal_debug.rc" \
           -overWriteAutoAlias on -appendSignals on
wvSelectStuckSignals -win $_nWave2
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 -10 242 1758 507
wvResizeWindow -win $_nWave2 -10 20 1758 823
wvSelectStuckSignals -win $_nWave2
wvSelectStuckSignals -win $_nWave2
wvResizeWindow -win $_nWave2 -10 242 1758 507
wvSelectStuckSignals -win $_nWave2
wvSaveSignal -win $_nWave2 "/home/ICer/work/my_axi_crossbar/sim/signal_debug.rc"
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 64339.339886 -snap {("mst0_aw_channel" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 66113.545925 -snap {("mst0_if_aw_async_fifo" 4)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 61629.288903 -snap {("wr_addr_cac" 2)}
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/wr_addr_cac" 9 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 9)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 9)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 8)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 9)}
wvGetSignalOpen -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 10)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/wr_addr_cac" 10 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 10)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 10)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 10)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/wr_addr_cac" 10 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 10)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/wr_addr_cac" 9 )} 
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/wr_addr_cac" 10 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 9)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 8)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 7)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 6)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 5)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 4)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 3)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 3)}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/wr_addr_cac" 6 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 6)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 5)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 4)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 3)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 3)}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 9 )} 
wvSaveSignal -win $_nWave2 "/home/ICer/signal_debug.rc"
wvSaveSignal -win $_nWave2 "/home/ICer/signal_debug.rc"
wvSetCursor -win $_nWave2 134352.239743 -snap {("wr_addr_cac" 7)}
wvSetCursor -win $_nWave2 89509.669520 -snap {("mst0_if_aw_async_fifo" 13)}
wvSaveSignal -win $_nWave2 "/home/ICer/work/my_axi_crossbar/rtl/signal_debug.rc"
wvSelectUserMarker -win $_nWave2 -next
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
srcHBSelect "tb_top.axi_crossbar_top_inst.mst0_if.aw_async_fifo" -win $_nTrace1
srcHBSelect "tb_top.axi_crossbar_top_inst.mst0_if.aw_async_fifo" -win $_nTrace1
srcHBSelect "tb_top.axi_crossbar_top_inst.mst0_if.aw_async_fifo.wr_addr_cac" -win \
           $_nTrace1
srcHBSelect "tb_top.axi_crossbar_top_inst.mst0_if.aw_async_fifo.wr_addr_cac" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_top.axi_crossbar_top_inst.mst0_if.aw_async_fifo.wr_addr_cac" \
           -delim "."
srcHBSelect "tb_top.axi_crossbar_top_inst.mst0_if.aw_async_fifo.wr_addr_cac" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvResizeWindow -win $_nWave2 -10 20 1758 823
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 8
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSearchPrev -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSearchPrev -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 0)}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectGroup -win $_nWave2 {mst0_if_aw_async_fifo}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 0)}
wvSelectGroup -win $_nWave2 {mst0_if_aw_async_fifo}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 2 )} 
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 14 )} 
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 13 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 13)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 13)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram"
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 14)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 14)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/mem\[15:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 14 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 14)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 14)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 14)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/mem\[15:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 14 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 14)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 15)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 15)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 10 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 10)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 10)}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 9 )} 
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 7 )} 
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 5 )} 
wvSetCursor -win $_nWave2 9918.981566 -snap {("mst0_if_aw_async_fifo" 5)}
wvSelectGroup -win $_nWave2 {G3}
wvSelectGroup -win $_nWave2 {G3}
wvRenameGroup -win $_nWave2 {G3} {dual_ram}
wvSetPosition -win $_nWave2 {("dual_ram" 0)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 0)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 15)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 14)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 13)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 12)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 11)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 12)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 13)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 14)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 15)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 15)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 10)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 10)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 15)}
wvSelectGroup -win $_nWave2 {mst0_if_aw_async_fifo/dual_ram}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 0)}
wvMoveSelected -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_top"
wvGetSignalSetScope -win $_nWave2 "/tb_top/axi_crossbar_top_inst"
wvGetSignalSetScope -win $_nWave2 "/tb_top/axi_crossbar_top_inst/mst0_if"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram"
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/mem\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/dual_ram" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_data\[48:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/dual_ram" 1 2 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/mem\[15:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/dual_ram" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_data\[48:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/dual_ram" 1 2 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 15 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 15)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 1)}
wvSelectGroup -win $_nWave2 {mst0_if_aw_async_fifo/dual_ram}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/dual_ram" 1 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 0)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 1)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_top"
wvGetSignalSetScope -win $_nWave2 "/tb_top/axi_crossbar_top_inst"
wvGetSignalSetScope -win $_nWave2 "/tb_top/axi_crossbar_top_inst/mst0_if"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram"
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/dual_ram" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/mem\[15:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_data\[48:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/dual_ram" 2 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/dual_ram" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/mem\[15:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_data\[48:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/dual_ram" 2 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 1)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 0)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 1)}
wvSetCursor -win $_nWave2 17035.302492 -snap {("dual_ram" 2)}
wvSetCursor -win $_nWave2 17035.302492 -snap {("dual_ram" 2)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo/dual_ram" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 0)}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo"
wvSelectGroup -win $_nWave2 {mst0_if_aw_async_fifo}
wvSelectGroup -win $_nWave2 {mst0_if_aw_async_fifo}
wvSelectGroup -win $_nWave2 {mst0_if_aw_async_fifo}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 9992.094452 -snap {("dual_ram" 3)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectGroup -win $_nWave2 {G3}
wvRenameGroup -win $_nWave2 {G3} {mst0_if}
wvSetPosition -win $_nWave2 {("mst0_if" 0)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 0)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 4)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 3)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 1)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/dual_ram" 0)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 14)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 13)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 12)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 11)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 10)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 9)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 8)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 7)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 6)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 5)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 4)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 3)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 1)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 0)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1/mst0_aw_channel" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1/mst0_aw_channel" 8)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 10)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo/wr_addr_cac" 10)}
wvSetPosition -win $_nWave2 {("G1/mst0_aw_channel" 8)}
wvScrollUp -win $_nWave2 3
wvSetPosition -win $_nWave2 {("G1/mst0_if" 0)}
wvMoveSelected -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_top"
wvGetSignalSetScope -win $_nWave2 "/tb_top/axi_crossbar_top_inst"
wvGetSignalSetScope -win $_nWave2 "/tb_top/axi_crossbar_top_inst/mst0_if"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram"
wvGetSignalSetScope -win $_nWave2 "/tb_top/axi_crossbar_top_inst/mst0_if"
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_if" \
}
wvCollapseGroup -win $_nWave2 "G1/mst0_if"
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/axi_crossbar_top_inst/mst0_if/o_awready} \
{/tb_top/axi_crossbar_top_inst/mst0_if/o_awvalid} \
{/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/dual_ram" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/mem\[15:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_data\[48:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G1" 13 14 )} 
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_if" \
}
wvCollapseGroup -win $_nWave2 "G1/mst0_if"
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/axi_crossbar_top_inst/mst0_if/o_awready} \
{/tb_top/axi_crossbar_top_inst/mst0_if/o_awvalid} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_rden} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_wren} \
{/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/dual_ram" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/mem\[15:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_data\[48:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G1" 15 16 )} 
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_if" \
}
wvCollapseGroup -win $_nWave2 "G1/mst0_if"
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/axi_crossbar_top_inst/mst0_if/o_awready} \
{/tb_top/axi_crossbar_top_inst/mst0_if/o_awvalid} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_rden} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_wren} \
{/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/dual_ram" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/mem\[15:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_data\[48:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G1" 15 16 )} 
wvSetPosition -win $_nWave2 {("G1" 16)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 15 16 )} 
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSelectGroup -win $_nWave2 {G1/mst0_if}
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSelectSignal -win $_nWave2 {( "G1" 14 15 16 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvScrollDown -win $_nWave2 8
wvSelectGroup -win $_nWave2 {mst0_if_aw_async_fifo}
wvAddSignal -win $_nWave2 "/tb_top/aclk"
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSelectGroup -win $_nWave2 {mst0_if_aw_async_fifo}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 0)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 1)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 0)}
wvMoveSelected -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_top"
wvGetSignalSetScope -win $_nWave2 "/tb_top/axi_crossbar_top_inst"
wvGetSignalSetScope -win $_nWave2 "/tb_top/axi_crossbar_top_inst/mst0_if"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram"
wvGetSignalSetScope -win $_nWave2 "/tb_top/axi_crossbar_top_inst/mst0_if"
wvGetSignalSetScope -win $_nWave2 \
           "/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo"
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 7 )} 
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 11 )} 
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 11 12 13 14 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 11)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 10)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 9)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 8)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 7)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 6)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 5)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 4)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 3)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 1)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 5)}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 7 )} 
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 8 )} 
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 7 )} 
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 7 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 7)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 8)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 9)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 10)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 11)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 10)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 11)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 11)}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 14 )} 
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 14)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 13)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 12)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 11)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 10)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 9)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 8)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 7)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 6)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 5)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 4)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 3)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 2)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 1)}
wvSetPosition -win $_nWave2 {("mst0_if_aw_async_fifo" 2)}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 4 )} 
wvSetCursor -win $_nWave2 7896.191713 -snap {("mst0_if_aw_async_fifo" 4)}
wvSetCursor -win $_nWave2 11893.029494 -snap {("mst0_if_aw_async_fifo" 3)}
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 12 )} 
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
debReload
wvSetCursor -win $_nWave2 31633.508777 -snap {("G1" 19)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 2 )} 
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 12 )} 
wvSetCursor -win $_nWave2 53918.316501 -snap {("mst0_if_aw_async_fifo" 12)}
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSetPosition -win $_nWave2 {("G1" 13)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 13)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_top/axi_crossbar_top_inst/mst0_if"
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_if" \
}
wvCollapseGroup -win $_nWave2 "G1/mst0_if"
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/axi_crossbar_top_inst/mst0_if/o_awvalid} \
{/tb_top/axi_crossbar_top_inst/mst0_if/o_awch\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_wren} \
{/tb_top/axi_crossbar_top_inst/mst0_if/o_awready} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_rden} \
{/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/dual_ram" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/mem\[15:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_data\[48:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/aclk} \
{/tb_top/aresetn} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_aw_channel" \
{/tb_top/mst0_awvalid} \
{/tb_top/mst0_awready} \
{/tb_top/mst0_awid\[3:0\]} \
{/tb_top/mst0_awaddr\[31:0\]} \
{/tb_top/mst0_awburst\[1:0\]} \
{/tb_top/mst0_awlen\[3:0\]} \
{/tb_top/mst0_awlock\[1:0\]} \
{/tb_top/mst0_awsize\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G1/mst0_if" \
}
wvCollapseGroup -win $_nWave2 "G1/mst0_if"
wvAddSignal -win $_nWave2 -group {"G1" {/tb_top/axi_crossbar_top_inst/mst0_if/o_awvalid} \
{/tb_top/axi_crossbar_top_inst/mst0_if/o_awch\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_wren} \
{/tb_top/axi_crossbar_top_inst/mst0_if/o_awready} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_rden} \
{/tb_top/mst0_bid\[3:0\]} \
{/tb_top/mst0_bready} \
{/tb_top/mst0_wvalid} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/din\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_rstn} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/dout\[48:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_clk} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/empty} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_en} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/rd_rstn} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/dual_ram" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/mem\[15:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/fifo_ram/rd_data\[48:0\]} \
}
wvAddSignal -win $_nWave2 -group {"mst0_if_aw_async_fifo/wr_addr_cac" \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/full_next} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn2\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_gray\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/rd_addr_rsyn1\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr\[3:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_binary_next\[4:0\]} \
{/tb_top/axi_crossbar_top_inst/mst0_if/aw_async_fifo/wr_addr_cac/wr_addr_gray\[4:0\]} \
}
wvCollapseGroup -win $_nWave2 "mst0_if_aw_async_fifo/wr_addr_cac"
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSetPosition -win $_nWave2 {("G1" 14)}
wvGetSignalClose -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1/mst0_if" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1/mst0_if" 0)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetCursor -win $_nWave2 26037.935884 -snap {("G1" 14)}
wvScrollDown -win $_nWave2 6
wvSelectSignal -win $_nWave2 {( "mst0_if_aw_async_fifo" 5 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
