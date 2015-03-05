"
A simple example on how to use a Sketch subclass to implement
drawings.
"
Class {
	#name : #ASketchBasicExample,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchBasicExample >> drawStepOn: anAthensCanvas [
	self  clear: Color black.
	anAthensCanvas setPaint: Color red.
	anAthensCanvas drawShape: (self boundingBox insetBy: 20)
]
