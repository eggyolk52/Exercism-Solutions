Class {
	#name : #Raindrops,
	#superclass : #Object,
	#category : #'Exercise@Raindrops'
}

{ #category : #'as yet unclassified' }
Raindrops >> convertNumber: anInteger [ 
	| res |
	res := '' .
	(anInteger % 3 = 0) ifTrue: [ res := res, 'Pling' ] .
	(anInteger % 5 = 0) ifTrue: [ res := res, 'Plang' ] .
	(anInteger % 7 = 0) ifTrue: [ res := res, 'Plong' ] .
	^ (res isEmpty) ifTrue: [ anInteger asString ] ifFalse: [ res ]
]
