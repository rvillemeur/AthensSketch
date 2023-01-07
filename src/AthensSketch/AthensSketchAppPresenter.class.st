"
An AthensSketchApp is a simple window showing an AthensSketch on a Morph
with Player controls.
"
Class {
	#name : #AthensSketchAppPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'sketch',
		'toolbar',
		'morphPresenter'
	],
	#category : #'AthensSketch-UI'
}

{ #category : #'instance creation' }
AthensSketchAppPresenter class >> open [
	<script>
	
	AthensSketchAppPresenter new 
		sketch: ASketchExampleAnimation new;
	open
]

{ #category : #initialization }
AthensSketchAppPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: morphPresenter;
		  add: toolbar;
		  yourself
]

{ #category : #initialization }
AthensSketchAppPresenter >> initializePresenters [
	
	toolbar := self instantiate: AthensSketchPlayerToolbar.
	
	morphPresenter := self instantiate: SpMorphPresenter.
	morphPresenter morph: AthensSketchMorph new
]

{ #category : #initialization }
AthensSketchAppPresenter >> sketch [
	^ sketch viewMorph asSpecAdapter
]

{ #category : #initialization }
AthensSketchAppPresenter >> sketch: aSketch [

	sketch := aSketch.
	morphPresenter morph sketch: aSketch.
	toolbar playerControl: sketch player
	"self title: sketch class name"
]

{ #category : #initialization }
AthensSketchAppPresenter >> toolbar [
	^ toolbar
]
