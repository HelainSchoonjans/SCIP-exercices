; to continue
#lang planet neil/sicp
; To implement this change, define a procedure next that returns 3 if
; its input is equal to 2 and otherwise returns its input plus 2. 
; Modify the smallest-divisor procedure to use (next test-divisor) 
; instead of (+ test-divisor 1).
(define (next input)
  (if (= input 2)
      3
      (+ input 2)))

(define (square x)
  (* x x))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))

(smallest-divisor 2)
(smallest-divisor 7)
(smallest-divisor 11)
(smallest-divisor 15)
; With timed-prime-test incorporating this modified version of
; smallest-divisor, run the test for each of the 12 primes found in
; exercise 1.22. 
(define (prime? n)
  (= n (smallest-divisor n)))
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)

; Since this modification halves the number of test steps,
; you should expect it to run about twice as fast. Is this expectation
; confirmed? If not, what is the observed ratio of the speeds of the two
; algorithms, and how do you explain the fact that it is different from 2?

; modifiy the algorithm to have a better time estimation...