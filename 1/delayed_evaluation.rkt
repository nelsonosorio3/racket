#lang racket

(provide (all-defined-out))

(define (my-if-bad x y z)
  (if x y z))

(define (factorial-bad n)
  (my-if-bad (= n 0)
             1
             (* n (factorial-bad (- n 1)))))

(define (my-if-strange-but-works e1 e2 e3)
  (if e1 (e2) (e3)))

;thunks delay, thunk the expression
(define (factorial-okay x)
  (my-if-strange-but-works (= x 0)
                           (lambda () 1)
                           (lambda () (* x (factorial-okay (- x 1))))))