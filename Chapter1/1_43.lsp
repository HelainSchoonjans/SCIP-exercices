#lang racket
(define (square x)
  (* x x))
 
(define (compose f g)
  (lambda (x) (f (g x)))) 
 
(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (lambda (x) (f ((repeated f (- n 1)) x)))))
 
((repeated square 2) 5)