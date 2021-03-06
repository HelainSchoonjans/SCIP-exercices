(define (pascal row col)
  (cond ((< col 1) 0)
        ((= col 1) 1)
        ((= col row) 1)
        ((> col row) 0)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))
 
(pascal 1 1)
(pascal 2 1)
(pascal 2 2)
(pascal 3 1)
(pascal 3 2)
(pascal 3 3)
(pascal 4 1)
(pascal 4 2)
(pascal 4 3)
(pascal 4 4)