"
Browse AthensSketch class and show a list of ""sketch api"" methods
"
Class {
	#name : #AthensSketchEditor,
	#superclass : #SpPresenter,
	#instVars : [
		'code',
		'methods'
	],
	#category : #'AthensSketch-UI'
}

{ #category : #spec }
AthensSketchEditor class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :r | 
					r
						add: #methods height: 25;
						add: #code ];
		yourself
]

{ #category : #'instance creation' }
AthensSketchEditor class >> open: aSketchClass [
	self new setSketchClass: aSketchClass; openWithSpec
]

{ #category : #accessing }
AthensSketchEditor >> code [
	^ code
]

{ #category : #initialization }
AthensSketchEditor >> initializePresenter [
	methods whenSelectedItemChanged: [ :item | 
		item ifNotNil: [ code text: item sourceCode ] ]
]

{ #category : #initialization }
AthensSketchEditor >> initializeWidgets [
	code := self newText.
	code aboutToStyle: true.
	code acceptBlock: [ :text | self recompileWithNew: text ].
	methods := self newDropList.
	methods displayBlock: [ :item | item selector ].
	methods iconHolder: [ :item | Smalltalk ui icons protocolPublicIcon ].
	self setSketchClass: AthensSketch
]

{ #category : #accessing }
AthensSketchEditor >> methods [
	^ methods
]

{ #category : #private }
AthensSketchEditor >> recompileWithNew: aText [
	| currentMethod |
	currentMethod := methods selectedItem.
	code behavior compile: aText classified: currentMethod protocol notifying: nil
]

{ #category : #accessing }
AthensSketchEditor >> setSketchClass: aSketchClass [
	| sketchMethods |
	sketchMethods := aSketchClass methodsInProtocol: #'sketch api'.
	self title: aSketchClass name.
	sketchMethods ifEmpty: [ code text: ''. 
		methods items: #().
		^ self ].
	code text: sketchMethods first sourceCode.
	code behavior: aSketchClass.
	methods items: (sketchMethods sort: [ :a :b | a selector < b selector ])
]
