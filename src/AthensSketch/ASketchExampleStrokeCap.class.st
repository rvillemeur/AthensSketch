"
Draw Strokes with different end shapes (cap)
"
Class {
	#name : #ASketchExampleStrokeCap,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExampleStrokeCap >> drawStepOn: aCanvas [
	| line |
	self clear: Color black.
	line := aCanvas
		createPath: [ :builder | 
			builder absolute; moveTo: 20 @ 50; lineTo: self boundingBox topRight + (-20 @ 50) ].


	(aCanvas setStrokePaint: Color white) width: 20;capButt.
	aCanvas drawShape:line.
	(aCanvas setStrokePaint: Color black) width: 2;capButt.
	aCanvas draw.
	aCanvas pathTransform translateBy: 0 @ 50.
	(aCanvas setStrokePaint: Color white) width: 20;capRound.
	aCanvas draw.
	(aCanvas setStrokePaint: Color black) width: 2;capButt.
	aCanvas draw.
	aCanvas pathTransform translateBy: 0 @ 50.
	(aCanvas setStrokePaint: Color white) width: 20;capSquare.
	aCanvas draw.
	(aCanvas setStrokePaint: Color black) width: 2;capButt.
	aCanvas draw.

]
