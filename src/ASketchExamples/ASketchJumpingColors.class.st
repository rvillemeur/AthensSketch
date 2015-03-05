"
rolling or jumping ?
"
Class {
	#name : #ASketchJumpingColors,
	#superclass : #AthensSketch,
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchJumpingColors >> drawStepOn: aCanvas [
	| n colors hw time |
	hw := self extent x / 2.0.
	n := 20.
	time := player frameNumber.
	colors := Color wheel: n saturation: 1 brightness: 1.
	aCanvas setPaint:(Color black alpha:0.5).
	aCanvas drawShape: self boundingBox.
	aCanvas pathTransform translateBy: self extent / 2.0.
	(1 to: n)
		do: [ :i | 
			| angle x |
			angle := i / n * 360.0.
			x := 0.5 * (hw + (0.8*(hw * ((4*angle + time) / (n) * 90.0) degreeCos))).
			aCanvas pathTransform
				restoreAfter: [ 
					aCanvas pathTransform rotateByDegrees: angle.
					aCanvas setPaint: (colors at: i).
					aCanvas drawShape: (AthensCircle origin: x @ 0 radius: 5) ] ]
]

{ #category : #'sketch api' }
ASketchJumpingColors >> setup [
	player frameRate: 55.

]
