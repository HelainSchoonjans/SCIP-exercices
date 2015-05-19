#lang racket
;  x -> 1 + 1/x
; (1+sqrt(5))/2 -> 1 + 2/(1+sqrt(5))
; (1+sqrt(5))/2 -> (3+sqrt(5))/(1+sqrt(5))
; (1+sqrt(5))/2 -> (3+sqrt(5))*(1-sqrt(5))/((1+sqrt(5))*(1-sqrt(5)))
; (1+sqrt(5))/2 -> -(3 -2*sqrt(5)-5)/4
; (1+sqrt(5))/2 -> (2*sqrt(5)+2)/4
; (1+sqrt(5))/2 -> (1+sqrt(5))/2	SQFD

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (phi x) (+ 1(/ 1 x)))
(define (f x) (/ (+ (phi x) x ) 2))

(fixed-point f 3.0)
(fixed-point f 0.5)
(fixed-point f 1.6)
; gives 1.6180357080971879, 1.618037620576802, 1.6180327868852458, 
; while the golden number = 1.61803398875