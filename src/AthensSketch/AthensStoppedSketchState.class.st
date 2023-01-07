"
Stopped state, valid state changes are
-> playing
"
Class {
	#name : #AthensStoppedSketchState,
	#superclass : #AthensSketchPlayerState,
	#category : #'AthensSketch-Control'
}

{ #category : #testing }
AthensStoppedSketchState >> isStopped [
	^ true
]

{ #category : #testing }
AthensStoppedSketchState >> play [
	^ AthensPlayingSketchState new
]

{ #category : #testing }
AthensStoppedSketchState >> printOn: aStream [
	aStream
		nextPutAll: 'stopped'
]
