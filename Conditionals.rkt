;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Conditionals) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (absolute-value x)
  (if (> x 0)
      x
      (- x)))


;; number? string? integer? procedure? odd? even?

;; (and test1 test2 test3 ....)   (or test1 test2 test3 ....)    (not test)


(define (perfect-square? x)
  (integer? (sqrt x)))

(define perfect_square?
  (λ (x) (integer? (sqrt x))))


;; (= number1 number2)     = only works for numbers

;; (eq? a b) literally the same object in memory

;; (equal? a b) the two arguments are equivalent objects

