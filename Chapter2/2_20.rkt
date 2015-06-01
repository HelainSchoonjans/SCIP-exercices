; to continue
#lang planet neil/sicp
(define (same-parity x . y)
  (define (same-parity-rec x y)
    (display (car y))
    (display (cdr y))
    (display (remainder x 2))
    (display (remainder (car y) 2))
    (cond ((null? y) x)
          ((= (remainder x 2) (remainder (car y) 2)) (cons (car y) (same-parity x (cdr y))))
          (else (same-parity x (cdr y)))))
  (same-parity-rec x y))


(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)