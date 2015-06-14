#lang racket


(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x s2)
  (cond ((null? s2)
         (cons x '()))
        ((< x (car s2))
         (cons x s2))
        ((= x (car s2))
         s2)
        (else (cons (car s2) (adjoin-set x (cdr s2))))))
            


(adjoin-set 5 (list 2 4 6 8 10))
(adjoin-set 1 (list 2 4 6 8 10))
(adjoin-set 11 (list 2 4 6 8 10))