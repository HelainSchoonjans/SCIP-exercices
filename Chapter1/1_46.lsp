; continue
#lang racket
(define (iterative-improve good-enough? improve)
  (lambda (x) (let ((guess (improve x)))
                (if (good-enough? x guess)
                  x
                  ((iterative-improve good-enough? improve) guess)))))

(define (sqrt x)
  ((iterative-improve () ()) x))