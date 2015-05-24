#lang racket
; Define a better version of make-rat that handles both positive and negative
; arguments. Make-rat should normalize the sign so that if the rational number is positive, both the
; numerator and denominator are positive, and if the rational number is negative, only the numerator is
; negative.

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
    (if (< (* n d) 0)
        (cons (- (/ (abs n) g)) (/ (abs d) g))
        (cons (/ (abs n) g) (/ (abs d) g)))))
  

(make-rat 1 2)
(make-rat -1 -2)
(make-rat -1 2)
(make-rat 0 -1)
(make-rat -1 0)
(make-rat 3 4)