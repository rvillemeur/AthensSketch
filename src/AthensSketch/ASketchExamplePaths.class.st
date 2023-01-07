"
Shows the basic path builder commands.
"
Class {
	#name : #ASketchExamplePaths,
	#superclass : #AthensSketch,
	#category : #'AthensSketch-Examples'
}

{ #category : #'sketch api' }
ASketchExamplePaths >> drawStepOn: aCanvas [
	self clear: Color black.
	(aCanvas setStrokePaint: Color white) width:2.
	
	aCanvas drawShape:
		(aCanvas createPath:[:b | b absolute;
			moveTo: 20@20; lineTo: 280@20]).
		
	aCanvas drawShape:
		(aCanvas createPath:[:b | b absolute;
			moveTo: 20@60; 
			curveVia:30@120 to:280@60]).
		
	aCanvas drawShape:
		(aCanvas createPath:[:b | b absolute;
			moveTo: 20@100; 
			curveVia:100@180 and:200@80 to:280@100]).
		
	aCanvas drawShape:
		(aCanvas createPath:[:b | b absolute;
			moveTo: 20@140; 
			ccwArcTo:280@180 angle: Float pi /4.0]).
		
		
	aCanvas drawShape:
		(aCanvas createPath:[:b | b absolute;
			moveTo:20@220;
			lineTo: 280@220;
			cwArcTo:280@260 angle: Float pi /2.0;
			curveVia: 200@200 to: 160@260;
			curveVia: 140@280 and:100@200 to: 80@280;
			close]).
		

]
