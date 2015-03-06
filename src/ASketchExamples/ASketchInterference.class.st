"
interference of two radial gradient paints
"
Class {
	#name : #ASketchInterference,
	#superclass : #AthensSketch,
	#category : #ASketchExamples
}

{ #category : #'sketch api' }
ASketchInterference >> drawStepOn: aCanvas [
	| paint1 paint2 t |
	t := 16 + 15*(player frameNumber degreeCos).
	self clear: Color transparent.
	paint1 := athensSurface
		createRadialGradient:
			{(0 -> Color white).
			(0.5 -> Color black).
			(1 -> Color white)}
		center: self extent * 0.1 
		radius: t.
	paint2 := athensSurface
		createRadialGradient:
			{(1 -> Color black).
			(0.5 -> Color white).
			(0 -> Color black)}
		center: self extent * 0.9
		radius: t.
"	aCanvas pathTransform translateBy: self extent / 2.0."
	aCanvas paintMode multiply.
	(aCanvas setPaint: paint1) repeat.
	aCanvas drawShape: self boundingBox.
	(aCanvas setPaint: paint2) repeat.
	aCanvas drawShape: self boundingBox.
]
