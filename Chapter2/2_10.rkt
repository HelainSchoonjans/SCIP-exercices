#lang racket
(define (make-interval a b) (cons a b))
(define (lower-bound interval)
  (min (car interval) (cdr interval)))
(define (upper-bound interval)
  (max (car interval) (cdr interval)))
(define (spans-zero? i)
  (and (not (> (lower-bound i) 0)) (not (< (upper-bound i) 0))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (spans-zero? y)
      (displayln "Error, dividing by an interval spanning 0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))


(define a (make-interval -1 1))
(define b (make-interval -1 2))
(div-interval a b)