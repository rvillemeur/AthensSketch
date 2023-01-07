"
Simple Line shape
"
Class {
	#name : #AthensLine,
	#superclass : #AthensSketchPathShape,
	#instVars : [
		'start',
		'end'
	],
	#category : #'AthensSketch-Shapes'
}

{ #category : #'instance creation' }
AthensLine class >> from: aPoint to: aSecondPoint [
	^ self new
		start: aPoint;
		end: aSecondPoint;
		yourself
]

{ #category : #'path builder' }
AthensLine >> computePathOn: anAthensCanvas [
	^ anAthensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: start;
				lineTo: end ]
]

{ #category : #accessing }
AthensLine >> end [
	^ end
]

{ #category : #accessing }
AthensLine >> end: anObject [
	end := anObject
]

{ #category : #accessing }
AthensLine >> start [
	^ start
]

{ #category : #accessing }
AthensLine >> start: anObject [
	start := anObject
]
