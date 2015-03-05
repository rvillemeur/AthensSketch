"
Draws an animated Koch curve.
"
Class {
	#name : #ASketchKoch,
	#superclass : #AthensSketch,
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchKoch >> drawKochLineAnimatedOn: aCanvas [
	| midPoint time a p1 p2 oldPaint|
	a := 1 / 3.0.
	p1 := (-0.5/3.0)@0.
	p2 := (0.5/3.0)@0.
	time :=(player frameNumber rem: 20) / 20.0.
	midPoint := 0 @ (time * a * (1 - (1/9.0)) sqrt) negated.
	aCanvas drawShape:(AthensLine from:(-0.5@0) to:p1).
	aCanvas drawShape:(AthensLine from:p2 to:(0.5@0)).
	aCanvas drawShape:(AthensLine from:p1 to:midPoint).
	aCanvas drawShape:(AthensLine from:midPoint to:p2).
	oldPaint := aCanvas paint.
	aCanvas setPaint: Color red.
	aCanvas drawShape: (AthensCircle origin: p1 radius: 0.01).
	aCanvas drawShape: (AthensCircle origin: p2 radius:0.01).
	aCanvas drawShape: (AthensCircle origin: midPoint radius:0.01).
	aCanvas setStrokePaint: oldPaint.


]

{ #category : #'sketch api' }
ASketchKoch >> drawKochLineOn: aCanvas recDepth: level [
	| midPointl midPointr a |
	level > 1
		ifFalse: [  
			^ self drawKochLineAnimatedOn: aCanvas
			].
	a := 1.0.
	midPointr := -0.25@(0.5*a*(1-0.25)sqrt)negated.
	midPointl := 0.25@(0.5*a*(1-0.25)sqrt)negated.	
	aCanvas pathTransform
		restoreAfter: [ 
			aCanvas pathTransform scaleBy: 1 / 3.0.
			aCanvas pathTransform translateBy: -1 @ 0.
			self drawKochLineOn: aCanvas recDepth: level - 1 ].
	aCanvas pathTransform
		restoreAfter: [ 
			aCanvas pathTransform scaleBy: 1 / 3.0.
			aCanvas pathTransform translateBy: 1 @ 0.
			self drawKochLineOn: aCanvas recDepth: level - 1 ].
	aCanvas pathTransform
		restoreAfter: [ 
			aCanvas pathTransform scaleBy: 1 / 3.0.
			aCanvas pathTransform translateBy: midPointl.
			aCanvas pathTransform rotateByDegrees: 60.
			self drawKochLineOn: aCanvas recDepth: level - 1 ].
	aCanvas pathTransform
		restoreAfter: [ 
			aCanvas pathTransform scaleBy: 1 / 3.0.
			aCanvas pathTransform translateBy: midPointr.
			aCanvas pathTransform rotateByDegrees: -60.
			self drawKochLineOn: aCanvas recDepth: level - 1 ].
		
]

{ #category : #'sketch api' }
ASketchKoch >> drawStepOn: aCanvas [
	| step |
	self clear: Color black.
	aCanvas pathTransform translateBy: self extent / 2.0.
	aCanvas pathTransform scaleBy: self extent.
	step := player frameNumber rem: 80.
	step < 20
		ifTrue: [ 
			(aCanvas setStrokePaint: Color white) width: 0.0025.
			^ self drawKochLineOn: aCanvas recDepth: 1 ].
	step < 40
		ifTrue: [ 
			(aCanvas setStrokePaint: Color white) width: 0.01.
			^ self drawKochLineOn: aCanvas recDepth: 2 ].
	step < 60
		ifTrue: [ 
			(aCanvas setStrokePaint: Color white) width: 0.025.
			^ self drawKochLineOn: aCanvas recDepth: 3 ].
	(aCanvas setStrokePaint: Color white) width: 0.05.
	^ self drawKochLineOn: aCanvas recDepth: 4
]

{ #category : #'sketch api' }
ASketchKoch >> setup [
	self extent:500@500
]
