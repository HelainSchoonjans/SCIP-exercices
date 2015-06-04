#lang racket
; to continue


(define (fringe tree)
  (if (not (list? tree))
             tree
             (cons (fringe (car tree)) (fringe (cdr tree)))))      







(define x (list (list 1 2) (list 3 4)))
(fringe x)
;(1 2 3 4)
(fringe (list x x))
;(1 2 3 4 1 2 3 4)