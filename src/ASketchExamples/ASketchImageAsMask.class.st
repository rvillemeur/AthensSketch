"
How to use a paint as a mask. (I am not sure this is the right way, maybe we have a bug
here)
"
Class {
	#name : #ASketchImageAsMask,
	#superclass : #AthensSketch,
	#instVars : [
		'paint'
	],
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchImageAsMask >> drawStepOn: aCanvas [
	paint ifNil: [ paint := PolymorphSystemSettings pharoLogoForm asAthensPaintOn: aCanvas ].
	self clear: Color black.
	aCanvas setStrokePaint: (athensSurface createLinearGradient: { 0 -> Color blue .  1.0 -> Color red } start:0@0 stop: (self extent x @ 0)).
	aCanvas drawShape: self boundingBox.
	paint maskOn: aCanvas.

]

{ #category : #'sketch api' }
ASketchImageAsMask >> initializeNewSession [
	paint := nil.
	
]

{ #category : #'sketch api' }
ASketchImageAsMask >> setup [
	self viewMorph paleHatchBackground.
	self extent:(361@121).
]
