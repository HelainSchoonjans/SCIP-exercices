#lang racket
; Define a constructor
; make-segment and selectors start-segment and end-segment that define the representation
; of segments in terms of points.

(define (make-segment first-point second-point)
  (cons first-point second-point))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

; Furthermore, a point can be represented as a pair of numbers: the x
; coordinate and the y coordinate. Accordingly, specify a constructor make-point and selectors
; x-point and y-point that define this representation.

(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

; Finally, using your selectors and
; constructors, define a procedure midpoint-segment that takes a line segment as argument and
; returns its midpoint (the point whose coordinates are the average of the coordinates of the endpoints).

(define (average x y)
  (/ (+ x y) 2))
(define (midpoint-segment segment)
  (define (midpoint-to-points first-point second-point)
    (make-point (average (x-point first-point) (x-point second-point)) 
                (average (y-point first-point) (y-point second-point))))
  (midpoint-to-points (start-segment segment) (end-segment segment)))


; To try your procedures, you’ll need a way to print points:
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(midpoint-segment (make-segment (make-point 1.0 1.0) (make-point 2.0 2.0)))