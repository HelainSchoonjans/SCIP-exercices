(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

; for strictly positive integer values
(define (f n) (* 2 n)); 2*n
(define (g n) (if (= n 1)
                  2 
                  (f (g (- n 1))))); 2^n

(define (h n) (if (= n 1)
                  2 
                  (g (h (- n 1))))); g^n(1)
;(h 1);2^1
;(h 2);2^2^1
;(h 3);2^2^2^1
;(h 4);2^2^2^2^1
;(h 5);2^2^2^2^2^1