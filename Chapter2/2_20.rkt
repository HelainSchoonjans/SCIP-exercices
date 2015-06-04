#lang racket

(define (same-parity first . others)
  (define (parity-iter numbers acc)
    (cond ((null? numbers)
           (cons first acc))
          ((= (remainder first 2) (remainder (car numbers) 2))
           (parity-iter (cdr numbers) (cons (car numbers) acc)))
          (else (parity-iter (cdr numbers) acc))))
  (parity-iter others '()))

(same-parity 1 2 3 4 5 6) 
(same-parity 2 3 4 5 6 7)