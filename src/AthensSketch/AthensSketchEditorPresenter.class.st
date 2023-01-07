"
Browse AthensSketch class and show a list of ""sketch api"" methods.

```
AthensSketchEditorPresenter open: ASketchBasicExample
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
		aSelection selectedItem ifNotNil: [ :item | 
			code beForMethod: item model.
			code text: item model sourceCode ] ]
]

{ #category : #initialization }
AthensSketchEditorPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: methods
		  withConstraints: [ :constraints | constraints height: 25 ];
		  add: code;
		  yourself
]

{ #category : #initialization }
AthensSketchEditorPresenter >> initializePresenters [

	code := self newCode.
	"code aboutToStyle: true.
	code acceptBlock: [ :text | self recompileWithNew: text ]."
	methods := self newDropList.
	methods display: [ :item | item selector ].
	"methods iconHolder: [ :item | Smalltalk ui icons protocolPublicIcon ]."
	self setSketchClass: AthensSketch
]

{ #category : #accessing }
AthensSketchEditorPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: title
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
	self flag: #esteban. "how do we modify on the fly the title of the window"
	sketchMethods ifEmpty: [ 
		code text: ''.
		methods items: #(  ).
		^ self ].
	code text: sketchMethods first sourceCode.
	code behavior: aSketchClass.
	methods items:
		(sketchMethods sort: [ :a :b | a selector < b selector ])
]

{ #category : #accessing }
AthensSketchEditorPresenter >> title: aString [

	title := aString
]
