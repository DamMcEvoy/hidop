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
kL2     hidout  08, 00 ;amp

kL2    portk   kL2, 0.005

kFreq   init    0
kFreq   =       kX
kFreq   /=      255
;kFreq                           *=              -1
kFreq                           +=              2
kFreq                           *=              55

kAmp    init    0
kAmp    =       kL2
kAmp    /=      255


   

aSig    poscil  kAmp, kFreq

printk	0.01, kL2

        outs aSig, aSig

endin

</CsInstruments>
<CsScore>
i1 0 z
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
