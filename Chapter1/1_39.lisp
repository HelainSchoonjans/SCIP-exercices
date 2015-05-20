#lang racket
(define (tan-cf x k)
  (define (cont-frac n d k)
    (define (cont-frac-rec n d k cnt)
      (if (= k cnt)
          (/ (n cnt) (d cnt))
          (/ (n cnt) (+ (d cnt) (cont-frac-rec n d k (+ cnt 1))))))
    (cont-frac-rec n d k 1))
  (define (n i)
    (if (= i 1)
        x
        (- (* x x))))
  (define (d i)
    (+ 1 (* 2 (- i 1))))
  (cont-frac n d k))

(tan-cf 0 50)
(tan-cf 1 50)
(tan-cf 3.14 50)