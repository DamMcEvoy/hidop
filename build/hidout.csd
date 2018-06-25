<CsoundSynthesizer>
<CsOptions>
--opcode-lib=./libhidops.dylib -odac
</CsOptions>
<CsInstruments>

instr 1
k1 hidout 01, 00

printk	0.1, k1

endin

</CsInstruments>
<CsScore>
i1 0 z
</CsScore>
</CsoundSynthesizer>