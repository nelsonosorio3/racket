#lang racket

(provide hello)
(define (hello)
  "Hello, World!")


#lang racket
(provide square total)
(define (square n)
  (if (= n 1)
    1
    (* 2 (square (- n 1)))))
(define (total)
  (letrec ([f (lambda (n acc)
                (if (= n 0)
                  acc
                  (f (- n 1) (+ acc (square n)))))])
  (f 64 0)))
;;(define (total)
;;  (- (square 65) 1))


#lang racket
(provide two-fer)
(define (two-fer [arg 0])
  (if (string? arg)
    (string-append "One for " arg ", one for me.")
    "One for you, one for me."))


#lang racket
(provide leap-year?)
(define (leap-year? year)
  (and (= 0 (modulo year 4)) (or (= 0 (modulo year 400)) (not (= 0 (modulo year 100))))))


#lang racket
(provide sum-of-squares square-of-sum difference)
(define (square n)
  (* n n))
(define (sum-n n)
  (/ (* n (+ n 1)) 2))
(define (square-of-sum n)
  (square (sum-n n)))
(define (sum-of-squares n)
  (/ (* n (+ n 1) (+ (* 2 n) 1)) 6))
(define (difference n)
  (- (square-of-sum n) (sum-of-squares n)))


#lang racket
(provide classify)
(define (factors n)
  (letrec ([m (quotient n 2)]
           [f (lambda (m)
               (cond [(= 0 m) null]                     
                     [(= 0 (modulo n m)) (cons m (f (- m 1)))]
                     [#t (f (- m 1))]))])
    (f m)))
(define (sum lst)
  (if (null? lst)
      0
      (+ (car lst)  (sum (cdr lst)))))
(define (classify n)
  (cond [(= n (sum (factors n))) 'perfect]
        [(> n (sum (factors n))) 'deficient]
        [#t 'abundant]))


#lang racket
(provide collatz)
(define (collatz n)
  (if (or (< n 1) (not (integer? n)))
    (raise)
    (letrec ([f (lambda (m acc) 
                  (cond [(= m 1) acc]
                        [(= 0 (modulo m 2)) (f (/ m 2) (+ acc 1))]
                        [#t (f (+ (* 3 m) 1) (+ acc 1))]))])
    (f n 0))))


