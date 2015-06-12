#lang racket


(car ''abracadabra)
(car '(quote abracadabra))
(cadr '(quote abracadabra))
(cadr ''abracadabra)


(quote abracadabra)
(quote (quote abracadabra))


; it seems that 'x is just syntactic sugar for (quote x)
; ''x wil consequently evaluate to the quote of (quote x), a list
; accessing the first element will give quote.