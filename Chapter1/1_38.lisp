#lang racket 
(define (cont-frac n d k)
  (define (cont-frac-rec n d k cnt)
    (if (= k cnt)
        (/ (n cnt) (d cnt))
        (/ (n cnt) (+ (d cnt) (cont-frac-rec n d k (+ cnt 1))))))
  (cont-frac-rec n d k 1))

(define (n i) 1)
(define (d i) 
  (if ( = 0 (remainder (- i 2) 3))
      (* 2 (+ 1 (/ (- i 2) 3)))
      1))


(define e (+ 2 (cont-frac n d 11)))
(display e)