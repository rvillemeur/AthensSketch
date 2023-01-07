"
Example shows some different path transformation combination for
translation, rotation and rotate around a point.
"
Class {
	#name : #ASketchExamplePathTransform,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExamplePathTransform >> drawStepOn: aCanvas [
	| shape angle |
	angle := (player frameNumber rem: 120) * 3.
	shape := 0 @ 0 extent: 20 @ 20.
	self clear: Color transparent.	"center on view bounds"
	aCanvas pathTransform translateBy: self extent / 2.0.
	aCanvas setShape: shape.
	
	"draw and rotate at center"
	aCanvas pathTransform
	"save and restore after this block"
		restoreAfter: [ 
			aCanvas pathTransform rotateByDegrees: angle.
			aCanvas pathTransform translateBy: shape extent / 2.0 negated.
			aCanvas setPaint: Color orange.
			aCanvas draw ].

	"draw translated rotate around shape center"
	aCanvas pathTransform
		restoreAfter: [ 
			aCanvas pathTransform translateBy: 40 @ 0.
			aCanvas pathTransform rotateByDegrees: angle.
			aCanvas pathTransform translateBy: shape extent / 2.0 negated.
			aCanvas setPaint: Color green.
			aCanvas draw ].
		
	"draw translated, rotate around center"
	aCanvas pathTransform
		restoreAfter: [ 
			aCanvas pathTransform rotateByDegrees: angle.
			aCanvas pathTransform translateBy: shape extent / 2.0 negated.
			aCanvas pathTransform translateBy: 80 @ 0.
			aCanvas setPaint: Color brown.
			aCanvas draw ].
		
	"draw translated, rotate around center, without rotating shape"	
	aCanvas pathTransform
		restoreAfter: [ 
			aCanvas pathTransform rotateByDegrees: angle.
			aCanvas pathTransform translateBy: shape extent / 2.0 negated.
			aCanvas pathTransform translateBy: 120 @ 0.
			aCanvas pathTransform translateBy: shape extent / 2.0.
			aCanvas pathTransform rotateByDegrees: angle negated.
			aCanvas pathTransform translateBy: shape extent / 2.0 negated.
			aCanvas setPaint: Color pink.
			aCanvas draw ].
		
	"show orbit"
	aCanvas paintMode
		restoreAfter: [ 
			aCanvas paintMode destOver.
			1 to: 3 do: [ :i | 
				(aCanvas setStrokePaint: Color white) width: 2.
				aCanvas drawShape: (AthensCircle origin: 0 @ 0 radius: i * 40) ] ]
]

{ #category : #'sketch api' }
ASketchExamplePathTransform >> setup [
	self extent:360@360
]
