"
Player is in playing state. Valid state changes are
-> paused
->stopped
"
Class {
	#name : #AthensPlayingSketchState,
	#superclass : #AthensSketchPlayerState,
	#category : #'AthensSketch-Control'
}

{ #category : #testing }
AthensPlayingSketchState >> isPlaying [
	^ true
]

{ #category : #printing }
AthensPlayingSketchState >> pause [
	^ AthensPausedSketchState new
]

{ #category : #printing }
AthensPlayingSketchState >> printOn: aStream [
	aStream
		nextPutAll: 'playing'
]

{ #category : #printing }
AthensPlayingSketchState >> stop [
	^ AthensStoppedSketchState new
]
