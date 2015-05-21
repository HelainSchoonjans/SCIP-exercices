#lang racket
(define (good-enough? guess y)
  (define (square x)
    (* x x))
  (let ((tolerance 0.001))
  (< (abs (- (square guess) y)) tolerance)))

(define (improve guess number)
  (define (average x y)
    (/ (+ x y) 2.0))
  (average guess (/ number guess)))

(define (sqrt x)
  (define (iterative-improve good-enough? improve)
    (lambda (guess target)
      (if (good-enough? guess target)
          guess
          ((iterative-improve good-enough? improve) (improve guess target) target))))
  ((iterative-improve good-enough? improve) 1 x))

(sqrt 1)
(sqrt 4)
(sqrt 9)
(sqrt 16)