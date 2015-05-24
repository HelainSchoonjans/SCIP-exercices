; to continue
#lang planet neil/sicp
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; ‘‘By writing the procedure like that, you have transformed the 
; (log n) process into a (n) process.’’ Explain.