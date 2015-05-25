#lang racket
(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))
(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define i (make-interval 0.89 0.76))
(lower-bound i)
(upper-bound i)