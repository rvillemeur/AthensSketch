"
Sketch player toolbar provides buttons for controlling an AthensSketchPlayer (start/pause/resume/stop)


```
AthensSketchPlayerToolbar new open
```
"
Class {
	#name : #AthensSketchPlayerToolbar,
	#superclass : #SpPresenter,
	#instVars : [
		'pauseButton',
		'startButton',
		'stopButton',
		'exportButton',
		'playerControl'
	],
	#classInstVars : [
		'startIcon',
		'pauseIcon',
		'stopIcon'
	],
	#category : #'AthensSketch-UI'
}

{ #category : #spec }
AthensSketchPlayerToolbar class >> defaultSpec [
	<spec>
	^ SpecLayout composed
		newRow: [ :row | 
					row
						add: #startButton;
						add: #stopButton;
						add: #exportButton ];
		yourself
]

{ #category : #icons }
AthensSketchPlayerToolbar class >> pauseIcon [
	^ pauseIcon
		ifNil: [ pauseIcon := Form
				fromBinaryStream: self pauseIconContents base64Decoded readStream ]
]

{ #category : #'private icons' }
AthensSketchPlayerToolbar class >> pauseIconContents [
	^ 'R0lGODlhEAAQAMQAAPj48PjwyPjosNC4aPjYgPjouPjw2LyDFb2EFrmBFcCgYLh9FLF3E7F4
E7yCFbqAFbV6FLR6FLh+FadtEKxxEapvEalvEa91Eq50EqhsEKhtEf///wAAAAAAAAAAAAAA
ACH5BAEAABsALAAAAAAQABAAAAVj4CaOZGme54Csw6ayJQLMyCbTpTMDx6bPPVLCQHxshsXS
IlAISDbL5pMEKQgKkU31miU1BAQBY/MNj0kYsOCySYfZJEpAEKBs5HQ7qUI0WDZ8RH8kChMa
GQobhYeJKI6PkJAhADs='
]

{ #category : #icons }
AthensSketchPlayerToolbar class >> startIcon [
	^ startIcon
		ifNil: [ startIcon := Form
				fromBinaryStream: self startIconContents base64Decoded readStream ]
]

{ #category : #'private icons' }
AthensSketchPlayerToolbar class >> startIconContents [
	^ 'R0lGODlhEAAQANUAABZrRRhtRhluRxtvSBxwSSJ2UB9zSx9ySyBySyJ2TiV4USd6Uip9Vil6
Uyx+Vix/Vi6AVy+AVzKDWjOEXDSEXDKDWVerclircVircliqcU2nZk2nZU2mZWGvYWGwYIO+
gYO9gIO9gW21X221XpPFh5PFhni6Xnm6XaLLi6PLiqzPjv///wAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAACsALAAA
AAAQABAAAAZbwJVwSCwaj8ikkUKZKIcUlaoieUpQ2FQkkoSUviUSyfE4MkBoUGj9aTSKi4t8
nrFYMApiQcPXbDYcGwkJRQcdhx0eHgYIRwMjIiIjBARJAScmAQJPAJ1Pn6BGQQA7'
]

{ #category : #icons }
AthensSketchPlayerToolbar class >> stopIcon [
	^ stopIcon
		ifNil: [ stopIcon := Form
				fromBinaryStream: self stopIconContents base64Decoded readStream ]
]

{ #category : #'private icons' }
AthensSketchPlayerToolbar class >> stopIconContents [
	^ 'R0lGODlhEAAQAMQAAMQrLsQsLsMjKuUqMsIjKeg4QOUcKsEbJehASOhIUPKAh8AQIMEVIsAV
ItBgcMhQQMhYSMhLPchLPviwqMdFOsZFOsY9NsU1MsU1M+hQUPKOjvioqNiYmP///wAAAAAA
ACH5BAEAAB0ALAAAAAAQABAAAAVYYCeOZGmeaGpyUOu6XPlMdF0/pTRlfJ9NkRJlkigaE5NK
yTJBOJ+IiaV00Qyu2IEGUwooDOCwQQEoCazZq4ZQOkwK8Hhhcig1Nvh8nlFyLP6AgA4qhIUd
IQA7'
]

{ #category : #initialization }
AthensSketchPlayerToolbar >> defaultLayout [
	^ SpBoxLayout newLeftToRight
				  add: #startButton;
				  add: #stopButton;
				  add: #exportButton;
		  yourself
]

{ #category : #accessing }
AthensSketchPlayerToolbar >> exportButton [
	^ exportButton
]

{ #category : #initialization }
AthensSketchPlayerToolbar >> initializePresenters [

	startButton := self instantiate: SpToolbarButtonPresenter.
	pauseButton := self instantiate: SpToolbarButtonPresenter.
	stopButton := self instantiate: SpToolbarButtonPresenter.
	exportButton := self instantiate: SpToolbarButtonPresenter.
	self setStateButtons
]

{ #category : #accessing }
AthensSketchPlayerToolbar >> pauseButton [
	^ pauseButton
]

{ #category : #private }
AthensSketchPlayerToolbar >> pauseState [
	stopButton enabled: true.
	startButton
		enabled: true;
		label: 'Resume';
		icon: self class startIcon;
		action: [ self playerControl resume ]
]

{ #category : #private }
AthensSketchPlayerToolbar >> playState [
	startButton
		enabled: true;
		label: 'Pause';
		icon: self class pauseIcon;
		action: [ self playerControl pause ].
	stopButton enabled: true
]

{ #category : #accessing }
AthensSketchPlayerToolbar >> playerControl [
	^ playerControl
]

{ #category : #accessing }
AthensSketchPlayerToolbar >> playerControl: aPlayerControl [
	self unregisterPlayerControl.
	playerControl := aPlayerControl.
	self setStateButtons.
	self registerPlayerControl.
]

{ #category : #private }
AthensSketchPlayerToolbar >> registerPlayerControl [
	playerControl ifNil: [ ^ self ].
	playerControl onPlayingSend: #playState to: self.
	playerControl onStopingSend: #stopState to: self.
	playerControl onPauseSend: #pauseState to: self
]

{ #category : #initialization }
AthensSketchPlayerToolbar >> setStateButtons [

	startButton 
		label: 'Start';
		icon: self class startIcon;
		help: 'Start Execution';
		action: [ self playerControl start ];
		enabled: (playerControl notNil).
		
	stopButton 
		label: 'Stop';
		icon: self class stopIcon;
		help: 'Stop execution';
		action: [self playerControl stop];
		enabled: false.
		
	exportButton 
		label: 'Export';
		icon: Smalltalk ui icons smallSaveIcon;
		help: 'export frames';
		action: [self playerControl exportAsGIF];
		enabled: playerControl notNil.
	
]

{ #category : #accessing }
AthensSketchPlayerToolbar >> startButton [
	^ startButton
]

{ #category : #accessing }
AthensSketchPlayerToolbar >> stopButton [
	^ stopButton
]

{ #category : #private }
AthensSketchPlayerToolbar >> stopState [
	startButton
		enabled: true;
		label: 'Start';
		icon: self class startIcon;
		action: [ self playerControl start ].
	stopButton enabled: false
]

{ #category : #private }
AthensSketchPlayerToolbar >> unregisterPlayerControl [	
	playerControl ifNil:[ ^ self].
	playerControl unregisterStateListener: self.
]
