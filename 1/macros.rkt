#lang racket

(provide (all-defined-out))

(define-syntax my-delay
  (syntax-rules ()
    [(my-delay e)
     (mcons #f (lambda () e))]))

(define p (my-delay (begin (print "hi") (* 3 4))))