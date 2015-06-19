#lang racket
(define (rand-update x)
  (+ 1 x))
(define random-init 0)
(define rand
  (let ((x random-init))
    (define (dispatch symbol)
      (cond ((not (symbol? symbol)) "Error not a symbol")
            ((eq? symbol 'generate) (begin
                                      (set! x (rand-update x))
                                      x))
            ((eq? symbol 'reset) (lambda (newval) (set! x newval)))
            (else "Invalid symbol")))
    dispatch))

(rand 'generate)
(rand 'generate)
(rand 'generate)

((rand 'reset) 2)
(rand 'generate)