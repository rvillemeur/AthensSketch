"
Pharos images (Forms) can be used as repeating patterns for shape fills.
"
Class {
	#name : #ASketchImagePatternPaint,
	#superclass : #AthensSketch,
	#instVars : [
		'paint'
	],
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchImagePatternPaint >> drawStepOn: aCanvas [
|poly|
	self clear: (Color orange alpha:0.8).
	poly := AthensLinePolygon regularSides: 3 radius: self extent x / 3.0.
	paint ifNil: [ paint := Smalltalk ui icons helpIcon asAthensPaintOn: aCanvas].
	aCanvas pathTransform translateBy: self extent / 2.0.
	(aCanvas setPaint: paint) repeat.
	aCanvas paintMode source.
	aCanvas drawShape: poly.
	aCanvas setStrokePaint: Color red.
	aCanvas draw


]

{ #category : #'sketch api' }
ASketchImagePatternPaint >> initializeNewSession [
	paint := nil.
	
]

{ #category : #'sketch api' }
ASketchImagePatternPaint >> setup [
	self viewMorph backgroundColor: Color transparent.
	self extent:400@400
]
