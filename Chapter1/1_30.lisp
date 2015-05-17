(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))


(define (inc a) (+ a 1))


(sum + 1 inc 2)
(sum + 1 inc 3)
(sum + 1 inc 4)


