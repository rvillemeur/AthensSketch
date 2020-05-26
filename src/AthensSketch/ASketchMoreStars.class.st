"
Draws some stars at random position
"
Class {
	#name : #ASketchMoreStars,
	#superclass : #AthensSketch,
	#instVars : [
		'stars'
	],
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchMoreStars >> drawStepOn: aCanvas [
	"fade with background"
	aCanvas setPaint: (Color black alpha: 0.05).
	aCanvas drawShape: self boundingBox.
	"fill stars"
	aCanvas setPaint: (Color yellow alpha: 0.2).
	stars do: [ :s | aCanvas drawShape: s ].
	"stroke stars"
	aCanvas setStrokePaint: Color yellow.
	stars do: [ :s | aCanvas drawShape: s ].
	
	"reinit stars every 50 frame"
	(player frameNumber rem: 50) isZero
		ifTrue: [ self initStars ]
]

{ #category : #private }
ASketchMoreStars >> initStars [
	| width height |
	width := self extent x.
	height := self extent y.
	stars := (1 to: 30) collect: [ :i | AthensLinePolygon starAt: width atRandom @ height atRandom radius: 15 atRandom ]
]

{ #category : #'sketch api' }
ASketchMoreStars >> setup [
	self initStars.
]
