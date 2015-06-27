#lang planet neil/sicp
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

; Write a procedure that examines a list and determines whether it contains a cycle, that
; is, whether a program that tried to find the end of the list by taking successive cdrs would go into an
; infinite loop.

(define (contains-cycle? lst)
  (define (sublist-contains-cycle? sublst seen)
    (cond ((not (pair? sublst)) #f)
          ((memq sublst seen) 
           #t)
          (else (sublist-contains-cycle? (cdr sublst) (cons sublst seen)))))
  (sublist-contains-cycle? lst '()))
           


(define x (list 'a 'b 'a 'c 'b))
(define y (make-cycle (list 'a 'b 'a 'c 'b)))

(contains-cycle? x)
(contains-cycle? y)

