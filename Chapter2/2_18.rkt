#lang racket

(define (reverse lst)
  (define (reverse-iter lst acc)
    (if (null? (cdr lst))
               (cons (car lst) acc)
               (reverse-iter (cdr lst) (cons (car lst) acc))))
  (reverse-iter lst '()))
  
(reverse (list 23 72 149 34))
(reverse (list 1 4 9 16 25))
(reverse (reverse (list 23 72 149 34)))
(reverse (reverse (list 1 4 9 16 25)))