"
Draws stroke with different line joins.
"
Class {
	#name : #ASketchExampleStrokeJoin,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExampleStrokeJoin >> drawStepOn: aCanvas [
	| line |
	self clear: Color black.
	line := aCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: 20@(self extent y /3.5);
				lineTo: (self extent x / 2.0) @ 20;
				lineTo: (self extent x - 20) @ (self extent y /3.5)

				].
	(aCanvas setStrokePaint: Color white) width:15;joinMiter.
	aCanvas drawShape: line.
	(aCanvas setStrokePaint: Color black) width:2;joinMiter.
	aCanvas draw.
	aCanvas pathTransform translateBy: 0@100.
	(aCanvas setStrokePaint: Color white) width:15;joinBevel.
	aCanvas drawShape: line.
	(aCanvas setStrokePaint: Color black) width:2;joinMiter.
	aCanvas draw.
	aCanvas pathTransform translateBy: 0@100.
	(aCanvas setStrokePaint: Color white) width:15;joinRound.
	aCanvas drawShape: line.
	(aCanvas setStrokePaint: Color black) width:2;joinMiter.
	aCanvas draw.
	
]

{ #category : #'sketch api' }
ASketchExampleStrokeJoin >> setup [
	self extent:150@300
]
