"
paint circles over circles with xor paint mode.
"
Class {
	#name : #ASketchXorCircles,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchXorCircles >> drawStepOn: aCanvas [
	| radius nCircles |
	self clear: Color transparent.
	nCircles := 8.
	aCanvas setPaint: Color black.
	aCanvas paintMode xor.
	1 to: nCircles do: [ :i | 
		0 to: 1 do: [ :k | 
			aCanvas pathTransform
				restoreAfter: [ 
					radius := ((2*player frameNumber) + (k * 180) rem: 360).
					aCanvas setShape: (AthensCircle origin: 0 @ 0 radius: radius).
					aCanvas pathTransform translateBy: self extent / 2.0.
					aCanvas pathTransform rotateByDegrees: i / nCircles * 360.0.
					aCanvas pathTransform translateBy: (self extent x / 4.0) @ 0.
					aCanvas draw ] ] ].
	aCanvas paintMode destOver.
	aCanvas setPaint: Color white.
	aCanvas drawShape: self boundingBox.
]

{ #category : #'sketch api' }
ASketchXorCircles >> setup [
	self viewMorph paleHatchBackground.

]
