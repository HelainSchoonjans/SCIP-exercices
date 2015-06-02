#lang racket
; let's compute the upper limit :
; (R1 + R1*tolerance1/100)*(R2 + R2 * tolerance2/100)
; = R1*R2*(100 + tolerance1)*(100 + tolerance2)/(100*100)
; = (R1*R2)*(100 + tolerance1)*(100 + tolerance2)/(100*100)
; we can say that the new tolerance is (100 + tolerance1)*(100 + tolerance2)/(100*100)



; NEW VERSION
; (R1 +- R1*tolerance1)*(R2 +- R2 * tolerance2)
;
; Upper limit: 
; = R1*R2*(1 + tolerance1)*(1 + tolerance2)
; = (R1*R2)*((1 + tolerance1)*(1 + tolerance2))
; 
; 
; Lower limit:
; = R1*R2*(1 - tolerance1)*(1 - tolerance2)
; = (R1*R2)*((1 - tolerance1)*(1 - tolerance2))
;
; (R1*R2)*tolerance_product = (R1*R2)*((1 + tolerance1)*(1 + tolerance2)) - (R1*R2)*((1 - tolerance1)*(1 - tolerance2))
; = (R1*R2)*((1 + tolerance1)*(1 + tolerance2)) - ((1 - tolerance1)*(1 - tolerance2))



; NEW NEW VERSION:
; i1 = [ R1 * (1-t1), R1 * (1+t1)]
; i2 = [ R2 * (1-t2), R2 * (1+t2)]
; i1*i2 = [ R2 * (1-t2) * R1 * (1-t1), R1 * (1+t1) * R2 * (1+t2)]
; i1*i2 = [ R2 * R1 * (1-t2) * (1-t1), R1 * R2 * (1+t1) * (1+t2)]
; i1*i2 = [ R2 * R1 * (1+t1t2-t1-t2), R1 * R2 * (1+t1t2+t1+t2)]
; Since t1t2 is negligible:
; i1*i2 = [ R2 * R1 * (1-t1-t2), R1 * R2 * (1+t1+t2)]
; the tolerance of the new interval is t1 + t2