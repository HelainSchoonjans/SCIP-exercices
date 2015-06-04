#lang racket

(define (last-pair lst)
  (if (null? (cdr lst))
      lst ;  (car lst) if we want the last element only
      (last-pair (cdr lst))))


(last-pair (list 23 72 149 34))