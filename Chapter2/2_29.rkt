#lang racket
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a) Write the corresponding selectors left-branch and right-branch, which return the
; branches of a mobile, and branch-length and branch-structure, which return the
; components of a branch.

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))


; b) Using your selectors, define a procedure total-weight that returns the total weight of a mobile.
(define (branch? x)
  (not (list? (car x))))
(define (total-weight mobile)
  (cond ((not (list? mobile)) mobile)
        ((branch? mobile) (total-weight (cadr mobile)))
        (else (+ 
               (total-weight (car mobile))
               (total-weight (cadr mobile))))))

(total-weight (make-mobile (make-branch 1 3) (make-mobile (make-branch 5 8) (make-branch 4 6))))

; c) mobile is said to be balanced if the torque applied by its top-left branch is equal to that applied
; by its top-right branch (that is, if the length of the left rod multiplied by the weight hanging from that
; rod is equal to the corresponding product for the right side) and if each of the submobiles hanging off
; its branches is balanced. Design a predicate that tests whether a binary mobile is balanced.
(define (torque branch)
  (* (branch-length branch)
     (total-weight branch)))

(define (balanced? mobile)
  (= (torque (left-branch mobile) (torque (right-branch mobile)))))

; d)

(define (make-mobile2 left right)
  (cons left right))
(define (make-branch2 length structure)
  (cons length structure))
; only the accessors need to be changed:
(define (left-branch2 mobile)
  (car mobile))
(define (right-branch2 mobile)
  (cdr mobile))
(define (branch-length2 branch)
  (car branch))
(define (branch-structure2 branch)
  (cdr branch))