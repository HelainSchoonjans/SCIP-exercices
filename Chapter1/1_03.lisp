(define (square-big-ones x y z)
  (define (square x) (* x x))
  (cond ((and (>= x z) (>= y z))
         (+ (square x) (square y))) 
        ((and (>= z x) (>= y x))
         (+ (square z) (square y))) 
        (else (+ (square x) (square z)))))


(define (square-big-ones2 x y z)
  (define (square x) (* x x))
  (define (biggest x y) 
    (if (> x y)
        x
        y))
  (define (smallest x y)
    (if (< x y)
        x
        y))
  (+ (square (biggest x y))
     (square (biggest(smallest x y) z))))


(square-big-ones 1 2 3)
(square-big-ones2 1 2 3)