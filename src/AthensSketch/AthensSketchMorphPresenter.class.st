Class {
	#name : #AthensSketchMorphPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'morph',
		'morphPresenter'
	],
	#category : #'AthensSketch-UI'
}

{ #category : #layout }
AthensSketchMorphPresenter >> defaultLayout [

	^ SpBoxConstraints 
		newTopToBottom 
			add: morphPresenter;
			yourself
]

{ #category : #layout }
AthensSketchMorphPresenter >> initializePresenters [ 

	morphPresenter := self instantiate: SpMorphPresenter.
	morphPresenter morph: AthensSketchMorph new. 
]
