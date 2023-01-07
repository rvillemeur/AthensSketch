"
You can draw text with athens. 
"
Class {
	#name : #ASketchExampleText,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExampleText >> drawStepOn: anAthensCanvas [
	| colors |
	colors := Color wheel: 10.
	self clear: Color black.
	anAthensCanvas setFont: (LogicalFont familyName: 'Source Code Pro' pointSize: 20).
	1 to: 10 do: [ :i | 
		anAthensCanvas setPaint: (colors at: i).
		anAthensCanvas pathTransform translateBy: 0 @ 25.
		anAthensCanvas drawString: 'Hello World!' ]
]
