(define (square x) (* x x))
(define (f g)
	(g 2))

(f square)
(f (lambda (z) (* z (+ z 1))))
(f f)
; application: not a procedure
; expected a procedure that can be applied to arguments

; the interpreter can't apply f to an integer since f requires a function as argument.