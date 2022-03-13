#lang racket

(provide (all-defined-out))

(define pr (cons 1 (cons #t "hi")))
(define lst (cons 1 (cons #t (cons "hi" null))))
(define hi(cdt (cdr pr)))
(define hi-again (card (car (cdr lst))))
