#lang racket

(require rackunit)

(define (a-plus-abs-b a b) 
	((if (> b 0) + -) a b))

; How it works?
; 1. evaluate predicat.
; 2. if predicat is true return "+" procedure else return "-" procedure.
; 3. evaluate a and b
; 4. evaluate procedure from step2 with arguments from step 3. 

check-equal? (a-plus-abs-b 1 (- 1)) 2
