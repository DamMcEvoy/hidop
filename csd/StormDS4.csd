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

kR1						SonyDS4			11

kInput1			=								kR1

printk 0.1, kInput1 

kTrigOn trigger kInput1, 0.5, 0
kTrigOff trigger kInput1, 0.5, 0

if (kTrigOn == 1) then
		event "i", 4.06, 0, 20
		
elseif (kTrigOff == 1) then
		turnoff2 4.06, 0, 1 

endif

endin

instr 2 ;wind 

kFreq 				=								0
kAmp 					=								0
kPan 					=								0
kL2Trig			SonyDS4			20
kGRoll				SonyDS4			29
kGYaw					SonyDS4			31

kPan						=								kGRoll
kPan						/=							0.6							
kPan						*=							-1
kPan						+=							0.5
kPan						portk					kPan, 0.03
								outvalue			"meter", kPan

kFreq					=								kGYaw
kFreq					*=							-1
kFreq					=								((kFreq+0.14)*3)*1500
kFreq					portk					kFreq, 0.03
								outvalue			"meter2", kFreq

kAmp						=								kL2Trig
kAmp						portk					kAmp, 0.1
								outvalue			"meter3", kAmp

awhite				unirand 			2.0
awhite				-=							1.0				
aSig						pinkish 			awhite*kAmp, 1, 0, 0, 1
aSig						butbp					aSig, kFreq, kFreq*0.1
aSig						butlp 				aSig, kFreq*2
aL, aR				pan2						aSig, kPan

								outs						aL, aR

endin

instr 3 ;rain

kAmp						=								0
kDensity			=								0

kR2Trig			SonyDS4			21
kARY						SonyDS4			3

kAmp						=								kR2Trig
kAmp						portk					kAmp, 0.03

kDensity			=								kARY
kDensity			=								(kDensity*(-1))+1
kDensity			*=							150

aSig					 	dust2 				kAmp, kDensity
aSig						lpf18					aSig, 1000, 0, 0
aSig						buthp					aSig, 100
aSig						*=							2
								outs						aSig,	aSig
endin

instr 4; thunder

kAmp						=								0
kFreq					=								100
kLFODepth		=								0.1
kLFORate			=								0.1
kEnv						expseg				0.01, 0.01, 1, 0.001, 0.01
kFreq					expseg				0.01, 0.01, 1000, 0.001, 0.01

kLFO						poscil	 			kLFODepth, kLFORate
aSig						vco2	 					(1*kEnv), kFreq
aSig						lpf18					aSig, 1000, 0, 0
aSig						vdelay 			aSig	, 100, 5000

aLFO						poscil				0.8, 0.05

aoutL, aoutR freeverb aSig, aSig, 1, 0.5

aoutL					*=							20
aoutR					*=							20
								outs						aoutL*aLFO, aoutR*aLFO

endin
</CsInstruments>
<CsScore>
i 1 0 z
i 2 0 z
i 3 0 z
;i 4 0 z
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
  <x>274</x>
  <y>31</y>
  <width>105</width>
  <height>99</height>
  <uuid>{52ab2686-bfb3-4d83-b704-e4dbcafdf863}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.48765702</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>meter2</objectName>
  <x>174</x>
  <y>30</y>
  <width>80</width>
  <height>100</height>
  <uuid>{e8170c3f-57bb-4347-9422-bf248b3712f4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1500.00000000</maximum>
  <value>542.10484757</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>174</x>
  <y>7</y>
  <width>80</width>
  <height>25</height>
  <uuid>{3a952b9b-a238-453c-822d-ef9592c32f11}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Pitch Height</label>
  <alignment>center</alignment>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>286</x>
  <y>8</y>
  <width>80</width>
  <height>25</height>
  <uuid>{449595ef-77f6-4cbd-ae7d-c89bbfb49014}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Pan Position</label>
  <alignment>center</alignment>
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
 <bsbObject type="BSBVSlider" version="2">
  <objectName>meter3</objectName>
  <x>72</x>
  <y>31</y>
  <width>80</width>
  <height>100</height>
  <uuid>{24755c66-8775-46bf-96f7-09e74af6dc54}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>72</x>
  <y>8</y>
  <width>80</width>
  <height>25</height>
  <uuid>{df77a2b4-2f9a-4fef-bd86-7a289410a72b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Envelop</label>
  <alignment>center</alignment>
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
