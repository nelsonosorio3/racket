
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence(+ low stride) high stride))))

(define (string-append-map xs suffix)
  (map (lambda (word) (string-append word suffix)) xs))

(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(empty? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs (remainder n (length xs))))]))

(define (stream-for-n-steps s n)
  (letrec ([f (lambda (s acc n)
                (let ([pr (s)])
                  (if (= n 0)
                      acc
                      (cons (car pr) (f (cdr pr) acc (- n 1))))))])
    (f s null n)))

(define funny-number-stream
  (letrec ([f (lambda (x) (cons x (lambda () (f (let ([x (+ (abs x) 1)])
                                                  (if (= (modulo x 5) 0)
                                                      (- x)
                                                      x))))))])
    (lambda () (f 1))))

(define dan-then-dog
  (letrec ([f (lambda (x) (cons x (lambda () (f (if (string=? x "dog.jpg")
                                                     "dan.jpg"
                                                     "dog.jpg")))))])
           (lambda () (f "dan.jpg"))))


(define (stream-add-zero s)
  (letrec ([f (lambda (x) (cons (cons 0 (car (x))) (lambda () (f (let ([x  (cdr (x))])
                                                  x)))))])
    (lambda () (f s))))

(define (cycle-lists xs ys)
  (letrec ([f (lambda (x y) (cons (cons (car x) (car y)) (lambda () (f (let ([xs2 (cdr x)])
                                                (if (empty? xs2)
                                                    xs
                                                    xs2)) (let ([ys2 (cdr y)])
                                                            (if (empty? ys2)
                                                            ys
                                                            ys2))))))])
           (lambda () (f xs ys))))

(define (vector-assoc v vec)
  (letrec (
           [f (lambda (n)
                (cond [(= (vector-length vec) n) #f]
                      [(not (pair? (vector-ref vec n))) (f (+ n 1))]
                      [(equal? (car (vector-ref vec n)) v) (vector-ref vec n)]
                      [#t (f (+ n 1))]))])
    (f 0)))

(define (cached-assoc xs n)
  (let ([memo (make-vector n #f)]
        [next 0])
    (lambda (v) (or (vector-assoc v memo)(let ([ans (assoc v xs)])
            (and ans
                 (begin (vector-set! memo next ans)
                        (set! next
                              (if (= (+ next 1) n)
                                  0
                                  (+ next 1)))
                        ans)))))))