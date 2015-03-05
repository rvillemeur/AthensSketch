"
redraws the morphs under the active hand with Athens.
"
Class {
	#name : #ASketchExampleMirrorHand,
	#superclass : #AthensSketch,
	#category : #ASketchExamples
}

{ #category : #'instance creation' }
ASketchExampleMirrorHand class >> exampleOpen [
	self openPlayer
]

{ #category : #'sketch api' }
ASketchExampleMirrorHand >> drawStepOn: aCanvas [
	| rect |
	rect := (ActiveHand position extent: self extent) translateBy: self extent / 2.0 negated.
	self clear: Color white.
	(World submorphs select: [ :m | m bounds intersects: rect ])
		reverseDo: [ :d | 
			aCanvas pathTransform
				restoreAfter: [ 
					aCanvas pathTransform translateBy: rect topLeft negated.
					aCanvas clipBy: rect during: [ d fullDrawOnAthensCanvas: aCanvas ] ] ]
]
