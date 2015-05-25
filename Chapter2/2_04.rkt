#lang racket
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

(car (cons "car: success" "car:failure"))
; (car (cons x y))
; (car (lambda (m) (m x y)))
; ((lambda (m) (m x y)) (lambda (p q) p))
; (lambda (x y) x)
; x CQFD

(cdr (cons "cdr: failure" "cdr: success"))
; (cdr (cons x y))
; (cdr (lambda (m) (m x y)))
; ((lambda (m) (m x y)) (lambda (p q) q))
; (lambda (x y) y)
; y CQFD