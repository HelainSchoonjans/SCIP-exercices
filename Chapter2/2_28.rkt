#lang racket

(define (fringe tree)
  (cond ((not (list? tree)) (list tree))
        ((null? (cdr tree)) (fringe (car tree)))
        ((null? (car tree)) (fringe (cdr tree)))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
;(1 2 3 4)
(fringe (list x x))
;(1 2 3 4 1 2 3 4)