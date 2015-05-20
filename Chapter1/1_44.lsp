 (define (square x)
   (* x x))
 
 (define (inc x)
   (+ 1 x))
 
 (define (compose f g)
   (lambda (x) (f (g x)))) 
 
 (define (repeated f n)
   (if (= n 1)
       (lambda (x) (f x))
       (lambda (x) (f ((repeated f (- n 1)) x)))))
 
 (define (smooth f)
   (define dx 0.001)
   (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))
 
 (define (smooth-n f n)
   (lambda (x) (((repeated smooth n) f) x)))
 
((smooth square) 5)
((smooth-n square 5) 5)
((smooth-n square 10) 5)

((smooth inc) 5)
((smooth-n inc 5) 5)
((smooth-n inc 10) 5)