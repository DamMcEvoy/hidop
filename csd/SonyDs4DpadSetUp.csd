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

kHatIn	SonyDS4		4
kSQR			SonyDS4		5
kX				SonyDS4		6
kCir			SonyDS4		7
kTri			SonyDS4		8

kbit1		=					kSQR
kbit2		=					kX
kbit3		=					kCir
kbit4		=					kTri
kbit1		*=				16
kbit2		*=				32
kbit3		*=				64
kbit4		*=				128
 
;kHatOut	=				kHatIn
kHatOut	=				kHatIn-kbit1-kbit2-kbit3-kbit4

printk 0.1, kHatOut

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
