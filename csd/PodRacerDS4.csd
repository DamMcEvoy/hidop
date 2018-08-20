<CsoundSynthesizer>
<CsOptions>
--opcode-lib=./libhidops.dylib -odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

giTF						   ftgen 0,0,4097,10,ampdbfs(-23),ampdbfs(-18),ampdbfs(-19),ampdbfs(-21),ampdbfs(-28), ampdbfs(-32),ampdbfs(-30),ampdbfs(-29),ampdbfs(-21),ampdbfs(-31),ampdbfs(-37),ampdbfs(-32), ampdbfs(-32),ampdbfs(-38),ampdbfs(-40); supressed harmonic string analysis

instr 1 

kFreq 				=				0
kAmp 					=				0
kLFORate			=				0
kLFODepth		=				0
kCF						=				0

kALY						SonyDS4			1
kL1						SonyDS4			10
kL2Trig			SonyDS4			20
kALX						SonyDS4			0
kARX						SonyDS4			2
kARY						SonyDS4			3
kGRoll				SonyDS4			29
kGYaw					SonyDS4			31

kOct						=					kGYaw
kOct						*=				-1
kOct						+=				0.135							
kOct						*=				4
kOct						+=				0.5
;kOct					+=				1
kOct						portk		kOct, 0.03
outvalue			"meter2", kOct

kPan						=					kGRoll
kPan						/=				0.6							
kPan						*=				-1
kPan						+=				0.5
kPan						portk		kPan, 0.03
outvalue			"meter", kPan

kFreq					=					kALY
kFreq					*=				-1
kFreq					+=				1.5
kFreq					*=				2
kFreq					*=				55
kFreq					portk		kFreq, 0.003
kAmp						=					kL2Trig
kAmp						portk		kAmp, 0.1
kLFORate			=					kALX
kLFORate			*=				9
kLFORate			portk		kLFORate, 0.03
kLFODepth		=					kL1
kLFODepth		portk		kLFODepth, 0.3
kCF						=					kARX

;kCF						+=				1	
kCF						*=				5000
kCF						+=				500			
kRes						=					kARY
kRes						*=				-1
kRes						+=				1
kRes						*=				0.75

	printk				0.1, kGRoll

kLFO						poscil				kLFODepth, kLFORate
aSig						vco2						kAmp+kLFO, kFreq*kOct
								
aSig						moogladder aSig, kCF, kRes

aSig						=								tanh(aSig)

aL, aR				pan2						aSig, kPan

								outs						aL, aR

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
 <bsbObject type="BSBHSlider" version="2">
  <objectName>meter</objectName>
  <x>37</x>
  <y>36</y>
  <width>108</width>
  <height>36</height>
  <uuid>{52ab2686-bfb3-4d83-b704-e4dbcafdf863}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>meter2</objectName>
  <x>11</x>
  <y>8</y>
  <width>20</width>
  <height>100</height>
  <uuid>{e8170c3f-57bb-4347-9422-bf248b3712f4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.70000000</minimum>
  <maximum>1.30000000</maximum>
  <value>1.04000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
