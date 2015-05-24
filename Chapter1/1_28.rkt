; to continue
#lang planet neil/sicp
; Modify the expmod procedure to signal if it discovers a
; nontrivial square root of 1

; use this to implement the Miller-Rabin test with a procedure analogous
; to fermat-test. 

; Check your procedure by testing various known primes and non-primes. Hint:
; One convenient way to make expmod signal is to have it return 0.