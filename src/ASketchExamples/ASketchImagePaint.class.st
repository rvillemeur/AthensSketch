"
How to use images (forms) as paint.
Note that the paint is reset in #initializeNewSession !

"
Class {
	#name : #ASketchImagePaint,
	#superclass : #AthensSketch,
	#instVars : [
		'paint'
	],
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchImagePaint >> drawStepOn: aCanvas [
	paint ifNil: [ paint := PolymorphSystemSettings pharoLogoForm asAthensPaintOn: aCanvas ].
	self clear: (Color orange alpha:0.5).
	aCanvas setPaint: paint.
	aCanvas drawShape: self boundingBox.


]

{ #category : #'sketch api' }
ASketchImagePaint >> initializeNewSession [
	paint := nil.
	
]

{ #category : #'sketch api' }
ASketchImagePaint >> setup [
	self viewMorph paleHatchBackground.
	self extent:(361@121)
]
