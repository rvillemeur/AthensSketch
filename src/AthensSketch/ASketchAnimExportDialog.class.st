"
Inputdialog for the animated GIF writer.
"
Class {
	#name : #ASketchAnimExportDialog,
	#superclass : #SpPresenter,
	#instVars : [
		'delayInput',
		'delayLabel',
		'endFrameInput',
		'endFrameLabel',
		'fileInput',
		'fileLabel',
		'gifExporter',
		'startFrameInput',
		'startFrameLabel'
	],
	#category : #'AthensSketch-UI'
}

{ #category : #spec }
ASketchAnimExportDialog class >> defaultSpec [
	<spec>
	^ SpecLayout composed
		newColumn: [ :c | 	c newColumn:[:cc | c
				newRow: [ :r | 	r
								add: #fileLabel;
								add: #fileInput ] height: self toolbarHeight;
				newRow: [ :r | r
								add: #startFrameLabel;
								add: #startFrameInput ] height: self toolbarHeight;
				newRow: [ :r | 	r
								add: #endFrameLabel;
								add: #endFrameInput ] height: self toolbarHeight;
				newRow: [ :r | 	r
								add: #delayLabel;
								add: #delayInput ] height: self toolbarHeight]];
		yourself
]

{ #category : #accessing }
ASketchAnimExportDialog >> delayInput [
	^ delayInput
]

{ #category : #accessing }
ASketchAnimExportDialog >> delayLabel [
	^ delayLabel
]

{ #category : #accessing }
ASketchAnimExportDialog >> endFrameInput [
	^ endFrameInput
]

{ #category : #accessing }
ASketchAnimExportDialog >> endFrameLabel [
	^ endFrameLabel
]

{ #category : #accessing }
ASketchAnimExportDialog >> endFrameLabel: anObject [
	endFrameLabel := anObject
]

{ #category : #accessing }
ASketchAnimExportDialog >> fileInput [
	^ fileInput
]

{ #category : #accessing }
ASketchAnimExportDialog >> fileLabel [
	^ fileLabel
]

{ #category : #accessing }
ASketchAnimExportDialog >> gifExporter [
	^ gifExporter
]

{ #category : #private }
ASketchAnimExportDialog >> initGifExporter [
	gifExporter := AthensSketchGIFExporter new.
	gifExporter fileName: fileInput text.
	gifExporter startFrame: (NumberParser parse: startFrameInput text).
	gifExporter endFrame: (NumberParser parse: endFrameInput text).
	gifExporter delay: (NumberParser parse: delayInput text).
	
]

{ #category : #api }
ASketchAnimExportDialog >> initialExtent [

	^ 250@(7 * self class toolbarHeight)
]

{ #category : #initialization }
ASketchAnimExportDialog >> initializeDialogWindow: aWindow [
	aWindow okAction:[ self ok]
]

{ #category : #initialization }
ASketchAnimExportDialog >> initializePresenter [
	startFrameInput whenTextIsAccepted: [ :text | NumberParser parse: text	"onError:[:ex |self inform:ex]" ].
	endFrameInput whenTextIsAccepted: [ :text | NumberParser parse: text	"onError:[:ex |self inform:ex]" ]
]

{ #category : #initialization }
ASketchAnimExportDialog >> initializeWidgets [

	fileLabel := self newLabel.
	fileLabel text: 'Filename' translated.
	fileInput := self newTextInput
		entryCompletion: nil;
		acceptOnCR;
		yourself.
	startFrameLabel := self newLabel.
	startFrameLabel text: 'Start Frame' translated.
	endFrameLabel := self newLabel.
	endFrameLabel text: 'End Frame' translated.
	startFrameInput := self newTextInput
		entryCompletion: nil;
		yourself.
	endFrameInput := self newTextInput
		entryCompletion: nil;
		yourself.
	delayInput := self newTextInput
		entryCompletion: nil;
		yourself.
	delayLabel := self newLabel.
	delayLabel text: 'delay (1/100 sec)' translated.
	self focusOrder add: fileInput; add: startFrameInput; add: endFrameInput; add: delayInput.
	self title:'Export as Animated GIF'.
]

{ #category : #actions }
ASketchAnimExportDialog >> ok [
	fileInput accept.
	[ startFrameInput accept ]
		on: Exception
		do: [ :ex | 
			UIManager default alert: ex messageText title: startFrameLabel label.
			^ false ].
	[ endFrameInput accept ]
		on: Exception
		do: [ :ex | 
			UIManager default alert: ex messageText title: endFrameLabel label.
			^ false ].
	[ delayInput accept ]
		on: Exception
		do: [ :ex | 
			UIManager default alert: ex messageText title: delayLabel label.
			^ false ].
	self initGifExporter.
	gifExporter startFrame > gifExporter endFrame
		ifTrue: [ 
			UIManager default alert: 'Last frame must not be lower than first frame' translated title: 'Invalid input'.
			^ false ].
	^ true
]

{ #category : #accessing }
ASketchAnimExportDialog >> startFrameInput [
	^ startFrameInput
]

{ #category : #accessing }
ASketchAnimExportDialog >> startFrameLabel [
	^ startFrameLabel
]
