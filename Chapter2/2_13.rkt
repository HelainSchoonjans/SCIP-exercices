; to continue
#lang racket
; let's compute the upper limit :
; (R1 + R1*tolerance1/100)*(R2 + R2 * tolerance2/100)
; = R1*R2*(100 + tolerance1)*(100 + tolerance2)/(100*100)
; = (R1*R2)*(100 + tolerance1)*(100 + tolerance2)/(100*100)
; we can say that the new tolerance is (100 + tolerance1)*(100 + tolerance2)/(100*100)