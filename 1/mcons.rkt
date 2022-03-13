#lang racket

(define x (cons 14 null))
x
(define y x)
y
x
(set! x (cons 42 null))
x
y
(car y)
(car x)

(define z x)
(car x)
(car z)
;;(set! (car x) 15)
(define mpr (mcons 1 (mcons #t "hi")))

(mcar mpr)

(mcdr mpr)

(mcar (mcdr mpr))

(set-mcdr! mpr 47)

(mcons 1 47)

(set-mcdr! mpr (mcons #t "hi"))

;(length (mcons 2 (mcons 3 null)))
