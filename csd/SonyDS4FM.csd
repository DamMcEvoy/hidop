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

 kLAX			SonyDS4	0
 kLAY			SonyDS4	1
 kRAY			SonyDS4	3
 kL2				SonyDS4	20

 gkRatio	=						kLAX 
 gkFreq	=						kLAY
 gkNdx		=						kRAY
 gkEnv		=						kL2
 
 gkFreq	*=				-1
 gkNdx		*=				-1
 gkFreq	+=				1
 gkNdx		+=				1 
 gkRatio	=					(gkRatio+1)*4 
 gkFreq	=					(gkFreq+1)*20
 gkNdx		=					(gkNdx+1)*10
 
 gkRatio	portk			gkRatio, 0.03
 gkFreq	portk			gkFreq, 0.03
 gkNdx		portk			gkNdx, 0.03
 gkEnv		portk			gkEnv, 0.03
 
 kModFreq	=					gkFreq*gkRatio
 aMod 			poscil gkNdx * kModFreq, kModFreq	
 aSig				poscil	0.6*gkEnv, gkFreq + aMod
 		
 							outs			aSig, aSig
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
