;#lang planet neil/sicp
#lang racket
; use '() or nil depending on the language

(define a (list 1 2 3 4))
a
(cons 1
      (cons 2
            (cons 3
                  (cons 4 '()))))


(car a)
(cdr a)
(car (cdr a))



