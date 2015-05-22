#lang racket
(define (double i) (+ i i))
(define (halve i) (/ i 2))
(define (even i) (= (remainder i 2) 0))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))

(fast-mult 0 2)
(fast-mult 1 1)
(fast-mult 1 2)
(fast-mult 5 4)
(fast-mult 2 3)
(fast-mult 5 5)
(fast-mult 11 12)

