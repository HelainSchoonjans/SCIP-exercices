#lang racket
(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square x)
  (* x x))

(define (square-list1 items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list1 (cdr items)))))
(define (square-list2 items)
  (map square items))

(define lst (list 1 2 3 4 5))

(square-list1 lst)
(square-list2 lst)