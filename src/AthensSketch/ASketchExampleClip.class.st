"
draw and clip

"
Class {
	#name : #ASketchExampleClip,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExampleClip >> drawStepOn: aCanvas [
	self clear: Color black.
	aCanvas setPaint: Color red.
	self drawTextOn: aCanvas.
	aCanvas setPaint: Color yellow.
	aCanvas clipBy: (self boundingBox insetBy: 35) during: [
		self drawTextOn: aCanvas ]
]

{ #category : #'sketch api' }
ASketchExampleClip >> drawTextOn: aCanvas [
	aCanvas setFont: (LogicalFont familyName: 'Source Code Pro' pointSize: 12).
	aCanvas pathTransform restoreAfter:[
	1 to: 18 do: [ :i | 
		aCanvas pathTransform translateBy: 0 @ 16.
		aCanvas drawString: self class asString, self class comment ] ]
]
