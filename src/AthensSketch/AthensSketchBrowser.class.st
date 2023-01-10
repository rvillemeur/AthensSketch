"
Shows a list of all defined AthensSketch subclasses and provide an editor and player control for code and run the current selected sketch

AthensSketchBrowser open
"
Class {
	#name : #AthensSketchBrowser,
	#superclass : #SpPresenter,
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
AthensSketchBrowser class >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		  add: (SpPanedLayout newLeftToRight
				   add: #tree;
				   add: #editor;
				   yourself);
		  add: (SpBoxLayout newTopToBottom
				   add: #toolbar expand: false;
				   add: #sketchEditor;
				   yourself);
		  yourself
]

{ #category : #open }
AthensSketchBrowser class >> open [

	<example>
	self new open
]

{ #category : #'class initialization' }
AthensSketchBrowser class >> worldMenu: aBuilder [
	<worldMenu>
	(aBuilder item: #'Athens sketch')
		parent: #Tools;
		action: [ self open ];
		order: 25;
		help: 'practice your drawing with Athens';
		icon: (self iconNamed: #paint).
	aBuilder withSeparatorAfter
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

{ #category : #initialization }
AthensSketchBrowser >> connectPresenters [

	tree whenSelectedItemChangedDo: [ :item | self updateSourceWith: item ]
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
AthensSketchBrowser >> initializePresenters [

	list := self newList.

	editor := self newText.
	sketchEditor := self instantiate: AthensSketchEditorPresenter.
	toolbar := self instantiate: AthensSketchPlayerToolbar.

	tree := self newTree.
	tree display: [ :item | item name ].
	tree displayIcon: [ :item | self iconNamed: item iconName ].
	tree
		roots: self sketchPackages;
		children: [ :aNode | aNode children ]
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

	^ AthensSketchPackage all
]

{ #category : #private }
AthensSketchBrowser >> sketchesFromPackage: aPackage [
	| sketchclasses |
	
	^  (aPackage definedClasses asOrderedCollection 
		select: [ :each | each inheritsFrom: AthensSketch ])
		sorted: #name ascending
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

{ #category : #private }
AthensSketchBrowser >> updateSourceWith: anItem [

	anItem ifNil: [  ].
	
	" self
					setSketchSource: aSketchExampleMethod methodClass theNonMetaClass
					selector: aSketchExampleMethod selector ]"
]
