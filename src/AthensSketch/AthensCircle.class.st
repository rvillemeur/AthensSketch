"
Creates an circle path from origin and radius.
"
Class {
	#name : #AthensCircle,
	#superclass : #AthensSketchPathShape,
	#instVars : [
		'origin',
		'radius'
	],
	#category : #'AthensSketch-Shapes'
}

{ #category : #'instance creation' }
AthensCircle class >> origin:o radius: r [
	^ (self new radius: r origin: o) yourself
]

{ #category : #'instance creation' }
AthensCircle class >> radius: r origin: o [
	^ (self new radius: r origin: o) yourself
]

{ #category : #'path builder' }
AthensCircle >> computePathOn: anAthensCanvas [
	^ anAthensCanvas createPath:[: builder |
		builder absolute;
		moveTo: origin +(radius@0) ;
		cwArcTo: origin + (radius@0) negated angle: Float pi;
		cwArcTo: origin + (radius@0) angle: Float pi]
		
]

{ #category : #initialization }
AthensCircle >> initialize [
	origin := 0@0.
	radius := 1.
		
]

{ #category : #accessing }
AthensCircle >> origin: o [
	origin := o
]

{ #category : #accessing }
AthensCircle >> radius: r [
	radius := r
]

{ #category : #accessing }
AthensCircle >> radius: r origin: o [
	self radius:r.
	self origin:o.
]
