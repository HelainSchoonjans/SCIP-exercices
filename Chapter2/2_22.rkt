#lang racket


; cons will add the current element in the first position of the list
; when squaring (1 2) for example, he will make (cons 1 '()) then add 2*2 in first position:
; (cons 4 (cons 1 '())) resulting in (cons 4 1)



(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(define (square x)
  (* x x))

(square-list (list 1 2 3))
; as we can see, he appends a list to a number. This does not create a proper list.

; a better solution to his problem would be to make a reverse on the list, using his first solution
