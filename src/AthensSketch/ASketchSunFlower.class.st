"
Fermat's spiral (sunflower seed pattern)
"
Class {
	#name : #ASketchSunFlower,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchSunFlower >> drawStepOn: aCanvas [
	| numCircles c |
	c := 5.
	numCircles := 800.
	self clear: Color black.
	aCanvas setPaint: Color white.
	aCanvas pathTransform translateBy: self extent / 2.0.
	1 to: numCircles do: [ :i | aCanvas drawShape: (AthensCircle origin: (Point r: c * i sqrt degrees: i * 137.508) radius: 3) ]
]
