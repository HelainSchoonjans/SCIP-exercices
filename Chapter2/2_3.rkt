; to continue
; could be improved
#lang racket
(define (make-segment first-point second-point)
  (cons first-point second-point))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

(define (average x y)
  (/ (+ x y) 2))
(define (midpoint-segment segment)
  (define (midpoint-to-points first-point second-point)
    (make-point (average (x-point first-point) (x-point second-point)) 
                (average (y-point first-point) (y-point second-point))))
  (midpoint-to-points (start-segment segment) (end-segment segment)))

; Implement a representation for rectangles in a plane. (Hint: You may want to make use
; of exercise 2.2.) In terms of your constructors and selectors, create procedures that compute the
; perimeter and the area of a given rectangle.
(define (square x)
  (* x x))
(define (x-diff segment)
  (abs (- (x-point (start-segment segment)) (x-point (end-segment segment)))))
(define (y-diff segment)
  (abs (- (y-point (start-segment segment)) (y-point (end-segment segment)))))
(define (len segment)
  (sqrt (+ (square (x-diff segment)) (square (y-diff segment)))))

(define (make-rect p1 p2 p3)
  (cons (make-segment p1 p2) (make-segment p2 p3)))

(define (first-side-length rect)
  (len (car rect)))
(define (second-side-length rect)
  (len (car rect)))
(define (perimeter rect)
  (* 2 (+ (first-side-length rect) (second-side-length rect))))
(define (area rect)
  (* (first-side-length rect) (second-side-length rect)))
  

(make-rect (make-point 1 1) (make-point 1 2) (make-point 2 2))
(perimeter (make-rect (make-point 1 1) (make-point 1 2) (make-point 2 2)))
(area (make-rect (make-point 1 1) (make-point 1 2) (make-point 2 2)))

; Now implement a different representation for rectangles.

; first idea: use 2 segments
; use four segments
; second: use 3 points
; use four points
; use one segment: two points only to describe the rectangle (but what if we want rectangles that do not have sides parallel to the axes?)
(define (make-rect2 p1 angle length width )
  (cons p1 (cons angle (cons length (cons width '())))))
(define (rect-length rect)
  (caddr rect))
(define (rect-width rect)
  (cadddr rect))
(define (first-side-length2 rect)
  (rect-length rect))
(define (second-side-length2 rect)
  (rect-width rect))

(define (perimeter2 rect)
  (* 2 (+ (first-side-length2 rect) (second-side-length2 rect))))
(define (area2 rect)
  (* (first-side-length2 rect) (second-side-length2 rect)))

(make-rect2 (make-point 1 1) 0 1 1)
(perimeter2 (make-rect2 (make-point 1 1) 0 1 1))
(area2 (make-rect2 (make-point 1 1) 0 1 1))
; Can you design your system with suitable abstraction barriers, so that the same perimeter and area
; procedures will work using either representation?

; this implementation doesn't keep all the information... but we have what we need for the area and perimeters functions
; we could improve this function by keeping and additional parameter angle, for the orientation of the rectangle, and keep only
; the top-left point to avoid ambiguity
(define (make-rect3 p1 p2 p3)
  (cons p1 (cons (len (make-segment p1 p2)) (cons (len (make-segment p2 p3)) '()))))
(define (rect-length2 rect)
  (cadr rect))
(define (rect-width2 rect)
  (caddr rect))
(define (first-side-length3 rect)
  (rect-length2 rect))
(define (second-side-length3 rect)
  (rect-width2 rect))

(define (perimeter3 rect)
  (* 2 (+ (first-side-length3 rect) (second-side-length3 rect))))
(define (area3 rect)
  (* (first-side-length3 rect) (second-side-length3 rect)))

(make-rect3 (make-point 1 1) (make-point 1 2) (make-point 2 2))
(perimeter3 (make-rect3 (make-point 1 1) (make-point 1 2) (make-point 2 2)))
(area3 (make-rect3 (make-point 1 1) (make-point 1 2) (make-point 2 2)))


