#lang sicp

(#%require rackunit)

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (define improved (improve guess x))
  (> (/ (min guess improved)
        (max guess improved)) 0.9999999999))

(define (iter-root guess x)
  (if (good-enough? guess x)
      guess
      (iter-root (improve guess x)
                 x)))

(define (square-root x)
  (iter-root 1.0 x))

(check-equal? (round (* 1000 (square-root 4.0))) 2000.0)
(check-equal? (round (* 1000 (square-root 100.0))) 10000.0)
(check-equal? (round (* 1000 (square-root 1000000.0))) 1000000.0)
(check-equal? (round (* 1000 (square-root 0.04))) 200.0)
(check-equal? (round (* 1000 (square-root 10000000000000000.0))) 100000000000.0)