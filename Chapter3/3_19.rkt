#lang planet neil/sicp

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

; we create a small loop with each encountered element.
; if we examine it again, we immediately detect the loop

(define (contains-cycle? list)
  (cond ((not (pair? list)) #t)
        ((eq? list (cdr list)) #f)
        (else 
         (let ((next (cdr list)))
           (set-cdr! list list)
           (contains-cycle? next)))))
  
  
  
(define x (list 'a 'b 'a 'c 'b))
(define y (make-cycle (list 'a 'b 'a 'c 'b)))

(contains-cycle? x)
(contains-cycle? y)