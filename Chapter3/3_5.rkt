#lang racket

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

 (define (random-in-range low high) 
   (let ((range (- high low))) 
     (+ low (* (random) range)))) 

;Implement Monte Carlo integration as a procedure estimate-integral that takes as arguments a
;predicate P, upper and lower bounds x1, x2, y1, and y2 for the rectangle, and the number of trials to
;perform in order to produce the estimate. Your procedure should use the same monte-carlo
;procedure that was used above to estimate . 

(define (estimate-integral P x1 x2 y1 y2)
  (define (funct) (P (random-in-range x1 x2) (random-in-range y1 y2)))
  (define rect-area (* (abs (- x1 x2)) (abs (- y1 y2))))
  (* (monte-carlo 10000 funct) rect-area))
(define (in-circle? x y)
  (define (square x)
    (* x x))
  (let ((cx 1.0)
        (cy 2.0)
        (radius 1.0))
    (< (+ (square (- x cx)) (square (- y cy))) (square radius))))
(define (P x y)
  (define (square x)
    (* x x))
  (let ((cx 5.0)
        (cy 7.0)
        (radius 3.0))
    (< (+ (square (- x cx)) (square (- y cy))) (square radius))))

;Use your estimate-integral to produce an
;estimate of by measuring the area of a unit circle.

(estimate-integral in-circle? 0 2 1 3)
(estimate-integral in-circle? 0 2 1 5)
(estimate-integral P 2.0 8.0 4.0 10.0)