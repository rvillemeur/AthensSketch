"
Draw an image create a reflection like effect, compute a easeInOut factor for sliding animation.
"
Class {
	#name : #ASketchSlideImage,
	#superclass : #AthensSketch,
	#instVars : [
		'paint',
		'form'
	],
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchSlideImage >> drawReflectionOnCanvas: aCanvas [
"draw flipped"
	aCanvas pathTransform
		restoreAfter: [ 
			aCanvas pathTransform translateBy: 0 @ self extent y.
			aCanvas pathTransform scaleBy: 1 @ -1.
			aCanvas draw ].
"mask/composite with translucent gradient"		
	aCanvas setPaint: (athensSurface
	createLinearGradient: {(0 -> Color transparent). (1 -> Color white)}  start: 0 @ (self extent y / 2.0) stop: 0 @ self extent y).
	aCanvas paintMode
		restoreAfter: [ 
			aCanvas paintMode destOut.
			aCanvas drawShape: (0 @ (self extent y / 2.0) corner: self extent) ]
]

{ #category : #'sketch api' }
ASketchSlideImage >> drawStepOn: aCanvas [
	| t w |
	w := self extent x * 0.5.
	t := self tweenTime: ((player frameNumber *10)rem: w) / w.
	t := ((t - 0.5) * self extent x) @ 0.
	paint ifNil: [ paint := form asAthensPaintOn: aCanvas ].
	self clear: Color black.
	aCanvas setPaint: Color white.
	aCanvas drawShape: (0 @ 0 extent: self extent x @ (self extent y / 4.0)).
	aCanvas pathTransform translateBy: ((self extent x - form extent x) / 2.0) @ 0.
	aCanvas pathTransform translateBy: 4 * t.
	self paintImageOn: aCanvas.
]

{ #category : #'sketch api' }
ASketchSlideImage >> initializeNewSession [
	paint := nil.
	form := nil.
]

{ #category : #'sketch api' }
ASketchSlideImage >> paintImageOn: aCanvas [
	aCanvas setPaint: paint.
	aCanvas drawShape: self boundingBox.
	self drawReflectionOnCanvas: aCanvas
]

{ #category : #'sketch api' }
ASketchSlideImage >> setup [
	self extent: 604 @ 260.
	form := PolymorphSystemSettings pharoLogoForm.
]

{ #category : #'sketch api' }
ASketchSlideImage >> tweenTime: t [
	^ t < 0.5
		ifTrue: [ (1 - ((1 - (2 * t)) ** 2)) sqrt / 2.0 ]
		ifFalse: [ 1 - ((1 - ((1 - (2 * t)) ** 2)) sqrt / 2.0) ]
]
