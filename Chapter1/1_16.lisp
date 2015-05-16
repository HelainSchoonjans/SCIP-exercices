(define (exp-lin base n)
  (exp-iter base base 1 n 1))

(define (exp-iter base acc acc-exp exp total)
  (cond ((= exp 0) total)
        ((<= (* 2 acc-exp) exp) (exp-iter base (* acc acc) (* 2 acc-exp) exp total))
        (else (exp-iter base base 1 (- exp acc-exp) (* acc total)))))


(exp-lin 2 1)
(exp-lin 2 2)
(exp-lin 2 3)
(exp-lin 2 4)
(exp-lin 2 5)
(exp-lin 2 10)