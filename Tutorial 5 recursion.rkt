;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Tutorial 5 recursion|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

(check-expect (factorial 5) 120)

(define (count-odd list)
  (if (empty? list)
      0

      (+ (if (odd? (first list))
             1
             0)
             (count-odd (rest list)))))

(check-expect (count-odd (list 1 2 3 4 5 6)) 3)

(define (count predicate? list)
  (if (empty? list)
      0
      (+ (if (equal? (predicate? (first list)) #true)
          1
          0)
         (count predicate? (rest list)))))