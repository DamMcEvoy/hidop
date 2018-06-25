<CsoundSynthesizer>
<CsOptions>
--opcode-lib=./libhidops.dylib -odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 16
nchnls = 2
0dbfs = 1

instr 1

kFreq   init    0

kFreq   hidout  01, 00 ;freq
;kFreq   /=      255

;kFreq   *=      10

;kAmp    hidout  08, 00 ;amp

printk	0.01, kFreq

endin

</CsInstruments>
<CsScore>
i1 0 z
</CsScore>
</CsoundSynthesizer>