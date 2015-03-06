"
Shows how a shape (path) transform does not change the gradient fill origin
and how to use paint transform to change the origin of a gradient fill.
"
Class {
	#name : #ASketchExamplePaintTransform,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExamplePaintTransform >> drawStepOn: aCanvas [
|paint rect1 rect2 rect3|
	self clear: Color black.
	rect1 := 20@20 extent: 100@100.
	rect2 := 20@150 extent: 100@100.
	rect3 := 150@150 extent: 100@100.
	paint := self athensSurface createLinearGradient: { 0 -> Color blue . 0.25 -> Color yellow . 0.5 -> Color green . 1.0 -> Color red } start: 20@20 stop: 	20@100.
	
	"draw a shape with gradient fill"
	aCanvas setPaint: paint.
	aCanvas drawShape: rect1.
	
	"draw same shape, same position, but transformed -> fill is transformed too"
	aCanvas pathTransform restoreAfter:[
	aCanvas pathTransform translateBy: 130@0.
	aCanvas pathTransform translateBy: 70@70; rotateByDegrees: 45;translateBy: (70@70) negated.	
	aCanvas draw
	].

	"draw second shape at different position, no transform -> only the red part of the gradient
	fill applies to this shape"
	aCanvas setPaint: paint.
	aCanvas drawShape: rect2.
	
	"draw third shape at different position, but with transformed fill"
	aCanvas paintTransform restoreAfter:[
		aCanvas paintTransform translateBy: 130@130.
	aCanvas setPaint: paint.
	aCanvas drawShape: rect3]
]
