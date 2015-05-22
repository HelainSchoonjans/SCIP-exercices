;to continue
#lang racket

; depth-first traversal of the tree
;  amount: 11 - kind of coins: 5
; - amount: 11 - kind of coins: 4
; -- amount: 11 - kind of coins: 3
; --- amount: 11 - kind of coins: 2
; ---- amount: 11 - kind of coins: 1
; ----- amount: 11 - kind of coins: 0
; ----- amount: 10 - kind of coins: 1
; ------ amount: 10 - kind of coins: 0
; ------ amount: 9 - kind of coins: 1
; ------- amount: 9 - kind of coins: 0
; ------- amount: 8 - kind of coins: 1
; -------- amount: 8 - kind of coins: 0
; -------- amount: 7 - kind of coins: 1
; --------- amount: 7 - kind of coins: 0
; --------- amount: 6 - kind of coins: 1
; ---------- amount: 6 - kind of coins: 0
; ---------- amount: 5 - kind of coins: 1
; ----------- amount: 5 - kind of coins: 0
; ----------- amount: 4 - kind of coins: 1
; ------------ amount: 4 - kind of coins: 0
; ------------ amount: 3 - kind of coins: 1
; ------------- amount: 3 - kind of coins: 0
; ------------- amount: 2 - kind of coins: 1
; -------------- amount: 2 - kind of coins: 0
; -------------- amount: 1 - kind of coins: 1
; --------------- amount: 1 - kind of coins: 0
; --------------- amount: 0 - kind of coins: 1
; ---- amount: 6 - kind of coins: 2
; ----- amount: 6 - kind of coins: 1
; ------ amount: 6 - kind of coins: 0
; ------ amount: 5 - kind of coins: 1
; ------- amount: 5 - kind of coins: 0
; ------- amount: 4 - kind of coins: 1
; -------- amount: 4 - kind of coins: 0
; -------- amount: 3 - kind of coins: 1
; --------- amount: 3 - kind of coins: 0
; --------- amount: 2 - kind of coins: 1
; ---------- amount: 2 - kind of coins: 0
; ---------- amount: 1 - kind of coins: 1
; ----------- amount: 1 - kind of coins: 0
; ----------- amount: 0 - kind of coins: 1
; ----- amount: 1 - kind of coins: 2
; ------ amount: 1 - kind of coins: 1
; ------- amount: 1 - kind of coins: 0
; ------- amount: 0 - kind of coins: 1
; ------ amount: -4 - kind of coins: 2
; --- amount: 1 - kind of coins: 3
; ---- amount: 1 - kind of coins: 2
; ----- amount: 1 - kind of coins: 1
; ------ amount: 1 - kind of coins: 0
; ------ amount: 0 - kind of coins: 1
; ----- amount: -4 - kind of coins: 2
; ---- amount: -9 - kind of coins: 3
; -- amount: -14 - kind of coins: 4
; - amount: -39 - kind of coins: 5

; by applying the recursive calls in the other order:
;  amount: 11 - kind of coins: 5
; - amount: -39 - kind of coins: 5
; - amount: 11 - kind of coins: 4
; -- amount: -14 - kind of coins: 4
; -- amount: 11 - kind of coins: 3
; --- amount: 1 - kind of coins: 3
; ---- amount: -9 - kind of coins: 3
; ---- amount: 1 - kind of coins: 2
; ----- amount: -4 - kind of coins: 2
; ----- amount: 1 - kind of coins: 1
; ------ amount: 0 - kind of coins: 1
; ------ amount: 1 - kind of coins: 0
; --- amount: 11 - kind of coins: 2
; ---- amount: 6 - kind of coins: 2
; ----- amount: 1 - kind of coins: 2
; ------ amount: -4 - kind of coins: 2
; ------ amount: 1 - kind of coins: 1
; ------- amount: 0 - kind of coins: 1
; ------- amount: 1 - kind of coins: 0
; ----- amount: 6 - kind of coins: 1
; ------ amount: 5 - kind of coins: 1
; ------- amount: 4 - kind of coins: 1
; -------- amount: 3 - kind of coins: 1
; --------- amount: 2 - kind of coins: 1
; ---------- amount: 1 - kind of coins: 1
; ----------- amount: 0 - kind of coins: 1
; ----------- amount: 1 - kind of coins: 0
; ---------- amount: 2 - kind of coins: 0
; --------- amount: 3 - kind of coins: 0
; -------- amount: 4 - kind of coins: 0
; ------- amount: 5 - kind of coins: 0
; ------ amount: 6 - kind of coins: 0
; ---- amount: 11 - kind of coins: 1
; ----- amount: 10 - kind of coins: 1
; ------ amount: 9 - kind of coins: 1
; ------- amount: 8 - kind of coins: 1
; -------- amount: 7 - kind of coins: 1
; --------- amount: 6 - kind of coins: 1
; ---------- amount: 5 - kind of coins: 1
; ----------- amount: 4 - kind of coins: 1
; ------------ amount: 3 - kind of coins: 1
; ------------- amount: 2 - kind of coins: 1
; -------------- amount: 1 - kind of coins: 1
; --------------- amount: 0 - kind of coins: 1
; --------------- amount: 1 - kind of coins: 0
; -------------- amount: 2 - kind of coins: 0
; ------------- amount: 3 - kind of coins: 0
; ------------ amount: 4 - kind of coins: 0
; ----------- amount: 5 - kind of coins: 0
; ---------- amount: 6 - kind of coins: 0
; --------- amount: 7 - kind of coins: 0
; -------- amount: 8 - kind of coins: 0
; ------- amount: 9 - kind of coins: 0
; ------ amount: 10 - kind of coins: 0
; ----- amount: 11 - kind of coins: 0

(define (count-change amount)
  (cc amount 5 0))
(define (cc amount kinds-of-coins depth)
  (define (depth-string x)
    (if (< x 1)
        ""
    (string-append "-" (depth-string (- x 1)))))
  (define make-state-string (string-append "; " (depth-string depth) " amount: "(number->string amount) " - kind of coins: " (number->string kinds-of-coins)))
  (cond ((= amount 0) (displayln make-state-string)
                      1)
        ((or (< amount 0) (= kinds-of-coins 0)) (displayln make-state-string)
                                                0)
        (else (displayln make-state-string)
              ; you can change the order of the call to cc if you want
              (+ (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins (+ 1 depth))
                 (cc amount
                     (- kinds-of-coins 1) (+ 1 depth))))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
        
(count-change 11)

