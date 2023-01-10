Class {
	#name : #AthensSketchMethod,
	#superclass : #AthensSketchNode,
	#category : #'AthensSketch-UI'
}

{ #category : #accessing }
AthensSketchMethod >> iconName [

	^ nil
]

{ #category : #accessing }
AthensSketchMethod >> name [

	^  self entity selector
]
