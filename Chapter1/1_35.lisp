; to continue: correct the algorithm part
#lang racket
; x -> 1 + 1/x
; (1+sqrt(5))/2 -> 1 + 2/(1+sqrt(5))
; (1+sqrt(5))/2 -> (3+sqrt(5))/(1+sqrt(5))
; (1+sqrt(5))/2 -> (3+sqrt(5))*(1-sqrt(5))/((1+sqrt(5))*(1-sqrt(5)))
; (1+sqrt(5))/2 -> -(3 -2*sqrt(5)-5)/4
; (1+sqrt(5))/2 -> (2*sqrt(5)+2)/4
; (1+sqrt(5))/2 -> (1+sqrt(5))/2	SQFD

(define tolerance 0.0001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;(define (f x) (/ (+ 1 x (/ 1 x)) 2))
(define (f x) (+ 1(/ 1 x)))

(fixed-point f 3)