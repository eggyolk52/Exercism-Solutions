Class {
	#name : #RomanNumerals,
	#superclass : #Object,
	#category : #'Exercise@RomanNumerals'
}

{ #category : #'as yet unclassified' }
RomanNumerals >> romanNumber: anInteger [
	| res num romans order |
	res := '' .
	num := anInteger .
	order := #(1000 900 500 400 100 90 50 40 10 9 5 4 1) .
	romans := Dictionary newFrom: { 
		1    -> 'I' .
		4    -> 'IV' .
		5    -> 'V' .
		9    -> 'IX' .
		10   -> 'X' .
		40   -> 'XL' .
		50   -> 'L' .
		90   -> 'XC' .
		100  -> 'C' .
		400  -> 'CD' .
		500  -> 'D' .
		900  -> 'CM' .
		1000 -> 'M' .
	} .

	order do: [ :orderN | 
		[ orderN <= num ] whileTrue: [ res := res, (romans at: orderN) . num := num - orderN ]
	] .

	^ res
]
