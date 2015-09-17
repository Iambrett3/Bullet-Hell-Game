`define smem_Abits 17 //12
`define smem_Nloc 76800 //1200
`define smem_Dbits 4 //character code length 4

`define kmem_Dbits 24

`define dmem_Abits 17 //12
`define dmem_Nloc  8192 //32
`define dmem_Dbits 32 //32

`define bmem_Abits 6 //12
`define bmem_Nloc  40 //number of pixels among all characters (9*4) //1024
`define bmem_Dbits 12 //rgb color code 12

`define imem_Abits 13 //32
`define imem_Nloc  8192 //32
`define imem_Dbits 32 //32

//display 640x480 header
`define WholeLine  800   // x lies in [0..WholeLine-1]
`define WholeFrame 525   // y lies in [0..WholeFrame-1]

`define xbits $clog2(`WholeLine)  // how many bits needed to count x?
`define ybits $clog2(`WholeFrame) // how many bits needed to count y?


`define hFrontPorch 16
`define hBackPorch 48
`define hSyncPulse 96
`define vFrontPorch 10
`define vBackPorch 33
`define vSyncPulse 2

`define hSyncPolarity 1'b1
`define vSyncPolarity 1'b1

`define hSyncStart (`WholeLine - `hBackPorch - `hSyncPulse)
`define hSyncEnd (`hSyncStart + `hSyncPulse - 1)
`define vSyncStart (`WholeFrame - `vBackPorch - `vSyncPulse)
`define vSyncEnd (`vSyncStart + `vSyncPulse - 1)

`define hVisible (`WholeLine  - `hFrontPorch - `hSyncPulse - `hBackPorch)
`define vVisible (`WholeFrame - `vFrontPorch - `vSyncPulse - `vBackPorch)