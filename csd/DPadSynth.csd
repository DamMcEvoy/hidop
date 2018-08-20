/*----------------------
1 =				A3					220.00 |
2 =				B3					246.94 |
3 =				C#4/Db4 	277.18	|
4 =				D4					293.66	|
5 =				E4					329.63	|
6 =				F#4/Gb4 	369.99	|
7 =				G#4/Ab4 	415.30	|
8 =				A4					440.00	|
----------------------*/

<CsoundSynthesizer>
<Cabbage>
<CsOptions>
--opcode-lib=./libhidops.dylib -odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1

kHat  	SonyDS4		4
kSQR			SonyDS4		5
kX				SonyDS4		6
kCir			SonyDS4		7
kTri			SonyDS4		8

kbit1		=				kSQR
kbit2		=				kX
kbit3		=				kCir
kbit4		=				kTri
kbit1		*=				16
kbit2		*=				32
kbit3		*=				64
kbit4		*=				128
 
kOct			=							kHat-kbit1-kbit2-kbit3-kbit4
kOct 		+= 					1

kL1			SonyDS4		10
k2oct		=							kL1
if (kL1) >=	2	then
k2oct /= k2oct
endif
k2oct		+=						1

kL2Trig SonyDS4		20
kAmp			=							kL2Trig
kAmp			portk				kAmp, 0.01

kRAX			SonyDS4		2
kcf			=							kRAX
kcf			*=						5000
kcf			+=						250
kcf			portk				kcf, 0.01

kRAY			SonyDS4		3
kres			=							kRAY
kres			*=						-1
kres			+=						1
kres			=							tanh(kres)
kFreq		init 				0

kR2Trig SonyDS4		13
kLFOAmp =							kR2Trig
kLFOAmp	=							tanh(kLFOAmp)
kLFOAmp	portk				kLFOAmp, 0.01

kGYaw					SonyDS4			30
kLFORate			=					kGYaw
kLFORate			*=				-1
kLFORate			+=				0.135							
kLFORate			*=				40
kLFORate			+=				0.5

if  (kOct) = 9 then
kFreq 			=					0
elseif (kOct) == 1 then
kFreq 			=					220
elseif (kOct) == 2 then
kFreq 			=					246.94
elseif (kOct) == 3 then
kFreq 			=					277.18
elseif (kOct) == 4 then
kFreq 			=					293.66
elseif (kOct) == 5 then
kFreq 			=					329.63
elseif (kOct) == 6 then
kFreq 			=					369.99
elseif (kOct) == 7 then
kFreq 			=					415.30
elseif (kOct) == 8 then
kFreq 			=					440
endif

kFreq					*=				k2oct

;printk 0.1, kFreq


kFreq					portk		kFreq, 0.01

								outvalue			"pitch", kFreq
								outvalue			"Amplitude", kAmp
								outvalue			"kcf", kcf
								outvalue			"kres", kres
								
kLFO						poscil 			kLFOAmp, kLFORate

aSig  				vco2	 						kAmp+kLFO, kFreq, 12
aSig						moogladder2 	aSig, kcf, kres
aSig						=									tanh(aSig)
								outs 						aSig, aSig
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
 <bsbObject version="2" type="BSBController">
  <objectName>hor1</objectName>
  <x>43</x>
  <y>19</y>
  <width>42</width>
  <height>209</height>
  <uuid>{ced4a5a3-d541-416a-91e0-0d9c8905ffde}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>Amplitude</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>hor1</objectName>
  <x>96</x>
  <y>18</y>
  <width>42</width>
  <height>209</height>
  <uuid>{36d20d4a-e71d-470e-92b6-6e1ffba19795}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>pitch</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>55.00000000</yMin>
  <yMax>1000.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>252</r>
   <g>1</g>
   <b>7</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>hor1</objectName>
  <x>160</x>
  <y>18</y>
  <width>42</width>
  <height>209</height>
  <uuid>{ec9c8de6-1f4d-4d49-97ee-24240ec92c07}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>kcf</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>250.00000000</yMin>
  <yMax>5500.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>2740.19607843</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>255</g>
   <b>10</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>hor1</objectName>
  <x>213</x>
  <y>17</y>
  <width>42</width>
  <height>209</height>
  <uuid>{c363459f-347d-42b5-bcef-63c884330d30}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>kres</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>0.99000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.46057371</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>128</r>
   <g>0</g>
   <b>255</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>48</x>
  <y>232</y>
  <width>32</width>
  <height>25</height>
  <uuid>{085d32e0-643f-46f8-92dc-2be1a3da36c7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Amp</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>102</x>
  <y>231</y>
  <width>32</width>
  <height>25</height>
  <uuid>{91dd082f-9b55-46b2-8fe3-c9964d3dc850}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>FRQ</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>166</x>
  <y>232</y>
  <width>32</width>
  <height>25</height>
  <uuid>{176b3166-ef43-486d-947f-7a7252a0003b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CF</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>217</x>
  <y>231</y>
  <width>32</width>
  <height>25</height>
  <uuid>{939c3130-e67c-4420-b1a0-7d23f8c78197}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>RES</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
