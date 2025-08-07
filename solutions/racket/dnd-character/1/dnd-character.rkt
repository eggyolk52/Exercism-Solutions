#lang racket

(provide (struct-out character)
         ability
         make-character
         modifier)

(struct character
  (strength
   dexterity
   constitution
   intelligence
   wisdom
   charisma
   hitpoints))

(define (ability)
  (apply +
         (take (sort (list (random 1 6)
                           (random 1 6)
                           (random 1 6)
                           (random 1 6))
                     >)
               3)))

(define (modifier value)
  (floor (/ (- value 10) 2)))

(define (make-character)
  (let ((constitution (ability)))
    (character
     (ability)
     (ability)
     constitution
     (ability)
     (ability)
     (ability)
     (+ (modifier constitution) 10))))
