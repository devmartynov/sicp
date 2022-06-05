#lang racket

(require rackunit)

(provide square good-enough? average improve sqrt-iter sqrt)



(define (square a) (* a a))

(define (sum-of-squares a b) (+ (square a) (square b)))

(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.001))

(define (average x y)
	(/ (+ x y) 2))

(define (improve guess x)
	(average guess (/ x guess)))

(define (sqrt-iter guess x) 
	(if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x)
			x)))

(define (sqrt x)
	(sqrt-iter 1.0 x))

check-equal? (square 5) 25
check-equal? (square 4) 16

check-equal? (sum-of-squares 2 2) 8
check-equal? (sum-of-squares 3 5) 34

check-equal? (sqrt 3) 1.7321428571428572
check-equal? (sqrt 9) 3.00009155413138