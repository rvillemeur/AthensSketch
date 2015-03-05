"
Exports the sketch frames from a SketchPlayer as an animated GIF.
"
Class {
	#name : #AthensSketchGIFExporter,
	#superclass : #Object,
	#instVars : [
		'fileName',
		'startFrame',
		'endFrame',
		'delay',
		'loop'
	],
	#category : #'AthensSketch-Control'
}

{ #category : #accessing }
AthensSketchGIFExporter >> delay [
	^ delay
]

{ #category : #accessing }
AthensSketchGIFExporter >> delay: anObject [
	delay := anObject
]

{ #category : #accessing }
AthensSketchGIFExporter >> endFrame [
	^ endFrame
]

{ #category : #accessing }
AthensSketchGIFExporter >> endFrame: anObject [
	endFrame := anObject
]

{ #category : #accessing }
AthensSketchGIFExporter >> fileName [
	^ fileName
]

{ #category : #accessing }
AthensSketchGIFExporter >> fileName: anObject [
	fileName := anObject
]

{ #category : #accessing }
AthensSketchGIFExporter >> loop [
	^ loop
]

{ #category : #accessing }
AthensSketchGIFExporter >> loop: anObject [
	loop := anObject
]

{ #category : #save }
AthensSketchGIFExporter >> save: aSketchPlayer [
	| writer |
	writer := GIFReadWriter on: fileName asFileReference writeStream.
	writer loopCount: 0.
	writer delay: delay.
	aSketchPlayer start.
	Cursor write
		showWhile: [ 
			[ 
			1 to: endFrame do: [ :frame | 
				frame >= startFrame
					ifTrue: [ 
						| form |
						aSketchPlayer nextFrame.
						form := aSketchPlayer sketch frame.
						writer nextPutImage: form as8BitColorForm ] ] ]
				ensure: [ writer close. aSketchPlayer stop ] ]
]

{ #category : #accessing }
AthensSketchGIFExporter >> startFrame [
	^ startFrame
]

{ #category : #accessing }
AthensSketchGIFExporter >> startFrame: anObject [
	startFrame := anObject
]
