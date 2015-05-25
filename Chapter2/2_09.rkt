#lang racket

(define (make-interval a b) (cons a b))
(define (lower-bound interval)
  (min (car interval) (cdr interval)))
(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (sub-interval interval other-interval)
  (make-interval (- (lower-bound interval) (upper-bound other-interval))
                 (- (upper-bound interval) (lower-bound other-interval))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; Show that the width of the sum (or difference) of two intervals is a function
; only of the widths of the intervals being added (or subtracted). 

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))
  
(= (width (add-interval (make-interval 1.0 2.0) (make-interval 3.0 3.5))) 
   (+ (width (make-interval 1.0 2.0)) (width (make-interval 3.0 3.5))))
; interval a = (a1, a2)
; interval b = (b1, b2)
; a+b = (a1+b1, a2+b2)
; width (a+b) = (a2+b2-a1-b1)/2= interval a + interval b      CQFD

; a-b = (a1-b2, a2-b1)
; width (a-b) = (a2-b1 +a1-b2) /2 = interval a - interval b   CQFD


; Give examples to show that this is not
; true for multiplication or division.

(define a (make-interval -1 1))
(define b (make-interval -1 2))
(= (* (width a) (width b)) (width (mul-interval a b)))
(= (/ (width a) (width b)) (width (div-interval a b)))

