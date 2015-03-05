"
Creates a polygon shape from a set of vertices.
Some useful factory methods on the class side.
"
Class {
	#name : #AthensLinePolygon,
	#superclass : #AthensSketchPathShape,
	#instVars : [
		'vertices',
		'closed'
	],
	#category : #'AthensSketch-Shapes'
}

{ #category : #'instance creation' }
AthensLinePolygon class >> regularSides: nSides radius: radius [
	^ self vertices: ((270 to: 270 + 359 by: 360 / nSides) collect: [ :i | Point r: radius degrees: i ])
]

{ #category : #'instance creation' }
AthensLinePolygon class >> star [
	^ self starAt: 0 @ 0 radius: 250
]

{ #category : #'instance creation' }
AthensLinePolygon class >> starAt: origin radius: radius [
	| ro ri a |
	a := 2*radius * (5 sqrt - 1) / 2.
	ro := a / 10 * (50 + (10 * 5 sqrt)) sqrt.
	ri := ro * ((5 sqrt - 1) / 2) * ((5 sqrt - 1) / 2).
	ro := ro + ri.
	ri := ro - ri.
	^ self vertices: ((90 to: 359 + 90 by: 360 / 10) collect: [ :i | origin + (Point r: (ri := ro - ri) degrees: i )])
]

{ #category : #'instance creation' }
AthensLinePolygon class >> vertices: aCollectionOfPoints [
	^ self new
		vertices: aCollectionOfPoints;
		yourself
]

{ #category : #accessing }
AthensLinePolygon >> close [
	self closed:true
]

{ #category : #accessing }
AthensLinePolygon >> closed [
	^ closed
]

{ #category : #accessing }
AthensLinePolygon >> closed: anObject [
	closed := anObject
]

{ #category : #'path builder' }
AthensLinePolygon >> computePathOn: anAthensCanvas [
	^ anAthensCanvas
		createPath: [ :builder | 
			vertices size > 1
				ifTrue: [ 
					builder
						absolute;
						moveTo: vertices first.
					vertices allButFirstDo: [ :p | builder lineTo: p ].
					closed
						ifTrue: [ builder close ] ].
			builder ]
]

{ #category : #initialization }
AthensLinePolygon >> initialize [

	super initialize.

	closed := true.
	vertices := #().
]

{ #category : #accessing }
AthensLinePolygon >> vertices [
	^ vertices
]

{ #category : #accessing }
AthensLinePolygon >> vertices: anObject [
	vertices := anObject
]
