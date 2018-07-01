<Cabbage> bounds(0, 0, 0, 0)
form caption("HID File Player") size(415,450), pluginid("HID File Player")

hmeter bounds(12, 216, 390, 13) channel("Write") overlaycolour("silver") metercolour:0("grey") 

hmeter bounds(12, 238, 390, 13) channel("Read") overlaycolour("grey") metercolour:0("silver") 
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
--opcode-lib=./libhidops.dylib -n
</CsOptions>
<CsInstruments>

instr 1
hidprint 
endin

</CsInstruments>
<CsScore>
i1 0 0
</CsScore>
</CsoundSynthesizer>