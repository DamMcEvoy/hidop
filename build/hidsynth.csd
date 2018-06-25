<CsoundSynthesizer>
<CsOptions>
--opcode-lib=./libhidops.dylib -odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1

kX      init   0
kL2     init   0

kX      hidout  01, 00 ;freq
kL2     hidout  08, 00 ;freq

kX      /=      255
kX      *=      1000
kX      portk   kX, 0.003

kL2     /=      255
kL2     portk   kL2, 0.003

;kFreq   init    0
;kFreq   =       kX
;kFreq   /=      255
;kFreq   *=      1000
;
;kAmp    init    0
;kAmp    =       kL2
;kAmp    /=      255
;
;kAmp    portk   kAmp, 0.003
   

aSig    poscil  kL2, kX

printk	0.01, kL2

        outs aSig, aSig

endin

</CsInstruments>
<CsScore>
i1 0 z
</CsScore>
</CsoundSynthesizer>