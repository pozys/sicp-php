#lang sicp

(#%require rackunit)

#| Приведенная ниже таблица называется треугольником Паскаля (Pascal’s triangle).

    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
   ...
Все числа по краям треугольника равны 1,
а каждое число внутри треугольника равно сумме двух чисел над ним.
Напишите процедуру, вычисляющую элементы треугольника Паскаля с помощью рекурсивного процесса. |#

; рекурсивный вариант
(define (solution r c)
  (if (or (= 1 c) (= r c))
      1
      (+ (solution (- r 1) c)
         (solution (- r 1) (- c 1)))))

; итеративный вариант
(define (solution-iter c dd ds q)
  (if (= c ds)
      q
      (solution-iter c (- dd 1) (+ 1 ds) (* q (/ dd ds)))))

(define (solution2 r c)
  (solution-iter c (- r 1) 1 1))


(check-equal? (solution 1 1) 1)
(check-equal? (solution 3 2) 2)
(check-equal? (solution 4 3) 3)
(check-equal? (solution 5 2) 4)
(check-equal? (solution 5 3) 6)

(check-equal? (solution2 1 1) 1)
(check-equal? (solution2 3 2) 2)
(check-equal? (solution2 4 3) 3)
(check-equal? (solution2 5 2) 4)
(check-equal? (solution2 5 3) 6)
