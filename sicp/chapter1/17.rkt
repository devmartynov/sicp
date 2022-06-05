#lang racket

(require rackunit)
(require (only-in "general.rkt" improve))

(define (sqrt x)
	(sqrt-iter 0 1.0 x))

(define (sqrt-iter previous-guess guess x)
	(if (good-enough? previous-guess (improve guess x))
		guess
		(sqrt-iter guess
			(improve guess x)
			x)))

(define (good-enough? previous-guess guess)
	(< (abs (/ (- guess previous-guess) guess)) 0.00000000001))


check-equal? (sqrt 12345678901234) 3513641.8288200637
check-equal? (sqrt 9) 3.0


