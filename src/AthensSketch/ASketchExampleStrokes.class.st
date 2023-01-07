"
Show an example for some AthensStrokePaint properties (width/join/dash)
"
Class {
	#name : #ASketchExampleStrokes,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExampleStrokes >> drawStepOn: aCanvas [
	self clear: Color black.
	aCanvas setPaint: Color gray.
	(aCanvas setStrokePaint: Color white) width: 12.
	aCanvas drawShape: (self boundingBox insetBy: 20).
	(aCanvas setStrokePaint: Color white) width: 12; joinRound.
	aCanvas drawShape: (self boundingBox insetBy: 50).
	(aCanvas setStrokePaint: Color white) width: 12; joinMiter.
	aCanvas drawShape: (self boundingBox insetBy: 80).
	(aCanvas setStrokePaint: Color white) width: 5; dashes:{ 5 . 5} offset: player frameNumber ; joinBevel.
	aCanvas drawShape: (self boundingBox insetBy: 100).
	
]
