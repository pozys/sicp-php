#lang sicp

(#%require rackunit)

#| Функция f определяется правилом:
f(n) = n , если n < 3 , и f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) , если n ≥ 3 .
Напишите процедуру f , вычисляющую f с помощью рекурсивного процесса.
Напишите процедуру f-iter , вычисляющую f с помощью итеративного процесса. |#

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (calc x y z) (+ x (* 2 y) (* 3 z)))

(define (f-iter-recursive x y z threshold)
  (if (< threshold 3)
      x
      (f-iter-recursive (calc x y z)
                        x
                        y
                        (- threshold 1))))

(define (f-iter n)
  (if (< n 3)
      n
      (f-iter-recursive 2 1 0 n)))

(check-equal? (f 4) 11)
(check-equal? (f-iter 4) 11)
(check-equal? (f 3) 4)
(check-equal? (f-iter 1) 1)