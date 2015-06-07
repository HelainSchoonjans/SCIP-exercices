#lang racket
(define (square x)
  (* x x))
(define (square-tree tree factor)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree) factor)
                    (square-tree (cdr tree) factor)))))

(define (square-tree2 tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree2 sub-tree factor)
             (square sub-tree)))
       tree))


(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)) 10)
(square-tree2 (list 1 (list 2 (list 3 4) 5) (list 6 7)) 10)

