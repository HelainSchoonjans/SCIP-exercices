#lang racket
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
(test 0 (p))
; On an interpreter that uses the applicative order of evalation, 
; the evaluating the expression will result into an infinite recursion during the evaluation.

; On an evaluator that uses the normal order of evaluation, the expression would be evaluated to 0.