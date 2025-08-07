Class {
	#name : #Isogram,
	#superclass : #Object,
	#category : #'Exercise@Isogram'
}

{ #category : #testing }
Isogram >> isIsogramPhrase: aString [
	| charArr |
	charArr := ((aString asArray) select: [ :char | char isAlphaNumeric ]) .
	charArr := charArr collect: [ :char | char asLowercase ] .
	^ charArr size = (charArr asSet) size
]
