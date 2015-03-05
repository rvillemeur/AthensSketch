"
Draws a Sierpinski triangle at different scales.
Athens is a vector drawing api  -> fully scaleable.
"
Class {
	#name : #ASketchSierpinski,
	#superclass : #AthensSketch,
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchSierpinski >> drawStepOn: aCanvas [
	| poly |
	self clear: Color black.
	poly := (AthensLinePolygon vertices: {(-0.5 @ 0.5).(0.5 @ 0.5).(0 @ -0.5)}) close.
	(aCanvas setStrokePaint: Color white) width: 0.004.
	aCanvas pathTransform translateBy: self extent / 2.0.
	aCanvas pathTransform scaleBy: 9 - ((player frameTimeMillis / 20.0) degreeCos * 8.9).
	aCanvas pathTransform scaleBy: self extent * 2.
	self drawTriangle: poly onCanvas: aCanvas recDepth: 8
]

{ #category : #private }
ASketchSierpinski >> drawTriangle: triangle onCanvas: aCanvas recDepth: depth [
	depth > 0
		ifFalse: [ ^ self ].
	aCanvas drawShape: triangle.	""
	aCanvas pathTransform
		restoreAfter: [ 
			aCanvas pathTransform scaleBy: 0.5.
			aCanvas pathTransform translateBy: -0.5 @ 0.5.
			self drawTriangle: triangle onCanvas: aCanvas recDepth: depth - 1.
			aCanvas pathTransform translateBy: 1 @ 0.
			self drawTriangle: triangle onCanvas: aCanvas recDepth: depth - 1.
			aCanvas pathTransform translateBy: (0.5 @ 1) negated.
			self drawTriangle: triangle onCanvas: aCanvas recDepth: depth - 1 ]
]
