(define (f-rec n) 
  (if (< n 3)
  n
  (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3))))))

(define (f-iter n)
  (if (< n 3)
      n
      (f-iter-compute 0 1 2 (- n 2))))
(define (f-iter-compute n-3 n-2 n-1 step)
  (if (= step 0)
      n-1
      (f-iter-compute n-2 n-1 (+ n-1 (* 2 n-2) (* 3 n-3)) (- step 1))))