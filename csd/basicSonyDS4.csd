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

kLAX			SonyDS4		4
kLAY			SonyDS4		1

kRAX			SonyDS4		2
kRAY			SonyDS4		3

k1				=				kLAX
k2				=				kLAY

k3				=				kRAX
k4				=				kRAY

printk 0.1, k1
;printk 0.1, k2
;printk 0.1, k3
;printk 0.1, k4

endin

</CsInstruments>
<CsScore>
i 1 0 z
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
