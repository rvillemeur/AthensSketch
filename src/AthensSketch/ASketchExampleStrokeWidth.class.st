"
Drawing strokes with different width. Note
the 1 pixel stroke painted twice once with integer coordinates
and once with endpoints adjusted by 0.5.
In cairo, integer coordinates map to the intersections of the pixel squares.
"
Class {
	#name : #ASketchExampleStrokeWidth,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExampleStrokeWidth >> drawStepOn: aCanvas [
	| line |
	self clear: Color black.
	line := aCanvas
		createPath: [ :builder | 
			builder absolute; moveTo: 20 @ 30; lineTo: self boundingBox topRight + (-20 @ 30) ].
	aCanvas pathTransform translateBy: 0 @ 0.5.
	(aCanvas setStrokePaint: Color white) width: 1.
	aCanvas drawShape:line.
	aCanvas pathTransform translateBy: 0 @ 10.5.
	aCanvas draw.
	aCanvas pathTransform translateBy: 0 @ 30.
	(aCanvas setStrokePaint: Color white) width: 2.
	aCanvas draw.
	aCanvas pathTransform translateBy: 0 @ 30.
	(aCanvas setStrokePaint: Color white) width: 3.
	aCanvas draw.
	aCanvas pathTransform translateBy: 0 @ 30.
	(aCanvas setStrokePaint: Color white) width: 5.
	aCanvas draw.
	aCanvas pathTransform translateBy: 0 @ 30.
	(aCanvas setStrokePaint: Color white) width: 10.
	aCanvas draw.
	aCanvas pathTransform translateBy: 0 @ 30.
	(aCanvas setStrokePaint: Color white) width: 20.
	aCanvas draw
]
