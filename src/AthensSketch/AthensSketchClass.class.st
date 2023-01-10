Class {
	#name : #AthensSketchClass,
	#superclass : #AthensSketchNode,
	#category : #'AthensSketch-UI'
}

{ #category : #accessing }
AthensSketchClass >> children [

	| methods |
	methods := (Pragma
		            allNamed: #athensSketchExample
		            in: self entity classSide)
		           collect: [ :each | AthensSketchMethod for: each method ]
		           as: OrderedCollection.

	^ methods
]

{ #category : #accessing }
AthensSketchClass >> iconName [

	^  self entity systemIconName
]

{ #category : #accessing }
AthensSketchClass >> name [

	^ self entity name
]
