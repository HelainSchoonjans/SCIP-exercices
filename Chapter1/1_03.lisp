; to continue
(define (square-biggests x y z)
	(cond 	((and (>= x z) (>= y z))
			(+ (square x) (square y))) 
		((and (>= z x) (>= y x))
			(+ (square z) (square y))) 
		(else (+ (square x) (square z)))))