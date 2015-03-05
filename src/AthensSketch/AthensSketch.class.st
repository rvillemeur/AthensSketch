"
Basic sketch class.
Override 
drawStepOn: aCanvas
in a subclass for actual drawing. The Canvas parameter is an AthensCanvas. For optional setup code (like changing the extent or set some view properties like background), override #setup.

The player attribute is for basic animation support play/stop/pause and frameTime/frameCounter properties.

Open a Sketch with a Morphic View
MySketch  openView.
or with player controls
MySketch  openPlayer.



"
Class {
	#name : #AthensSketch,
	#superclass : #Object,
	#instVars : [
		'extent',
		'athensSurface',
		'session',
		'player',
		'view',
		'mouseState'
	],
	#category : #AthensSketch
}

{ #category : #'instance creation' }
AthensSketch class >> openPlayer [
	^ (AthensSketchApp new sketch: self new) openWithSpec
]

{ #category : #'instance creation' }
AthensSketch class >> openView [
	^ self new openView
]

{ #category : #accessing }
AthensSketch >> athensSurface [
	^ athensSurface
]

{ #category : #drawing }
AthensSketch >> basicDrawStepOn: aCanvas [
	player state isPlaying
		ifTrue: [ 
			player nextFrame.
			self drawStepOn: aCanvas ]
]

{ #category : #'private session' }
AthensSketch >> basicInitializeNewForSession [
	self createSurface.
	session := Smalltalk session.
	self initializeNewSession
]

{ #category : #states }
AthensSketch >> basicSetup [
	
	self setup.

]

{ #category : #accessing }
AthensSketch >> boundingBox [
	^ 0 @ 0 extent: extent
]

{ #category : #'private session' }
AthensSketch >> checkSession [
	session = Smalltalk session ifFalse:[ self initializeNewForSession]
]

{ #category : #drawing }
AthensSketch >> clear: aColor [
	athensSurface clear: aColor
]

{ #category : #'private session' }
AthensSketch >> createSurface [
	athensSurface := AthensCairoSurface extent: self extent
]

{ #category : #private }
AthensSketch >> defaultExtent [
	^ 300 @ 300
]

{ #category : #drawing }
AthensSketch >> drawOn: aCanvas at: aLocation [
	self renderFrame.
	self drawOnMorphic: aCanvas at: aLocation
]

{ #category : #drawing }
AthensSketch >> drawOnMorphic: aCanvas at: aLocation [
	aCanvas
		image: self athensSurface asForm
		at: aLocation
		sourceRect: (0 @ 0 extent: self extent)
		rule: Form blend
]

{ #category : #'sketch api' }
AthensSketch >> drawStepOn: aCanvas [
	"overwrite in subclasses"
]

{ #category : #accessing }
AthensSketch >> extent [
	^ extent 
]

{ #category : #accessing }
AthensSketch >> extent: anExtent [
	extent := anExtent.
	self invalidateSurface.
	view ifNotNil: [ view extent: self extent ]
]

{ #category : #accessing }
AthensSketch >> frame [
	self renderFrame.
	^ athensSurface asForm
]

{ #category : #initialization }
AthensSketch >> initialize [

	super initialize.

	session := nil.
	athensSurface := nil.
	extent := self defaultExtent.
	mouseState := AthensketchMouseState new.
	player := AthensSketchPlayer new sketch: self; yourself
]

{ #category : #'private session' }
AthensSketch >> initializeNewForSession [
	self createSurface.
	session := Smalltalk session.
]

{ #category : #'sketch api' }
AthensSketch >> initializeNewSession [
	"put your code here for all session dependent resources
	like paints or own surfaces"
]

{ #category : #'private session' }
AthensSketch >> invalidateSurface [
	session := nil
]

{ #category : #events }
AthensSketch >> mouseMove: anEvent [
	mouseState updateCurrent: anEvent
]

{ #category : #accessing }
AthensSketch >> mouseState [
	^ mouseState
]

{ #category : #states }
AthensSketch >> openPlayer [
	^ (AthensSketchApp new sketch: self) openWithSpec
]

{ #category : #states }
AthensSketch >> openView [
	self viewMorph openInWorld
]

{ #category : #accessing }
AthensSketch >> player [
	^ player
]

{ #category : #private }
AthensSketch >> renderFrame [
	self checkSession.
	athensSurface drawDuring: [ :canvas | self basicDrawStepOn: canvas ]
]

{ #category : #accessing }
AthensSketch >> resize: anExtent [
	self extent = anExtent
		ifFalse: [ self extent: anExtent ]
]

{ #category : #'sketch api' }
AthensSketch >> setup [
	"overwrite in subclasses"
]

{ #category : #states }
AthensSketch >> start [
	self setup.

]

{ #category : #accessing }
AthensSketch >> viewMorph [
	^ view ifNil: [ view := AthensSketchMorph new sketch: self ]
]
