(define (cube-root x)
  (cube-iter 1.0 x)) 

(define (cube-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (* 2 guess) (/ x (* guess guess))) 3))


(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cube x)
  (* x x x))

(cube-root 8)