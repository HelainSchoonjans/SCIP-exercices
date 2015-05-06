(define (square x) (* x x))

(define (myproc x y z) 
(cond (and (>= x y) (>= y z)) 
	(+ (square x) (square y)) 
	(else (cond (and (>= x y) (>= z y)) 
		(+ (square x) (square z)) 
		(else (cond (and (>= y x) (>= z x)) 
			(+ (square y) (square z)) (else ())))))))