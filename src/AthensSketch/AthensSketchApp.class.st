"
An AthensSketchApp is a simple window showing an AthensSketch on a Morph
with Player controls.
"
Class {
	#name : #AthensSketchApp,
	#superclass : #SpPresenter,
	#instVars : [
		'sketch',
		'toolbar'
	],
	#category : #'AthensSketch-UI'
}

{ #category : #spec }
AthensSketchApp class >> defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :c | 
			c	add: #sketch;
				add: #toolbar height: self toolbarHeight ];
		yourself
]

{ #category : #initialization }
AthensSketchApp >> initializeWidgets [
	sketch := ASketchBasicExample new.
	toolbar := self instantiate: AthensSketchPlayerToolbar.
	toolbar playerControl: sketch player.
]

{ #category : #initialization }
AthensSketchApp >> sketch [
	^ sketch viewMorph asSpecAdapter
]

{ #category : #initialization }
AthensSketchApp >> sketch: aSketch [
	sketch := aSketch.
	toolbar playerControl: sketch player.
	self title: sketch class name.
]

{ #category : #initialization }
AthensSketchApp >> toolbar [
	^ toolbar
]
