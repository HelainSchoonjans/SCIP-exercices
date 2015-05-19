(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (phi x) (+ 1(/ 1 x)))
(define (f x) (/ (+ (phi x) x ) 2))
 
(define (f x) (/ (log 1000) (log x)))
(define (g x) (expt x x))
(g (fixed-point f 5))
; equals 1000.009 as expected
