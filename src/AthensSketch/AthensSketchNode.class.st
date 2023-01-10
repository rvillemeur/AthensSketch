Class {
	#name : #AthensSketchNode,
	#superclass : #Object,
	#instVars : [
		'entity'
	],
	#category : #'AthensSketch-UI'
}

{ #category : #'instance creation' }
AthensSketchNode class >> for: anObject [

	^  self new 
		entity: anObject;
		yourself
]

{ #category : #accessing }
AthensSketchNode >> children [

	^ #()
]

{ #category : #accessing }
AthensSketchNode >> entity [
	
	^  entity
]

{ #category : #accessing }
AthensSketchNode >> entity: anObject [

	entity := anObject
]

{ #category : #accessing }
AthensSketchNode >> iconName [

	^ nil
]

{ #category : #accessing }
AthensSketchNode >> name [

	^ self subclassResponsibility
]
