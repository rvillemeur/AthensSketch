"
Spiral with different color pattern, build from a simple setup
"
Class {
	#name : #ASketchSpiralColourful,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchSpiralColourful >> drawStepOn: aCanvas [
	| numCircles c t |
	c := 5.
	numCircles := 780.
	t := player frameNumber / 25.0.
	self clear: Color black.
	aCanvas setPaint: Color white.
	aCanvas pathTransform translateBy: self extent / 2.0.
	1 to: numCircles do: [ :i | 
		aCanvas setPaint: (Color h: t*i s: 1 v: 1).
		aCanvas drawShape: (AthensCircle origin: (Point r: c * i sqrt degrees: (50 + t) * i) radius: 3) ]
]
