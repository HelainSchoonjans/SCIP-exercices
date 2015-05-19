#lang racket
; a
(define (cont-frac n d k)
  (define (cont-frac-rec n d k cnt)
    (if (= k cnt)
        (/ (n cnt) (d cnt))
        (/ (n cnt) (+ (d cnt) (cont-frac-rec n d k (+ cnt 1))))))
  (cont-frac-rec n d k 1))

(define (good-enough? x guess)
  (< (abs (- x guess)) 0.0001))

(define res (/ 1 (cont-frac (lambda (i) 1.0) 
           (lambda (i) 1.0)
           11)))

(good-enough? res 1.61803398875)

;b
(define (cont-frac2 n d k)
  (define (cont-frac-iter n d k total)
    (if (< k 1)
        total
        (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) total)))))
  (cont-frac-iter n d k (/ (n k) (d k))))
  
(define res2 (/ 1 (cont-frac2 (lambda (i) 1.0) 
           (lambda (i) 1.0)
           11)))

(good-enough? res2 1.61803398875)