#lang racket
; to continue

; careful this will only handle cycles, but does not solve the problem

; idea: pass a list with the already encountere pairs
; check at each iteration that we are not processing an already encountered pair
(define (count-pairs x seen-pairs)
  (if (or (not (pair? x)) (not (included-in x seen pairs)))
      0
      (+ (count-pairs (car x) (append x seen-pairs))
         (count-pairs (cdr x) (append x seen-pairs))
         1)))