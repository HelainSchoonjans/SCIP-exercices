#lang racket
; to continue

; find all triples
; keep those that whose sum is equal to s
(define (find-triples n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (map (lambda (k)
                             (list i j k))
                           (enumerate-interval 1 (- j 1))))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (triple-sum-to? triple s)
  (= s (+ (car triple) (cadr triple) (caddr triple))))
  
(filter (lambda (x) (triple-sum-to? x s)))
  
  