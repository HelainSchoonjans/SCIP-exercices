#lang racket
; In short, the order of evaluation will determine the result.

; Since Scheme uses the applicative order of evaluation, all 
; arguments will be evaluated. Since the function call itself, 
; infinite recursion will happen.

; With the applicative order of evaluation, the recursive call
; is avoided.

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (define (square x) (* x x))
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))


(sqrt 10)