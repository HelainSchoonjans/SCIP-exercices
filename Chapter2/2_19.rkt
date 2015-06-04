#lang racket

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))


(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? lst)
  (null? lst))

(define (reverse lst)
  (define (reverse-iter lst acc)
    (if (null? (cdr lst))
               (cons (car lst) acc)
               (reverse-iter (cdr lst) (cons (car lst) acc))))
  (reverse-iter lst '()))


(cc 100 us-coins)
(cc 100 uk-coins)

(cc 100 (reverse us-coins))
; the order of the coins does not influence the number of combinations possible