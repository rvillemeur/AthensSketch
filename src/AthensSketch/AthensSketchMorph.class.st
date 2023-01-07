"
AthensSketchMorph draws and controls an AthensSketch. 
Animation is done through  morphics stepping machinery.
"
Class {
	#name : #AthensSketchMorph,
	#superclass : #Morph,
	#instVars : [
		'sketch'
	],
	#category : #'AthensSketch-UI'
}

{ #category : #menu }
AthensSketchMorph >> addCustomMenuItems: aMenu hand: aHand [
	super addCustomMenuItems: aMenu hand: aHand.
	aMenu addUpdating: #playerState selector: #playOrPause
]

{ #category : #drawing }
AthensSketchMorph >> areasRemainingToFill: aRectangle [
	^ Array with: aRectangle
]

{ #category : #accessing }
AthensSketchMorph >> backgroundColor: aColor [
	self fillStyle: aColor
]

{ #category : #drawing }
AthensSketchMorph >> drawOn: aCanvas [
	aCanvas
		fillRectangle: self innerBounds
		fillStyle: self fillStyle.
	sketch ifNil: [ ^ self ].
	sketch drawOn: aCanvas at: self bounds origin
]

{ #category : #events }
AthensSketchMorph >> handleMouseMove: anEvent [
	| translatedEvent |
	anEvent wasHandled
		ifTrue: [ ^ self ].
	anEvent wasHandled: true.
	translatedEvent := anEvent copy translateBy: -1 * self topLeft.
	sketch mouseMove: translatedEvent
]

{ #category : #accessing }
AthensSketchMorph >> hatchBackground [
	self fillStyle: (InfiniteForm with: self newHatchForm)
]

{ #category : #initialization }
AthensSketchMorph >> initialize [
	super initialize.
	self color: Color black.
	sketch := nil
]

{ #category : #layout }
AthensSketchMorph >> layoutChanged [
	super layoutChanged.
	sketch resize: self extent asIntegerPoint
]

{ #category : #private }
AthensSketchMorph >> newHatchForm [
	^(Form
	extent: 8@8
	depth: 1
	fromArray: #( 4026531840 4026531840 4026531840 4026531840 251658240 251658240 251658240 251658240)
	offset: 0@0)
]

{ #category : #accessing }
AthensSketchMorph >> paleHatchBackground [
	self
		fillStyle:
			(CompositeFillStyle
				fillStyles:
					{(InfiniteForm with: self newHatchForm).
					(Color white alpha: 0.75)})
]

{ #category : #menu }
AthensSketchMorph >> playOrPause [
	sketch player state isStopped
		ifFalse: [ sketch player stop ]
		ifTrue: [ sketch player start ]
]

{ #category : #menu }
AthensSketchMorph >> playerState [
	^ sketch player state isStopped ifFalse:[ 'stop sketch'] ifTrue:['start sketch'].
]

{ #category : #private }
AthensSketchMorph >> registerOnPlayer: aPlayerControl [
	aPlayerControl ifNil: [ ^ self ].
	aPlayerControl onPlayingSend: #startStepping to: self.
	aPlayerControl onStopingSend: #stopStepping to: self.
	aPlayerControl onPauseSend: #stopStepping to: self
]

{ #category : #accessing }
AthensSketchMorph >> sketch: aSketch [
	sketch ifNotNil: [ self unregisterOnPlayer: sketch player ].
	sketch := aSketch.
	self registerOnPlayer: sketch player.
	self extent: aSketch extent
]

{ #category : #stepping }
AthensSketchMorph >> step [

	self changed
]

{ #category : #stepping }
AthensSketchMorph >> stepTime [
	^ sketch ifNotNil: [ 1000 / sketch player frameRate ] ifNil: [ 20 ]
]

{ #category : #private }
AthensSketchMorph >> unregisterOnPlayer: aPlayerControl [
	aPlayerControl ifNil:[ ^ self].
	aPlayerControl unregisterStateListener: self.
]
