#lang racket

(define (count-leaves2 x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves2 (car x))
                 (count-leaves2 (cdr x))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (count-leaves t)
  (accumulate + (if (list? t)
                    (count-leaves (car t))
                    1)
              (map count-leaves (if (list? t)
                                    (cdr t)
                                    '()))))


(define x (list (list 1 2) (list 3 4)))
(count-leaves x)