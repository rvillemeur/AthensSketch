"
Example sketch that shows how paint mode can be used to
create color effects.
"
Class {
	#name : #ASketchBlendMode,
	#superclass : #AthensSketch,
	#instVars : [
		'blendMode',
		'backgroundColor',
		'color1',
		'color2',
		'color3'
	],
	#category : #ASketchExamples
}

{ #category : #'sketch examples' }
ASketchBlendMode class >> createSketchDarkenCYM [
|sketch|
	<athensSketchExample>
	sketch := self new.
	sketch blendMode:#darken;
		backgroundColor: Color white;
		color1: Color cyan;
		color2: Color yellow;
		color3: Color magenta.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchBlendMode class >> createSketchDarkenRGB [
|sketch|
	<athensSketchExample>
	sketch := self new.
	sketch blendMode:#darken;
		backgroundColor: Color white.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchBlendMode class >> createSketchLightenCYM [
|sketch|
	<athensSketchExample>
	sketch := self new.
	sketch blendMode:#lighten;
		backgroundColor: Color black;
		color1: Color cyan;
		color2: Color yellow;
		color3: Color magenta.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchBlendMode class >> createSketchLightenRGB [
|sketch|
	<athensSketchExample>
	sketch := self new.
	sketch blendMode:#lighten;
		backgroundColor: Color black.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchBlendMode class >> exampleSketchLightenRGB [
	self createSketchLightenRGB openPlayer
]

{ #category : #accessing }
ASketchBlendMode >> backgroundColor: anObject [
	backgroundColor := anObject
]

{ #category : #accessing }
ASketchBlendMode >> blendMode [
	^ blendMode
]

{ #category : #accessing }
ASketchBlendMode >> blendMode: anObject [
	blendMode := anObject
]

{ #category : #accessing }
ASketchBlendMode >> color1: anObject [
	color1 := anObject
]

{ #category : #accessing }
ASketchBlendMode >> color2: anObject [
	color2 := anObject
]

{ #category : #accessing }
ASketchBlendMode >> color3: anObject [
	color3 := anObject
]

{ #category : #'sketch api' }
ASketchBlendMode >> drawStepOn: aCanvas [
	| circle radius |
	self clear: backgroundColor.
	radius := (self extent x min: self extent y) / 3.0.
	circle := AthensCircle origin: (0.5 * radius) @ 0 radius: radius.
	aCanvas pathTransform translateBy: self extent / 2.0.
	aCanvas paintMode perform: blendMode.
	aCanvas pathTransform
		restoreAfter: [ 
			aCanvas pathTransform rotateByDegrees:30.
			aCanvas setPaint: color1.
			aCanvas drawShape: circle.
			aCanvas pathTransform rotateByDegrees:120.
			aCanvas setPaint: color2.
			aCanvas drawShape: circle.
			aCanvas pathTransform rotateByDegrees:120.
			aCanvas setPaint: color3.
			aCanvas drawShape: circle ]
		
]

{ #category : #initialization }
ASketchBlendMode >> initialize [
	super initialize.
	blendMode := #over.
	backgroundColor:= Color black.
	color1 := Color red.
	color2 := Color blue.
	color3 := Color green.
]
