"
Pharo has a rich Color api.
"
Class {
	#name : #ASketchExampleColors,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExampleColors >> drawColorWheelsOn: anAthensCanvas [
	| a r n |
	n := 25.
	a := Float twoPi / n.
	r := self extent x / 2.0 min: self extent y / 2.0.
	self clear: Color black.
	anAthensCanvas pathTransform translateBy: self extent * (0.5@0.3).
	(Color wheel: n saturation: 1 brightness: 1)  doWithIndex: [ :c :i | 
			anAthensCanvas setPaint: c.
			anAthensCanvas setShape:(AthensArc origin: 0 @ 0 radius: r startRadians: i * a stopRadians: (i + 1) * a).
			anAthensCanvas draw.
			anAthensCanvas setStrokePaint: Color black.
			anAthensCanvas draw ].
	r:= r/2.0.
	(Color brown lightShades: n)   doWithIndex: [ :c :i | 
			anAthensCanvas setPaint: c.
			anAthensCanvas setShape:(AthensArc origin: 0 @ 0 radius: r startRadians: i * a stopRadians: (i + 1) * a).
			anAthensCanvas draw.
			anAthensCanvas setStrokePaint: Color black.
			anAthensCanvas draw ].
	r:= r/3.0.
	(Color black mix: Color white shades:n)   doWithIndex: [ :c :i | 
			anAthensCanvas setPaint: c.
			anAthensCanvas setShape:(AthensArc origin: 0 @ 0 radius: r startRadians: i * a stopRadians: (i + 1) * a).
			anAthensCanvas draw.
			anAthensCanvas setStrokePaint: Color black.
			anAthensCanvas draw ].
		
]

{ #category : #'sketch api' }
ASketchExampleColors >> drawNamedColorsOn: anAthensCanvas [
	| registeredColors |
	registeredColors := Color registeredColorNames.
	anAthensCanvas setFont: TextStyle defaultFont.
	anAthensCanvas pathTransform loadIdentity.
	anAthensCanvas pathTransform translateBy: self extent * (0.5 @ 0.75).
	registeredColors
		doWithIndex: [ :c :i | 
			anAthensCanvas pathTransform
				restoreAfter: [ 
					| paint |
					paint := Color colorFrom: c asString.
					anAthensCanvas setPaint: paint.
					anAthensCanvas pathTransform rotateByDegrees: 360 * i / registeredColors size.
					anAthensCanvas pathTransform translateBy: 55 @ 0.
					anAthensCanvas drawString: c asString] ]
]

{ #category : #'sketch api' }
ASketchExampleColors >> drawStepOn: anAthensCanvas [
	self drawColorWheelsOn: anAthensCanvas.
	self drawNamedColorsOn: anAthensCanvas
]

{ #category : #'sketch api' }
ASketchExampleColors >> setup [
	self extent:300@600.
	player frameRate:2.
]
