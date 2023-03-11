vlib work
vlog SPISLAVE.v SPISLAVEtb.sv
vsim -voptargs=+acc work.SPISLAVEtb
add wave *
add wave -position insertpoint  \
sim:/SPISLAVEtb/test/idle \
sim:/SPISLAVEtb/test/chk_cmd \
sim:/SPISLAVEtb/test/write \
sim:/SPISLAVEtb/test/read_addr \
sim:/SPISLAVEtb/test/read_data \
sim:/SPISLAVEtb/test/MOSI \
sim:/SPISLAVEtb/test/SS_n \
sim:/SPISLAVEtb/test/clk \
sim:/SPISLAVEtb/test/rst_n \
sim:/SPISLAVEtb/test/MISO \
sim:/SPISLAVEtb/test/rx_data \
sim:/SPISLAVEtb/test/tx_data \
sim:/SPISLAVEtb/test/rx_valid \
sim:/SPISLAVEtb/test/tx_valid \
sim:/SPISLAVEtb/test/flag \
sim:/SPISLAVEtb/test/mem \
sim:/SPISLAVEtb/test/cs \
sim:/SPISLAVEtb/test/ns \
sim:/SPISLAVEtb/test/count \
sim:/SPISLAVEtb/test/count2 \
sim:/SPISLAVEtb/test/wr_add \
sim:/SPISLAVEtb/test/rd_add 
run -all
#quit -sim