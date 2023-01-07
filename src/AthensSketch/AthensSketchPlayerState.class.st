"
A player state represents the current state of an AthensSketchPlayer. The subclasses implement the valid player state change (stopped -> playing, paused -> playing/ paused -> stopped).
They behaves like an Announcement. User can register themselves as listener on state changes (see AthensSketchPlayer class ).
"
Class {
	#name : #AthensSketchPlayerState,
	#superclass : #Announcement,
	#category : #'AthensSketch-Control'
}

{ #category : #testing }
AthensSketchPlayerState >> isPaused [
	^ false
]

{ #category : #testing }
AthensSketchPlayerState >> isPlaying [
	^ false
]

{ #category : #testing }
AthensSketchPlayerState >> isStopped [
	^ false
]

{ #category : #states }
AthensSketchPlayerState >> pause [
	^ self
]

{ #category : #states }
AthensSketchPlayerState >> play [
	^ self
]

{ #category : #printing }
AthensSketchPlayerState >> printOn: aStream [
	aStream
		nextPutAll: '<undefined player state>'
]

{ #category : #states }
AthensSketchPlayerState >> resume [
	^ self
]

{ #category : #states }
AthensSketchPlayerState >> stop [
	^ self
]
