"
Base class for some convenient Athens path based shape classes.
Subclasses like (f.ex. AthensCircle ) provide an easy interface for creating these
shapes with AthensCanvas' pathBuilder.
"
Class {
	#name : #AthensSketchPathShape,
	#superclass : #AthensShape,
	#category : #'AthensSketch-Shapes'
}

{ #category : #'path builder' }
AthensSketchPathShape >> computePathOn: anAthensCanvas [
	self subclassResponsibility 
]

{ #category : #drawing }
AthensSketchPathShape >> paintFillsUsing: aPaint on: anAthensCanvas [
	"This method is a part of rendering dispatch  Canvas->receiver->paint"
	|path|
	path := self computePathOn: anAthensCanvas.
	^ aPaint athensFillPath: path on: anAthensCanvas
]
