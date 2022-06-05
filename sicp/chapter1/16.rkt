#lang racket

(require rackunit)
(require (only-in "general.rkt" sqrt good-enough? improve))

(define (new-if predicate then-clause else-clause)
	(cond (predicate then-clause)
		(else else-clause)))


(define (sqrt-iter-with-new-if guess x)
	(new-if (good-enough? guess x)
		guess
		(sqrt-iter-with-new-if (improve guess x)
			x)))

(define (sqrt-with-new-if x)
	(sqrt-iter-with-new-if 1.0 x))


(sqrt-with-new-if 9)

check-equal? (sqrt-with-new-if 9) (sqrt 9)