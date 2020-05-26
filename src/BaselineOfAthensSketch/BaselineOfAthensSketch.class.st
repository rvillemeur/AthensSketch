Class {
	#name : #BaselineOfAthensSketch,
	#superclass : #BaselineOf,
	#category : #BaselineOfAthensSketch
}

{ #category : #baselines }
BaselineOfAthensSketch >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'AthensSketch']

]
