Class {
	#name : #AthensSketchPackage,
	#superclass : #AthensSketchNode,
	#category : #'AthensSketch-UI'
}

{ #category : #accessing }
AthensSketchPackage class >> all [
	| packages |
	
	packages := (AthensSketch allSubclasses collect: [ :c | RPackageOrganizer default packageOf: c ]) asSet.
	^  packages 
		collect: [ :each | self for: each ] 
		as: OrderedCollection
]

{ #category : #accessing }
AthensSketchPackage >> children [

	^ (self entity definedClasses asOrderedCollection 
		select: [ :each | each inheritsFrom: AthensSketch ]
		thenCollect: [ :each | AthensSketchClass for: each ]) 
		sorted: #name ascending
]

{ #category : #accessing }
AthensSketchPackage >> iconName [

	^ #package
]

{ #category : #accessing }
AthensSketchPackage >> name [

	^  self entity packageName
]
