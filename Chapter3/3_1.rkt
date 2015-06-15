#lang racket
(define (make-accumulator value)
  (lambda (input)
    (begin (set! value (+ input value))
           value)))


(define A (make-accumulator 5))
(A 10)
(A 10)