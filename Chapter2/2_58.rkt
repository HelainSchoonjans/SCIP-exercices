#lang racket
; to contrinue

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product 
          (make-product 
           (exponent exp)
           (make-exponentiation (base exp)
                                (make-sum (exponent exp) -1)))
          (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num)
  (and (number? exp) (= exp num)))
(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (addend s) (car s))
(define (augend s)
  (caddr s))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))
(define (multiplier p) (car p))
(define (multiplicand p)
  (caddr p))

(define (exponentiation? x)
  (and (pair? x) (eq? (cadr x) '**)))
(define (base x)
  (car x))
(define (exponent x)
  (caddr x))
(define (make-exponentiation base exponent)
  (cond ((or (=number? base 1) (=number? exponent 0)) 1)
        ((=number? exponent 1) base)
        ((and (number? base) (number? exponent)) (expt base exponent))
        (else (list base '** exponent))))


;(deriv '(+ x y ) 'x)
;(deriv '(** x 1) 'x)
;(deriv '(** x 2) 'x)
;(deriv '(** (* (* x y) (+ x 3)) 2) 'x)
;(deriv '(* x (+ x 3)) 'x)

; a
(deriv '(x + y) 'x)
(deriv '(x + y ) 'x)
(deriv '(x ** 1) 'x)
(deriv '(x ** 2) 'x)
(deriv '(((x * y) * (x + 3)) **  2) 'x)
(deriv '(x * (x + 3)) 'x)
(deriv '(x + (3 * (x + (y + 2)))) 'x)

; b
(deriv '((x + 3 * (x + y + 2)) 'x)
; here, make add parenthesis to make a program that don't need parents...

