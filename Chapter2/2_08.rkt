#lang racket
(define (sub-interval interval other-interval)
  (make-interval (- (lower-bound interval) (upper-bound other-interval))
                 (- (upper-bound interval) (lower-bound other-interval))))