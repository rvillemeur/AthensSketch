"
Shows how you can compute a movement along a path.
"
Class {
	#name : #ASketchMoveOnACurve,
	#superclass : #AthensSketch,
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchMoveOnACurve >> drawStepOn: aCanvas [
	| curve x y cp1 cp2 p1 p2 t t1 pcircle lcircle|
	x := self extent x.
	y := self extent y.
	p1 := 5 @ (y / 2.0 + 5).
	p2 := (x - 5) @ (y / 2.0).
	cp1 := x @ 0 / 8.0.
	cp2 := x @ y - cp1.
	t := (player frameNumber * 4 rem: y) / y.
	t1 := 1 - t.
	pcircle := p1 * t1 * t1 * t1 + (3 * cp1 * t * t1 * t1) + (3 * cp2 * t * t * t1) + (p2 * t * t * t).
	lcircle := p1 + (t*(p2-p1)).
	self clear: Color black.
	curve := aCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: p1;
				curveVia: cp1 and: cp2 to: p2 ].

	aCanvas drawShape: curve.
	(aCanvas setStrokePaint: Color red)
		width: 8;
		capRound.
	aCanvas drawShape: curve.
	aCanvas setPaint: Color green.
	aCanvas drawShape: (AthensCircle origin: pcircle radius: 5).
	aCanvas setPaint: Color blue.	
	aCanvas drawShape: (AthensCircle origin: lcircle radius: 5).
]
