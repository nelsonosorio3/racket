#lang racket

(provide (all-defined-out))

;; empty list null  or '()
;; cons constructor
;; head of list car
;; tail of list cdr
;; check por empty null?

;; (list e1 ... en) for building lists

; sum all the numbers in a list
(define (sum xs)
  (if (null? xs)
      0
    (+ (car xs) (sum (cdr xs)))))

; append
(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs) (my-append (cdr xs) ys))))

; map
(define (my-map f xs)
  (if (null? xs)
      null
      (cons (f (car xs)) (my-map f (cdr xs)))))

; sum +1 to all elements on the list
(define test (my-map (lambda (x) (+ x 1)) (list 1 2 3 4 5)))

