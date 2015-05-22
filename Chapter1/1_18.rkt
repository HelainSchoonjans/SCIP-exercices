#lang racket
(define (double i) (+ i i))
(define (halve i) (/ i 2))
(define (even i) (= (remainder i 2) 0))

(define (mult a b)
  (define (fast-mult a b total)
    (cond ((= b 0) total)
          ((even b) (fast-mult (double a) (halve b) total))
          (else (fast-mult a (- b 1) (+ total a)))))
  (fast-mult a b 0))

(mult 0 2)
(mult 1 1)
(mult 1 2)
(mult 5 4)
(mult 2 3)
(mult 5 5)
(mult 11 12)