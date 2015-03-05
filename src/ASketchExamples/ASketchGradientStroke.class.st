"
Drawing strokes with gradient fill styles.
"
Class {
	#name : #ASketchGradientStroke,
	#superclass : #AthensSketch,
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchGradientStroke >> drawStepOn: aCanvas [
	| stroke gradient colors colorStops |
	self clear: Color black.
	colors := Color wheel: 10 saturation: 1 brightness: 1.
	colorStops := (1 to: 10 by: 1) collect: [ :i | i / 10 - 0.1 -> (colors at: i) ].
	
	gradient := athensSurface createRadialGradient: colorStops center: self extent / 2.0 radius: self extent x / 2.0.
	stroke := aCanvas setStrokePaint: gradient.
	stroke width: 10.
	stroke joinRound.
	aCanvas drawShape: (AthensLinePolygon starAt: self extent / 2.0 radius: self extent x / 2.5)
]
