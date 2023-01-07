"
Shows some predefined sketch shapes
"
Class {
	#name : #ASketchExampleShapes,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExampleShapes >> drawStepOn: anAthensCanvas [
	| circle poly arc star qextent |
	qextent := self extent / 4.0.
	circle := AthensCircle origin: 0 @ 0 radius: qextent x.
	poly := AthensLinePolygon regularSides: 5 radius: qextent x.
	arc := AthensArc origin: 0 @ 0 radius: qextent x startRadians: 10 degreesToRadians negated stopRadians: 235 degreesToRadians.
	star := AthensLinePolygon starAt: 0 @ 0 radius: qextent x.
	self clear: Color black.
	anAthensCanvas setPaint: Color red.
	anAthensCanvas pathTransform translateBy: qextent.
	anAthensCanvas drawShape: circle.
	anAthensCanvas setPaint: Color green.
	anAthensCanvas pathTransform translateBy: (2 * qextent x) @ 0.
	anAthensCanvas drawShape: arc.
	anAthensCanvas setPaint: Color yellow.
	anAthensCanvas pathTransform translateBy: (2 * qextent x negated) @ (2 * qextent y).
	anAthensCanvas drawShape: star.
	anAthensCanvas setPaint: Color blue.
	anAthensCanvas pathTransform translateBy: (2 * qextent x) @ 0.
	anAthensCanvas drawShape: poly
]
