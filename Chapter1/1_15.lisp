#lang racket
(define (cube x) (* x x x))
(define (p x) 
  (displayln "p has been applied")
  (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; a)
(sine 12.15)
; the procedure p has been applied five times
; this is the number of times you must divide 12.15 to obtain a number smaller than 0.1
; 12.15 divided by 3^5 is equal to 0.05

; b)
; the order of growth in both space and number of steps grows logarithmically with a.
; (sine a) = (O (log_3 a))