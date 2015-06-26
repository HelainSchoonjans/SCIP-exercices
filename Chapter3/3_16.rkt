#lang racket
; to continue

; 3
(list 'a 'b 'c)

; 4
(define x (list 'a))
(define y (list 'b x))
(define z (list 'c x))
(set-cdr! y z)

; or
(list (set-cdr! (list 'a) ...) ())





; never at all:
(make-cycle (list 'a 'b 'c))

