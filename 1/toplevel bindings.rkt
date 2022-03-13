#lang racket

(provide (all-defined-out))

(define (f x) (+ x (* x b))) ; forward reference ok
(define b 3)
(define c (+ b 4)) ; backward reference ok
;(define d (+ e 4)); not ok error
(define e 5)
;(define f 17) ; not okay: f already defined in this module
