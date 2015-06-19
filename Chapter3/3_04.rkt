#lang racket

(define (make-account balance password)
  (let ((fail-count 0))
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (call-the-cops m)
    "Cops incoming!")
  (define (dispatch p m)
    (cond ((not (eq? password p)) 
             (display fail-count)
             (if (< fail-count 7)
                 (begin (set! fail-count (+ 1 fail-count))
                        (lambda (x) "Invalid password"))
                 call-the-cops))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch))





(define acc (make-account 100 'secret-password))


((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)


