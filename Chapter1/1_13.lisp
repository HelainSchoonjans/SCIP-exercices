 ;to continue
(closest-int (/ (pow phi n) 5) (fib n)
(define (phi)
  (/ (+ (sqrt 5) 1) 2))
(= (* phi phi) (+ phi 1))
(define (psi)
  (/ (- (sqrt 5) 1)  2))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

;prove that (= (fib n) (/ (- (phi pow n) (psi pow n)) (sqrt 5)))


;phi = phi
;phi^2 = phi + 1
;phi^3 = (phi + 1) phi = phi +1 + phi = 2 phi +1
;phi^4 = 2 phi + 2 + phi = 3 phi + 2

;if we have a phi ^ n = Fib(n+1) phi + Fib (n)
;then phi ^ (n+1) = Fib(n+1) phi + Fib (n+1) +Fib (n) phi = Fib(n+2) phi + Fib(n+1)

;then phi ^ n = Fib(n+1) + Fib(n+1) sqrt 5 + Fib(n) = Fib(n+2) + Fib(n+1) sqrt 5

; prove the same thing for psi?