"
Player is pausing
"
Class {
	#name : #AthensPausedSketchState,
	#superclass : #AthensSketchPlayerState,
	#category : #'AthensSketch-Control'
}

{ #category : #testing }
AthensPausedSketchState >> isPaused [
	^ true
]

{ #category : #states }
AthensPausedSketchState >> play [
	^ AthensPlayingSketchState new
]

{ #category : #printing }
AthensPausedSketchState >> printOn: aStream [
	aStream
		nextPutAll: 'paused'
]

{ #category : #states }
AthensPausedSketchState >> resume [
	^ AthensPlayingSketchState new
]

{ #category : #states }
AthensPausedSketchState >> stop [
	^ AthensStoppedSketchState new
]
