(define (square x)
  (* x x))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(good-enough? 10000.0000001 100000000.0)
(good-enough? 0.01 0.000000000000001)

; as we can see in the examples, the test will fail for big guesses even for a tiny difference between the guess and the solution, 
; the error will make a difference when the guess is squared...

; for small numbers, the test will be satisfied too soon, making sometimes a huge relative error.

(define (square-root x)
  (define (improve guess x)
    (define (average x y)
      (/ (+ x y) 2.0))
    (average guess (/ x guess)))
  (define (relatively-good-enough? guess x)
    (let ((dif (abs (- guess x))))
      (< dif (* x 0.01))))
  (define (sqrt-iter guess x)
    (if (relatively-good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(square-root 100000000.0)
(square-root 0.000000000000001)
(square-root 3.0)