"
Colored circular moving points appear like a wave
"
Class {
	#name : #ASketchRotatingPoints,
	#superclass : #AthensSketch,
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchRotatingPoints >> drawStepOn: aCanvas [
	| time |
	time := player frameNumber.
	aCanvas setPaint: (Color black alpha: time degreeCos squared).
	aCanvas drawShape: self boundingBox.
	(1 to: 14) do: [ :x | 
		(1 to: 14)do: [ :y | 	| point angle |
					point := 10 @ 0.
					angle := time * 10.
					angle := angle + (360.0 * x / 14.0).
					angle := angle + (360.0 * y / 14.0).
					aCanvas setPaint: (Color h: (x + y) * 12 s: 1 v: 1).
					aCanvas pathTransform
						restoreAfter: [ 
							aCanvas pathTransform translateBy: (20 * x) @ (20 * y).
							aCanvas pathTransform rotateByDegrees: angle.
							aCanvas drawShape: (AthensCircle origin: point radius: 2) ] ] ]
]
