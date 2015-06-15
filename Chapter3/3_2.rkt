#lang racket
; to continue
(define (make-monitored f)
  (let ((count 0))
  (lambda (arg)
    (if (symbol? arg)
        (cond ((eq? arg 'how-many-calls?)
               count)
              ((eq? arg 'reset-count)
               (set! count 0))
              (else "Invalid symbol"))
    (begin (set! count (+ 1 count))
          (f arg))))))


(define s (make-monitored sqrt))
(s 100)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?)