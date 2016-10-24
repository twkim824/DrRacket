;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |List practise|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define square
  (lambda (x) (* x x)))

(build-list 5
            (lambda (x) (square (+ x 1))))

;; List of squares of numbers

(define list-of-squares
  (lambda (n)
    (build-list n
                (lambda (x) (square (+ x 1))))))


;; Filters the odd numbers in a list that's entered

(define filterodd
  (lambda (list)
    (filter odd? list)))

;; Find the sum of all the odd numbers in your list

(define sumodd
  (lambda (list)
    (foldl + 0 (filterodd list))))
