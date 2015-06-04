#lang racket

(define x (list (list 1 2) (list 3 4)))

(define (reverse lst)
  (define (reverse-iter lst acc)
    (if (null? (cdr lst))
               (cons (car lst) acc)
               (reverse-iter (cdr lst) (cons (car lst) acc))))
  (reverse-iter lst '()))

(define (deep-reverse lst)
  (define (reverse-iter lst acc)
    (if (null? (cdr lst))
               (if (list? (car lst))
                    (cons (reverse-iter (car lst) '()) acc)
                    (cons (car lst) acc))
               (if (list? (car lst))
                   (reverse-iter (cdr lst) (cons (reverse-iter (car lst) '()) acc))
                   (reverse-iter (cdr lst) (cons (car lst) acc)))))
  (reverse-iter lst '()))

(define (deep-reverse2 lst)
  (define (reverse-iter lst acc)
    (let ((elt (if (list? (car lst))
                  (reverse-iter (car lst) '())
                  (car lst))))
      (if (null? (cdr lst))
          (cons elt acc)
          (reverse-iter (cdr lst) (cons elt acc)))))
  (reverse-iter lst '()))


(deep-reverse x)
(deep-reverse2 x)
;((4 3) (2 1))