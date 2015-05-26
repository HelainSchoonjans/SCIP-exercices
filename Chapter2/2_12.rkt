#lang racket

(define (make-interval a b) (cons a b))
(define (lower-bound interval)
  (min (car interval) (cdr interval)))
(define (upper-bound interval)
  (max (car interval) (cdr interval)))
(define (make-center-percent c tolerance)
  (make-interval (- c (* c (/ tolerance 100))) (+ c (* c (/ tolerance 100)))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
; uncertainty = width / midpoint
; must return a percentage
(define (percent interval)
  (* 100 (/ (width interval) (center interval))))

(percent (make-center-percent 10 10))