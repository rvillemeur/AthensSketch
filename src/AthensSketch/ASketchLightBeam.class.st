"
Shows some beam like stroke.
"
Class {
	#name : #ASketchLightBeam,
	#superclass : #AthensSketch,
	#instVars : [
		'beams'
	],
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchLightBeam >> drawStepOn: aCanvas [
	self clear: Color black.
	(player frameNumber rem: 30) isZero
		ifTrue: [ self initColorBeams ].
	beams
		do: [ :b | 
			| color p1 p2 |
			p1 := b at: 1.
			p2 := b at: 2.
			color := b at: 3.
			(aCanvas setStrokePaint: (color alpha:0.6))
				width: 7;
				capRound.
			aCanvas drawShape: (AthensLine from: p1 to: p2).
			(aCanvas setStrokePaint: color)
				width: 2;
				capRound.
			aCanvas draw ]
]

{ #category : #'sketch api' }
ASketchLightBeam >> initColorBeams [
	| colors w h |
	colors := Color wheel: 5 saturation: 1 brightness: 1.
	w := self extent x.
	h := self extent y.
	beams := (1 to: 10)
		collect: [ :i | 
			| p1 p2 color |
			p1 := w atRandom @ h atRandom.
			p2 := w atRandom @ h atRandom.
			color := colors atWrap: 5 atRandom.
			{p1.
			p2.
			color} ]
]

{ #category : #'sketch api' }
ASketchLightBeam >> setup [
	self initColorBeams
]
