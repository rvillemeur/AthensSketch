"
How to use paint modes composite operator (xor / destIn / atop ...)
"
Class {
	#name : #ASketchCompositeOperator,
	#superclass : #AthensSketch,
	#instVars : [
		'operator'
	],
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorAtop [
	<athensSketchExample>
	| sketch |
	sketch := self new.
	sketch operator: #atop.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorClear [

	<athensSketchExample>
	| sketch |
	sketch := self new.
	sketch operator: #clear.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorDest [

	<athensSketchExample>
	| sketch |
	sketch := self new.
	sketch operator: #dest.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorDestAtop [

	<athensSketchExample>
	| sketch |
	sketch := self new.
	sketch operator: #destAtop.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorDestIn [
|sketch|
	<athensSketchExample>
	sketch := self new.
	sketch operator:#destIn.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorDestOut [

	<athensSketchExample>
	| sketch |
	sketch := self new.
	sketch operator: #destOut.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorDestOver [

	<athensSketchExample>
	| sketch |
	sketch := self new.
	sketch operator: #destOver.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorIn [

	<athensSketchExample>
	| sketch |
	sketch := self new.
	sketch operator: #in.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorOut [

	<athensSketchExample>
	| sketch |
	sketch := self new.
	sketch operator: #out.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorOver [

	<athensSketchExample>
	| sketch |
	sketch := self new.
	sketch operator: #over.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorSource [

	<athensSketchExample>
	| sketch |
	sketch := self new.
	sketch operator: #source.
	^ sketch
]

{ #category : #'sketch examples' }
ASketchCompositeOperator class >> createSketchOperatorXor [
|sketch|
	<athensSketchExample>
	sketch := self new.
	sketch operator:#xor.
	^ sketch
]

{ #category : #'sketch api' }
ASketchCompositeOperator >> drawStepOn: aCanvas [
	| poly radius |
	radius := (self extent x max: self extent y) / 3.0.
	self clear: Color transparent.
	poly:= AthensLinePolygon starAt: 0 @ 0 radius: radius.
	aCanvas setPaint: (Color red alpha: 0.8).
	aCanvas pathTransform translateBy: self extent / 2.25.
	aCanvas drawShape: poly.
	aCanvas paintMode perform: self operator.
	aCanvas pathTransform translateBy: self extent * 0.15.
	aCanvas setPaint: (Color blue alpha: 0.8).
	aCanvas drawShape: poly.
	
	"draw outline"
	aCanvas paintMode destOver.
	aCanvas pathTransform loadIdentity.
	aCanvas setStrokePaint: Color black.
	aCanvas pathTransform translateBy: self extent / 2.25.
	aCanvas drawShape: poly.
	aCanvas pathTransform translateBy: self extent * 0.15.
	aCanvas drawShape: poly
]

{ #category : #initialization }
ASketchCompositeOperator >> initialize [

	super initialize.

	operator := #default.
]

{ #category : #accessing }
ASketchCompositeOperator >> operator [
	^ operator
]

{ #category : #accessing }
ASketchCompositeOperator >> operator: anObject [
	operator := anObject
]

{ #category : #'sketch api' }
ASketchCompositeOperator >> setup [
	self viewMorph paleHatchBackground 
]
