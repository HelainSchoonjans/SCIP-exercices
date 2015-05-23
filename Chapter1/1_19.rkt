#lang racket
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 q p) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)

; a+1 <- bq +aq +ap
; b+1 <- bp + aq

; a+2 <- b(pq+qq+pq)+a(pq+qq+pq)+a(qq+pp)
; b+2 <- b(pp+qq) + a(qp+qq+qp)
; p' <- pp+qq
; q' <- qp+qq+qp