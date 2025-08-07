Class {
	#name : #SpaceAge,
	#superclass : #Object,
	#category : #'Exercise@SpaceAge'
}

{ #category : #'as yet unclassified' }
SpaceAge >> ageOnPlanet: aString at: anInteger [ 
	| planets |
	planets := Dictionary newFrom: {
		'Earth' -> 1 .
		'Mercury' -> 0.2408467 .
		'Venus' -> 0.61519726 .
		'Mars' -> 1.8808158 .
		'Jupiter' -> 11.862615 .
		'Saturn' -> 29.447498 .
		'Uranus' -> 84.016846 .
		'Neptune' -> 164.79132 .
	} .
	
	^ anInteger / 60 / 60 / 24 / 365.25 / (planets at: aString) asFloat .
]
