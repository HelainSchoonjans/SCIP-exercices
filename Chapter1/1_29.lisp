(define (cube x) (* x x x))

(define (integrate f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k 
                           h))))
  (define (next x) (+ x 2))
  (define (sum term x y)
    (if (> x y)
        0
        (+ (term x)
           (sum term (next x) y))))
  
  (define (sum-even)
    (* 2 (sum y 2 n)))
  (define (sum-odd)
    (* 4 (sum y 1 n)))
  (* (/ h 3) (+ (y 0) (sum-even) (sum-odd)))
  )

(integrate cube 0 1 100)
(integrate cube 0 1 1000)
(integrate cube 0 1 10000)