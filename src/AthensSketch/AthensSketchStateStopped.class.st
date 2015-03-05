"
Stopped state, valid state changes are
-> playing
"
Class {
	#name : #AthensSketchStateStopped,
	#superclass : #AthensSketchPlayerState,
	#category : #'AthensSketch-Control'
}

{ #category : #testing }
AthensSketchStateStopped >> isStopped [
	^ true
]

{ #category : #testing }
AthensSketchStateStopped >> play [
	^ AthensSketchStatePlaying new
]

{ #category : #testing }
AthensSketchStateStopped >> printOn: aStream [
	aStream
		nextPutAll: 'stopped'
]
