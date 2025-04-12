#lang sicp

(#%require rackunit)

(define (solution x y z)
  (define max-num (max x y z))
  (define min-num (min x y z))
  (define total (+ x y z))
  (+ (* max-num
        max-num)
     (* (- total
           max-num
           min-num)
        (- total
           max-num
           min-num))))

(check-equal? (solution 1 2 3) 13)
(check-equal? (solution 4 2 3) 25)
(check-equal? (solution 0 0 0) 0)
(check-equal? (solution 1 0 1) 2)
(check-equal? (solution 2 3 2) 13)