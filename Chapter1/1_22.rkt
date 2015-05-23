; to continue
#lang planet neil/sicp
(define (square x)
  (* x x))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))
(define (timed-prime-test n)
  (newline)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
(define (do x y)
  (if #f
      x
      y))

; Using this procedure, write a procedure search-for-primes that checks the primality of
; consecutive odd integers in a specified range. 
(define (search-for-primes start end)
  (if (= end start)
      (display "")
      (do (timed-prime-test start) (search-for-primes (+ 1 start) end))))

; Use your procedure to find the three smallest primes larger than 1000; larger than 10,000;
;larger than 100,000; larger than 1,000,000.
(search-for-primes 1000 1020)
;1009 *** 0
;1013 *** 0
;1019 *** 0
(search-for-primes 10000 10040)
;10007 *** 0
;10009 *** 0
;10037 *** 1000
(search-for-primes 100000 100050)
;100003 *** 0
;100019 *** 0
;100043 *** 0
(search-for-primes 1000000 1000060)
;1000003 *** 0
;1000033 *** 1000
;1000037 *** 0

; Note the time needed to test each prime. 
; done above

; Since the testing algorithm has order of growth of ( n), you should expect that testing 
; for primes around 10,000 should take about 10 times as long as testing for primes around
; 1000. 
; Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the
; n prediction? 
; no

;Is your result compatible with the notion that programs on your machine run in time
; proportional to the number of steps required for the computation?
; no