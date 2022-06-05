#lang racket

(require rackunit)

(define (square a) (* a a))

(define (sum-of-squares a b) (+ (square a) (square b)))


(define (sum-of-square-two-biggest-numbers a b c) 
	(cond 
		((> a b) (if (> b c) 
			(sum-of-squares a b)
			(sum-of-squares a c)))
		((> a c) (sum-of-squares a b))
		(else (sum-of-squares b c))))

check-equal? (square 5) 25
check-equal? (square 4) 16

check-equal? (sum-of-squares 2 2) 8
check-equal? (sum-of-squares 3 5) 34

check-equal? (sum-of-square-two-biggest-numbers 1 2 3) 13
check-equal? (sum-of-square-two-biggest-numbers 5 1 3) 34
check-equal? (sum-of-square-two-biggest-numbers 4 4 6) 52 
