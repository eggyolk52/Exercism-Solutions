Class {
	#name : #Acronym,
	#superclass : #Object,
	#category : #'Exercise@Acronym'
}

{ #category : #'as yet unclassified' }
Acronym >> abbreviatePhrase: aString [ 
	^ '' join: ((aString substrings: {$ . $-. $_}) collect: [ :each |
		(each at: 1) asUppercase ]) .
]
