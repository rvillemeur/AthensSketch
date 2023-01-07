"
MouseState keeps track of the current and last mouse position.
Handy for doing AthensSketch demos with basic user interaction.
"
Class {
	#name : #AthensketchMouseState,
	#superclass : #Object,
	#instVars : [
		'currentPos',
		'previousPos'
	],
	#category : #'AthensSketch-Control'
}

{ #category : #accessing }
AthensketchMouseState >> currentPos [
	^ currentPos
]

{ #category : #initialization }
AthensketchMouseState >> initialize [

	super initialize.

	currentPos := 0@0.
	previousPos := 0@0.
]

{ #category : #accessing }
AthensketchMouseState >> previousPos [
	^ previousPos
]

{ #category : #accessing }
AthensketchMouseState >> updateCurrent: anEvent [
	previousPos := currentPos.
	currentPos := anEvent position.

]
