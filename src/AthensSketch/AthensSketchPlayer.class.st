"
AthensSketchPlayer manage animation controls (start/stop/pause) for an AthensSketch. 
The start method calls setup on the Sketch. 
A playing sketch can be paused/resumed or stopped.

"
Class {
	#name : #AthensSketchPlayer,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'frameDurationMillis',
		'frameNumber',
		'frameRate',
		'frameTimeMillis',
		'sketch',
		'startTimeMillis',
		'state'
	],
	#category : #'AthensSketch-Control'
}

{ #category : #accessing }
AthensSketchPlayer >> exportAsGIF [
	| exporter dialog|

	dialog := ASketchAnimExportDialog new.
	dialog openDialogWithSpec modalRelativeTo: self currentWorld.
	exporter := dialog gifExporter.
	exporter ifNil:[^ self].
	exporter save: self.	
	
]

{ #category : #accessing }
AthensSketchPlayer >> frameDurationMillis [
	^ frameDurationMillis
]

{ #category : #accessing }
AthensSketchPlayer >> frameNumber [
	^ frameNumber
]

{ #category : #accessing }
AthensSketchPlayer >> frameRate [
	^ frameRate
]

{ #category : #accessing }
AthensSketchPlayer >> frameRate: aNumber [
	frameRate := 100 min: aNumber
]

{ #category : #accessing }
AthensSketchPlayer >> frameTimeMillis [
	^ frameTimeMillis
]

{ #category : #initialization }
AthensSketchPlayer >> initialize [

	super initialize.
	announcer := Announcer new.
	state := AthensSketchStateStopped new.
	frameNumber := 0.
	frameTimeMillis := 0.
	frameDurationMillis := 0.
	startTimeMillis := 0.
	frameRate := 20.
]

{ #category : #accessing }
AthensSketchPlayer >> nextFrame [
	| currentTime |
	frameNumber := frameNumber + 1.
	currentTime := Time millisecondClockValue.
	frameDurationMillis := currentTime - startTimeMillis - frameTimeMillis .
	frameTimeMillis := currentTime - startTimeMillis.
	
]

{ #category : #announcements }
AthensSketchPlayer >> onPauseSend: aSelector to: aReceiver [
	announcer on: AthensSketchStatePaused send: aSelector to: aReceiver
]

{ #category : #announcements }
AthensSketchPlayer >> onPlayingSend: aSelector to: aReceiver [
	announcer on: AthensSketchStatePlaying send: aSelector to: aReceiver
]

{ #category : #announcements }
AthensSketchPlayer >> onStopingSend: aSelector to: aReceiver [
	announcer on: AthensSketchStateStopped send: aSelector to: aReceiver
]

{ #category : #states }
AthensSketchPlayer >> pause [
	self setState: state pause
]

{ #category : #states }
AthensSketchPlayer >> resume [
	self setState: state resume
]

{ #category : #private }
AthensSketchPlayer >> setState: newState [
	(newState = state) ifTrue:[ ^ self].
	state := newState.
	announcer announce: state
]

{ #category : #accessing }
AthensSketchPlayer >> sketch [
	^ sketch
]

{ #category : #accessing }
AthensSketchPlayer >> sketch: aSketch [
	sketch := aSketch
]

{ #category : #states }
AthensSketchPlayer >> start [
	frameNumber := 0.
	startTimeMillis := Time millisecondClockValue.
	self setState: state play.
	sketch start.
]

{ #category : #accessing }
AthensSketchPlayer >> state [
	^ state
]

{ #category : #states }
AthensSketchPlayer >> stop [
	self setState: state stop
]

{ #category : #announcements }
AthensSketchPlayer >> unregisterStateListener: aReceiver [
	announcer unsubscribe: aReceiver
]
