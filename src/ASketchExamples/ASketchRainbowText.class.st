"
Gradient fills can be used for drawing text!
"
Class {
	#name : #ASketchRainbowText,
	#superclass : #AthensSketch,
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchRainbowText >> drawStepOn: aCanvas [

	self clear: Color black.
	aCanvas setFont: TextStyle defaultFont.
	aCanvas pathTransform translateBy:self extent /2.0.
	aCanvas pathTransform scaleBy:5.
	aCanvas pathTransform translateBy: (20@0) negated.
	aCanvas setPaint: Color white.
	aCanvas drawString:'Athens'.
	(aCanvas setPaint: (athensSurface createLinearGradient: { 0->Color blue . 0.6 ->  Color red . 0.8 -> Color green . 1 -> Color orange } start: -5@0 stop: 18@0))reflect.
	aCanvas pathTransform translateBy: (0@20).
	aCanvas drawString:'Athens'.

]
