"
Shows some basic example on how to use current frame number for animations.
"
Class {
	#name : #ASketchExampleAnimation,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExampleAnimation >> drawStepOn: anAthensCanvas [
	| origin radius width t |
	self clear: Color transparent.
	origin := self extent / 2.0.
	width := self extent x.
	t := (self player frameNumber rem: 30 )/15.0.
	radius := width * (1 + (t * (2 - t)) raisedTo: 2) / 12.0.
	anAthensCanvas setPaint: Color yellow.
	anAthensCanvas drawShape: (AthensCircle origin: origin radius: radius).


]

{ #category : #'sketch api' }
ASketchExampleAnimation >> setup [
	self viewMorph backgroundColor: Color transparent
]
