# ALU Design Configuration
set ::env(DESIGN_NAME) alu
set ::env(VERILOG_FILES) "src/*.v"
set ::env(CLOCK_PERIOD) 10
set ::env(CLOCK_PORT) "clk"
set ::env(PL_RANDOM_GLB_PLACEMENT) 1
set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0 0 100 100"
set ::env(PL_TARGET_DENSITY) 0.75
set ::env(FP_PDN_AUTO_ADJUST) 0
set ::env(FP_PDN_VPITCH) 25
set ::env(FP_PDN_HPITCH) 25
set ::env(FP_PDN_VOFFSET) 5
set ::env(FP_PDN_HOFFSET) 5
set ::env(DIODE_INSERTION_STRATEGY) 3
set ::env(FP_PIN_ORDER_CFG) "dir::pin_order.cfg"


set ::env(FP_CORE_UTIL) 45
set ::env(MAX_FANOUT_CONSTRAINT) 5
