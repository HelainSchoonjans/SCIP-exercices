#lang racket

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (cond ((not (eq? password p)) (lambda (x) "Invalid password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
dispatch)

(define (make-joint acc pass newpass)
  (define (dispatch p m)
    (cond ((eq? p newpass)
           (acc pass m))
          (else (lambda (x) "Invalid password")
                )))
  dispatch)

(define acc (make-account 100 'secret-password))


((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)


(define peter-acc (make-account 100 'open-sesame))

(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))

((paul-acc 'rosebud 'withdraw) 50)
((paul-acc 'rosebud 'withdraw) 10)
((paul-acc 'ilovestuff 'withdraw) 50)
