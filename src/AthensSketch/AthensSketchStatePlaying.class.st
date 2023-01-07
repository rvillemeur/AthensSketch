"
Player is in playing state. Valid state changes are
-> paused
->stopped
"
Class {
	#name : #AthensSketchStatePlaying,
	#superclass : #AthensSketchPlayerState,
	#category : #'AthensSketch-Control'
}

{ #category : #testing }
AthensSketchStatePlaying >> isPlaying [
	^ true
]

{ #category : #printing }
AthensSketchStatePlaying >> pause [
	^ AthensSketchStatePaused new
]

{ #category : #printing }
AthensSketchStatePlaying >> printOn: aStream [
	aStream
		nextPutAll: 'playing'
]

{ #category : #printing }
AthensSketchStatePlaying >> stop [
	^ AthensSketchStateStopped new
]
