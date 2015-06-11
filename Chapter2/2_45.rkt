#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 1 1)))

(define wave einstein)

; a funnier version:
(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 (flip-horiz painter2))))

(define wave4 (flipped-pairs wave))
(paint wave4)

;(define (right-split painter n)
;  (if (= n 0)
;      painter
;      (let ((smaller (right-split painter (- n 1))))
;        (beside painter (below smaller smaller)))))

;(define (up-split painter n)
;  (if (= n 0)
;      painter
;      (let ((smaller (up-split painter (- n 1))))
;        (below painter (beside smaller smaller)))))

(define (split painter1 painter2)
  (lambda (painter n)
    (if (= n 0)      
        painter
        (let ((smaller ((split painter1 painter2) painter (- n 1))))
          (painter1 painter (painter2 smaller smaller))))))
    
    
(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 4))
(paint (up-split einstein 4))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(paint (corner-split einstein 4))



