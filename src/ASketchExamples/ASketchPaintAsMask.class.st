"
create another surface, paint on that surface (a star) and use the resulting image as a mask for drawing on the sketch surface.
"
Class {
	#name : #ASketchPaintAsMask,
	#superclass : #AthensSketch,
	#instVars : [
		'paint',
		'maskSurface',
		'maskPaint',
		'form'
	],
	#category : #ASketchExamples
}

{ #category : #private }
ASketchPaintAsMask >> createMaskPaint [
	| surf |
	surf := athensSurface class extent: 100 @ 100.
	surf
		drawDuring: [ :canvas | 
			canvas setPaint: (Color white alpha:0.2).
			canvas drawShape:(0@0 extent:100@100).
			canvas setPaint:
					(surf	createRadialGradient:
							{(0 -> Color white).
							(1 -> (Color white alpha:0.2))}
						center: 50 @ 50
						radius: 25).
			canvas drawShape: (AthensLinePolygon starAt: 50 @ 50 radius: 50).
			canvas setStrokePaint: Color white.
			canvas draw ].
	maskSurface := surf.

]

{ #category : #'sketch api' }
ASketchPaintAsMask >> drawStepOn: aCanvas [
	| poly |
	self clear: Color black.
	poly := AthensLinePolygon starAt:0@0 radius: self extent y / 2.0.
	maskSurface ifNil: [ self createMaskPaint. maskPaint := maskSurface asAthensPaintOn: aCanvas].
	paint ifNil: [ paint := form asAthensPaintOn: aCanvas ].
	aCanvas setPaint: paint.
	aCanvas drawShape: form  boundingBox.
	aCanvas pathTransform translateBy: 0@form height.
	aCanvas setPaint: maskPaint.
	aCanvas drawShape: (0@0 extent: maskSurface extent).
	aCanvas pathTransform translateBy: 0@maskSurface extent y.
	aCanvas setStrokePaint: paint.
	aCanvas drawShape: self boundingBox.
	(maskPaint) repeat;maskOn: aCanvas.

]

{ #category : #'sketch api' }
ASketchPaintAsMask >> initializeNewSession [
	paint := nil.
	maskSurface := nil.
	maskPaint := nil
]

{ #category : #'sketch api' }
ASketchPaintAsMask >> setup [
	self extent:(361@342).
	form := PolymorphSystemSettings pharoLogoForm.
]
