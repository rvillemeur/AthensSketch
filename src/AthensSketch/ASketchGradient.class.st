"
Radial and linear gradients
"
Class {
	#name : #ASketchGradient,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchGradient >> drawStepOn: aCanvas [
	| colors colorStops |
	colors := Color wheel: 10 saturation: 1 brightness: 1.
	colorStops := (1 to: 10 by: 1) collect: [ :i | i / 10 - 0.1 -> (colors at: i) ].
	self clear: Color black.
	aCanvas setPaint: (athensSurface createLinearGradient: colorStops start: 0 @ 0 stop: self extent).
	aCanvas drawShape: self boundingBox.
	aCanvas
		setPaint: (athensSurface createRadialGradient: colorStops center: self extent / 2.0 radius: self extent x / 2.0).
	aCanvas drawShape: (AthensLinePolygon starAt: self extent / 2.0 radius: self extent x / 2.0).
	aCanvas setStrokePaint: Color black.
	aCanvas draw.
]
