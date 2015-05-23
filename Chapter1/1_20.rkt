#lang racket
(define (test condition x y)
  (if condition
      x
      y))

(define (rem a b)
  (if (= b 0)
      0
      (remainder a b)))

(define (gcd-illus-normal a b)
  (displayln (string-append ";(gcd " (number->string a) " " (number->string b) ")"))
  (test (< b 1)
      a
      (gcd-illus-normal b (rem a b))))

(define (gcd-illus-applicative a b)
  (displayln (string-append ";(gcd " (number->string a) " " (number->string b) ")"))
  (if (= b 0)
      a
      (gcd-illus-applicative b (remainder a b))))

; a) illustrate process generated for evaluating (gcd 206 40) in normal order
;(gcd-illus-normal 206 40)
;(gcd 206 40)
;(gcd 40 6)
;(gcd 6 4)
;(gcd 4 2)
;(gcd 2 0)
;(gcd 0 0)
;(gcd 0 0)
;(gcd 0 0)
;(gcd 0 0)
;(gcd 0 0)
;(gcd 0 0)
;(gcd 0 0)
;(gcd 0 0)
;(gcd 0 0)
;(gcd 0 0)
;(gcd 0 0)
; ...

; b) indicate the remainder operations performed
;(remainder 206 40)
;(remainder 40 6)
;(remainder 6 4)
;(remainder 4 2)
; i made a function to avoid calling remainder with a second argument equal to zero

; c) how many remainder operations are performed?
; from a), 4 remainder performed

; how many operations are performed in the applicative order of evaluation?
(gcd-illus-applicative 206 40)
;(gcd 206 40)
;(gcd 40 6)
;(gcd 6 4)
;(gcd 4 2)
;(gcd 2 0)
;2

; b) indicate the remainder operations performed
;(remainder 206 40)
;(remainder 40 6)
;(remainder 6 4)
;(remainder 4 2)

; c) how many remainder operations are performed?
; from a), 4 remainder performed (the last gdc step doesn't call remainder)