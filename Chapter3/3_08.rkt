#lang racket

(define (make-z)
  (let ((acc 0)
        (curr 0))
    (lambda (x)
      (begin 
        (set! curr acc)
        (set! acc x)
        curr))))

(define f (make-z))

; will return 0 if the
; arguments to + are evaluated from left to right but will return 1 if the arguments are evaluated from
; right to left.
(+ (f 0) (f 1))
;(+ (f 1) (f 0))


