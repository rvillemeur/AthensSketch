"
You can draw any morph that supports a 
drawOnAthensCanvas method.
"
Class {
	#name : #ASketchExampleDrawMorph,
	#superclass : #AthensSketch,
	#instVars : [
		'morph'
	],
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExampleDrawMorph >> drawStepOn: aCanvas [
	self clear:Color white.
	morph fullDrawOnAthensCanvas: aCanvas.

]

{ #category : #'sketch api' }
ASketchExampleDrawMorph >> setup [
	morph := ActiveWorld worldMenu copy.
]
