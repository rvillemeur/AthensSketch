"
Browse AthensSketch class and show a list of ""sketch api"" methods.

```
AthensSketchEditor open: ASketchBasicExample
```
"
Class {
	#name : #AthensSketchEditorPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'code',
		'methods',
		'title'
	],
	#category : #'AthensSketch-UI'
}

{ #category : #spec }
AthensSketchEditorPresenter class >> defaultLayout [

	^ SpBoxLayout newTopToBottom 
				  add: #methods;
				  add: #code;
		  yourself
]

{ #category : #'instance creation' }
AthensSketchEditorPresenter class >> open: aSketchClass [

	self new
		setSketchClass: aSketchClass;
		open
]

{ #category : #accessing }
AthensSketchEditorPresenter >> code [
	^ code
]

{ #category : #initialization }
AthensSketchEditorPresenter >> connectPresenters [

	"methods whenSelectedItemChanged: [ :item | 
		item ifNotNil: [ code text: item sourceCode ] ]"
	
	methods whenSelectionChangedDo: [ :aSelection | 
		aSelection selectedItem ifNotNil: [:item | code text: item model sourceCode ] ]
]

{ #category : #initialization }
AthensSketchEditorPresenter >> initializePresenters [

	code := self newText.
	"code aboutToStyle: true.
	code acceptBlock: [ :text | self recompileWithNew: text ]."
	methods := self newDropList.
	methods display: [ :item | item selector ].
	"methods iconHolder: [ :item | Smalltalk ui icons protocolPublicIcon ]."
	self setSketchClass: AthensSketch
]

{ #category : #accessing }
AthensSketchEditorPresenter >> methods [
	^ methods
]

{ #category : #private }
AthensSketchEditorPresenter >> recompileWithNew: aText [
	| currentMethod |
	currentMethod := methods selectedItem.
	code behavior compile: aText classified: currentMethod protocol notifying: nil
]

{ #category : #accessing }
AthensSketchEditorPresenter >> setSketchClass: aSketchClass [
	| sketchMethods |
	sketchMethods := aSketchClass methodsInProtocol: #'sketch api'.
	self title: aSketchClass name.
	sketchMethods ifEmpty: [ code text: ''. 
		methods items: #().
		^ self ].
	code text: sketchMethods first sourceCode.
	"code behavior: aSketchClass."
	methods items: (sketchMethods sort: [ :a :b | a selector < b selector ])
]

{ #category : #accessing }
AthensSketchEditorPresenter >> title: aString [

	title := aString
]
