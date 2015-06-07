#lang racket
; to continue

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))
(define (transpose mat)
  (accumulate-n cons '() mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (map (lambda (y) (dot-product x y)) cols)) m)))

(define x (list 
           (list 1 2 3 4) 
           (list 5 6 7 8) 
           (list 2 10 11 12)))
(define y (list 1 2 3 4))
(define z (list 
           (list 5 6 7) 
           (list 5 6 7) 
           (list 5 6 3) 
           (list 1 1 1)))
(define m (list 
           (list 1 0 0) 
           (list 0 1 0) 
           (list 0 0 1)))
(matrix-*-vector x y)
(transpose x)
(matrix-*-matrix x z)
(matrix-*-matrix z m)