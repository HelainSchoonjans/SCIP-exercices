#lang racket
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
      (cons x set))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

; you can also use append...
(define (union-set s1 s2)
  (cond ((null? s2) s1)
        (else (union-set (adjoin-set (car s2) s1) (cdr s2)))))


(define set1 (list 1 2 3))
(define set2 (list 3 4 5))
(intersection-set set1 set2)
(union-set set1 set2)