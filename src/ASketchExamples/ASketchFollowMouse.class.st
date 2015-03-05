"
Follow mouse, show an animated marker.
"
Class {
	#name : #ASketchFollowMouse,
	#superclass : #AthensSketch,
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchFollowMouse >> drawStepOn: aCanvas [
	| line p t |
	self clear: Color black.
	t := player frameNumber rem: 180.
	p := ((10 + (10 * t) degreeCos) * 2) @ 0.
	line := AthensLine from: p to: p + (5 @ 0).
	(aCanvas setStrokePaint: (Color green alpha: 0.7))
		width: 5;
		capRound.
	aCanvas pathTransform restoreAfter: [ 
		aCanvas pathTransform 
			translateBy: mouseState currentPos; 
			rotateByDegrees: 2 * t.
			aCanvas drawShape: line.
			aCanvas pathTransform rotateByDegrees: 90.
			aCanvas draw.
			aCanvas pathTransform rotateByDegrees: 90.
			aCanvas draw.
			aCanvas pathTransform rotateByDegrees: 90.
			aCanvas draw ]
]
