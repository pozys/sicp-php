#lang sicp

(#%require rackunit)

(define (improve guess x)
  (/ (+ (/ x
           (*  guess guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (define improved (improve guess x))
  (> (/ (min guess improved)
        (max guess improved)) 0.9999999999))

(define (iter-root guess x)
  (if (good-enough? guess x)
      guess
      (iter-root (improve guess x)
                 x)))

(define (cube-root x)
  (iter-root 1.0 x))

(check-equal? (round (* 1000 (cube-root 8.0))) 2000.0)
(check-equal? (round (* 1000 (cube-root 1000.0))) 10000.0)
(check-equal? (round (* 1000 (cube-root 1000000000.0))) 1000000.0)
(check-equal? (round (* 1000 (cube-root 0.008))) 200.0)