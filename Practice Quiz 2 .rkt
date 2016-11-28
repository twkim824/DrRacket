;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practice Quiz 2 |) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

(require 2htdp/image)




(define (max-element list)
  (if (= (length list) 1)
      (first list)
      
      (max (first list) (max-element (rest list)))))

(define x 0)

(define (mystery)
  (begin (local [(define x 5)]
           (set! x "test"))
         x))

(define (foo list)
  (local [(define x 0)]
    (begin (for-each (lambda (e) (set! x (+ x e))) list) x)))


(define (foo_2 f)
  (local [(define g f)]
    (begin (set! g +) (g 1 2))))


(define (factorial n)
(local [(define product 1)
                (define (loop m)
                  (begin (set! product (* product m)) (when (> m 1) (loop (- m 1)))))]
          (begin (loop n) product)))


(define (dont-do-this-at-home n m)
  (local [(define f (λ (x y) (begin (set! f +) (f x y))))]
    (f n m)))


(define (make-bank-account)
  (local [(define balance 0)]
          (lambda (depositorwithdraw cash)
            (begin (set! balance
            (cond [(equal? depositorwithdraw "deposit")
                   (+ balance cash)]
                  [(equal? depositorwithdraw "withdrawal")
                   (- balance cash)])) balance))))

(define a (make-bank-account))


(define (power base exponent)
  (if (= exponent 0)
      1
      (* base (power base (- exponent 1)))))

(define (sum-list-elements list)
  (if (empty? list)
      0
      (+ (first list) (sum-list-elements (rest list)))))


(define (positiveornegative x)
    (cond [(positive? x) "The number is positive"]
          [(negative? x) "The number is negative"]
          [(= x 0) "The number is neither positive nor negative"]))


(define double-list-elements
  (λ (x)
    (map (λ (element) (list element element)) x)))

(define (mylength x)
  (if (empty? x)
      0
      (+ 1 (mylength (rest x)))))


(define (sum-odd list)
  (local [(define sum 0)]
          (begin (for-each (λ (e)
                             (when (odd? e)
                               (set! sum (+ sum e))))
                           list)
                 sum)))

(define (max-list list)
  (local [(define max (first list))
          (define remaining (rest list))
          (define (loop)
            (if (empty? remaining)
                max
            (begin (when (> (first remaining) max)
                     (set! max (first remaining)))
                   (set! remaining (rest remaining))
                   (loop))))]
    (begin (loop) max)))


(define (blah n m)
  (local [(define bar 0)]
    (begin (set! bar (+ n m)) bar)))

(define (apply-to-sublists procedure list-of-lists)
  (map (λ (x) (apply procedure x)) list-of-lists))
  
(define (iterated-overlay proc count)
  (local [(define result empty-image)
          (define (loop n)
            (unless (< n 1)
              (begin (set! result (overlay (proc n) result)) (loop (- n 1)))))]
    
    (begin (loop count) result)))
    
(define (iterative-fold proc start list)
  (local [(define (loop in out)
            (if (empty? in)
                out
                (loop (rest in) (proc out (first in)))))]
    (loop list start)))

(define (iterated-overlay-2 proc count)
  (if (= count 0)
      empty-image
      (overlay (proc count) (iterated-overlay-2 proc (- count 1)))))