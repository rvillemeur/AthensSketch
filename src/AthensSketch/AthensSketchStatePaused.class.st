"
Player is pausing
"
Class {
	#name : #AthensSketchStatePaused,
	#superclass : #AthensSketchPlayerState,
	#category : #'AthensSketch-Control'
}

{ #category : #testing }
AthensSketchStatePaused >> isPausing [
	^ true
]

{ #category : #states }
AthensSketchStatePaused >> play [
	^ AthensSketchStatePlaying new
]

{ #category : #printing }
AthensSketchStatePaused >> printOn: aStream [
	aStream
		nextPutAll: 'paused'
]

{ #category : #states }
AthensSketchStatePaused >> resume [
	^ AthensSketchStatePlaying new
]

{ #category : #states }
AthensSketchStatePaused >> stop [
	^ AthensSketchStateStopped new
]
