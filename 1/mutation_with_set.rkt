#lang racket

(provide (all-defined-out))

(define x 1)
(set! x 2) ; like x = 2 in python

(begin 2 3 4 5) ;each expression in order, returns las t one

(define b 3)
(define f (lambda (x) (* 1 (+ x b))))
(define c (+ b 4)) ; 7
(set! b 5)
(define z (f 4)) ; 9
(define w c)  ;7


;;(define b 3)
;;(define f
;;  (let ([b b])
;;    (lambda (x) (* 1(+ x b)))))

;;(define f
;;  (let ([b b]
;;        [+ +]
;;        [* *])
;;    (lambda (x) (* 1 (+ x b)))))