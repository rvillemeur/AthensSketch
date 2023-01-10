Class {
	#name : #AthensSketchMorphPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'morph',
		'morphPresenter'
	],
	#category : #'AthensSketch-UI'
}

{ #category : #'instance creation' }
AthensSketchMorphPresenter class >> open [ 

	<script>
	self new open
]

{ #category : #layout }
AthensSketchMorphPresenter >> defaultLayout [

	^ SpBoxLayout
		newTopToBottom 
			add: morphPresenter;
			yourself
]

{ #category : #layout }
AthensSketchMorphPresenter >> initializePresenters [

	morphPresenter := self newMorph.
	morphPresenter morph: AthensSketchMorph new
]
