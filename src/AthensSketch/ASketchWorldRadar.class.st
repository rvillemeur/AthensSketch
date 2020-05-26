"
World morph morph indicator. A simple window showing
outline of all current Morphs in the World.
"
Class {
	#name : #ASketchWorldRadar,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchWorldRadar >> drawStepOn: aCanvas [
	aCanvas setPaint: (Color black alpha: 0.1).
	aCanvas drawShape: self boundingBox.
	aCanvas pathTransform scaleBy: self extent / ActiveWorld extent.
	aCanvas setPaint: (Color green alpha: 0.1).
	ActiveWorld submorphs reverseDo: [ :d | aCanvas drawShape: d bounds ].
	aCanvas setStrokePaint: Color green.
	ActiveWorld submorphs reverseDo: [ :d | aCanvas drawShape: d bounds ]
]
