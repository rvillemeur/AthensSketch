"
Defines a *circular* arc shape
"
Class {
	#name : #AthensArc,
	#superclass : #AthensSketchPathShape,
	#instVars : [
		'origin',
		'radius',
		'startRadians',
		'stopRadians'
	],
	#category : #'AthensSketch-Shapes'
}

{ #category : #'instance creation' }
AthensArc class >> origin: origin radius: radius startRadians: startAngle stopRadians: stopAngle [
	^ self new
		origin: origin;
		radius: radius;
		startRadians: startAngle;
		stopRadians: stopAngle;
		yourself
]

{ #category : #'path builder' }
AthensArc >> computePathOn: anAthensCanvas [
	| path arcStart arcStop angle |
	angle := stopRadians - startRadians.
	arcStart := (radius * startRadians cos) @ (radius * startRadians sin).
	arcStop := (radius * stopRadians cos) @ (radius * stopRadians sin).
	path := anAthensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: origin;
				lineTo: arcStart + origin;
				cwArcTo: arcStop + origin angle: stopRadians - startRadians ].
	^ path
]

{ #category : #initialization }
AthensArc >> initialize [
	origin := 0@0.
	radius := 100.
	startRadians := Float halfPi.
	stopRadians := Float pi.
	
]

{ #category : #accessing }
AthensArc >> origin [
	^ origin
]

{ #category : #accessing }
AthensArc >> origin: anObject [
	origin := anObject
]

{ #category : #accessing }
AthensArc >> radius [
	^ radius
]

{ #category : #accessing }
AthensArc >> radius: anObject [
	radius := anObject
]

{ #category : #accessing }
AthensArc >> startRadians [
	^ startRadians
]

{ #category : #accessing }
AthensArc >> startRadians: anObject [
	startRadians := anObject
]

{ #category : #accessing }
AthensArc >> stopRadians [
	^ stopRadians
]

{ #category : #accessing }
AthensArc >> stopRadians: anObject [
	stopRadians := anObject
]
