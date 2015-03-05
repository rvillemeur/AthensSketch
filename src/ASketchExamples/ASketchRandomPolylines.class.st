"
Polygon with random points and fill
"
Class {
	#name : #ASketchRandomPolylines,
	#superclass : #AthensSketch,
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchRandomPolylines >> drawStepOn: aCanvas [
	| vertices |
	self clear: Color black.
	vertices := self randomPoints.
	aCanvas setPaint: Color random.
	aCanvas drawShape: (AthensLinePolygon vertices: vertices).
	aCanvas setStrokePaint: Color white.
	aCanvas draw.
	aCanvas setPaint: (Color red alpha: 0.5).
	vertices do: [ :p | aCanvas drawShape: (AthensCircle origin: p radius: 5) ]
]

{ #category : #private }
ASketchRandomPolylines >> randomPoints [
	^ (1 to: 15) collect: [ :i | 
		self extent x atRandom @ self extent y atRandom ]
]

{ #category : #'sketch api' }
ASketchRandomPolylines >> setup [
	player frameRate: 2
]
