"
Shows a list of all defined AthensSketch subclasses and provide an editor and player control for code and run the current selected sketch
"
Class {
	#name : #AthensSketchBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'currentSketch',
		'editor',
		'list',
		'toolbar',
		'tree',
		'sketchEditor'
	],
	#category : #'AthensSketch-UI'
}

{ #category : #spec }
AthensSketchBrowser class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :c | 	c
						newRow:[: r | r add: #tree; addSplitter; add:#editor];
						addSplitter;
						newRow: [ :r | r add: #toolbar ] height: 32;
						newRow: [ :r | r add: #sketchEditor] ];
		yourself
]

{ #category : #open }
AthensSketchBrowser class >> open [
	<example>
	self new openWithSpec
]

{ #category : #private }
AthensSketchBrowser >> browseClassItem: item [
	item browse
]

{ #category : #private }
AthensSketchBrowser >> browseMethodItem: aSelector ofClass: aClass [
	(aClass class >> aSelector) browse
]

{ #category : #private }
AthensSketchBrowser >> browsePackageItem: item [
	Smalltalk tools browser openOnPackage: item
]

{ #category : #private }
AthensSketchBrowser >> browseSelectedElement [
	| item |
	item := tree selectedItem.
	item parentNode ifNil:[ ^ self browsePackageItem: item content].
	item content isClass ifTrue:[ ^ self browseClassItem: item content].
	self browseMethodItem: item content ofClass: item parentNode content
]

{ #category : #private }
AthensSketchBrowser >> buildMenu: aMenuModel shifted: shifted [
	aMenuModel addGroup:[: g |
		g addItem:[:item |
			item name:'refresh'.
			item action:[:i | self refreshTree].
			item icon: Smalltalk ui icons refreshIcon].
		g addItem:[:item |
			item name:'Browse'.
			item action:[:i | self browseSelectedElement].
			item icon: Smalltalk ui icons smallSystemBrowserIcon ]
		]
	
]

{ #category : #accessing }
AthensSketchBrowser >> currentSketch [
	^ currentSketch
]

{ #category : #accessing }
AthensSketchBrowser >> editor [
	^ editor
]

{ #category : #private }
AthensSketchBrowser >> hasExampleMethods: aSketchClass [
	^ (Pragma allNamed:#athensSketchExample in: aSketchClass class) notEmpty
]

{ #category : #accessing }
AthensSketchBrowser >> initialExtent [

	^   600@600
]

{ #category : #initialization }
AthensSketchBrowser >> initializeWidgets [
	list := self newList.
	tree := self newTree.
	editor := self newText.
	sketchEditor := self instantiate: AthensSketchEditor.
	toolbar := self instantiate: AthensSketchPlayerToolbar.
	tree
		roots: self sketchPackages;
		displayBlock: [ :item | item asString ].
	tree menu:[:menu :shifted | self buildMenu:menu shifted: shifted].
	self whenBuiltDo: [ self window whenClosedDo: [ self setSketchSource: nil ] ].
	self title: 'SketchBrowser'.

]

{ #category : #accessing }
AthensSketchBrowser >> list [
	^ list
]

{ #category : #private }
AthensSketchBrowser >> packageNodeFrom: aPackage [
	^ TreeNodeModel new
		content: aPackage;
		children: [ self sketchesFromPackage: aPackage ];
		hasChildren: true;
		isExpanded: true
]

{ #category : #private }
AthensSketchBrowser >> refreshTree [
	self setSketchSource: nil.
	tree roots: self sketchPackages
]

{ #category : #private }
AthensSketchBrowser >> setSketchSource: aSketch [
	self setSketchSource: aSketch selector: #new
]

{ #category : #private }
AthensSketchBrowser >> setSketchSource: aSketch selector: aSelector [
	| wasPlaying |
	wasPlaying := false.
	currentSketch
		ifNotNil: [ 
			currentSketch viewMorph delete.
			wasPlaying := currentSketch player state isPlaying ].
	aSketch
		ifNil: [ 
			self toolbar playerControl: nil.
			^ self ].
	currentSketch := aSketch perform: aSelector.
	currentSketch viewMorph openInWorld.
	self toolbar playerControl: currentSketch player.

	self sketchEditor setSketchClass: aSketch.
	self editor text: aSketch comment.
	wasPlaying ifTrue:[ currentSketch player start]
]

{ #category : #accessing }
AthensSketchBrowser >> sketchEditor [
	^ sketchEditor
]

{ #category : #accessing }
AthensSketchBrowser >> sketchEditor: anObject [
	sketchEditor := anObject
]

{ #category : #private }
AthensSketchBrowser >> sketchNodeFrom: aSketchClass [
	| tn |
	tn := TreeNodeModel new
		content: aSketchClass;
		hasChildren: (self hasExampleMethods: aSketchClass);
		children: [ self sketchesMethodsFromClass: aSketchClass ].
	tn
		whenSelectedChanged: [ :selected | 
			selected
				ifTrue: [ self setSketchSource: aSketchClass ]
				ifFalse: [ self setSketchSource: nil ] ].
	^ tn
]

{ #category : #private }
AthensSketchBrowser >> sketchNodeFromMethod: aSketchExampleMethod [
	| tn |
	tn := TreeNodeModel new
		content: aSketchExampleMethod selector;
		hasChildren: false.
	tn
		whenSelectedChanged: [ :selected | 
			selected
				ifTrue: [ self setSketchSource: aSketchExampleMethod methodClass theNonMetaClass selector: aSketchExampleMethod selector ]
				ifFalse: [ self setSketchSource: nil ] ].
	^ tn
]

{ #category : #private }
AthensSketchBrowser >> sketchPackages [
	| packages |
	packages := (AthensSketch allSubclasses collect: [ :c | RPackageOrganizer default packageOf: c ]) asSet.
	^ packages collect: [ :p | self packageNodeFrom: p ]
]

{ #category : #private }
AthensSketchBrowser >> sketchesFromPackage: aPackage [
	| sketchclasses |
	sketchclasses := aPackage classes asOrderedCollection sort: [ :a :b | a name < b name ].
	^ sketchclasses select: [ :c | c inheritsFrom: AthensSketch ] thenCollect: [ :c | self sketchNodeFrom: c ]
]

{ #category : #private }
AthensSketchBrowser >> sketchesMethodsFromClass: aSketchClass [
	| methods |
	methods := (Pragma allNamed: #athensSketchExample in: aSketchClass class)
		collect: [ :p | self sketchNodeFromMethod: p method ].
	^ methods
]

{ #category : #accessing }
AthensSketchBrowser >> toolbar [
	^ toolbar
]

{ #category : #accessing }
AthensSketchBrowser >> tree [
	^ tree
]
