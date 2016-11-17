;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |List practise|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (square x) (* x x))


;; takes in a number and creates a list from 1 to number.

(define (orderedlist number)
  (build-list number (lambda (x) (+ x 1))))

;; takes in a number and adds up all the numbers from 1 to number.

(define (sumonetonumber number)
  (foldl + 0 (orderedlist number)))


;; listofsquares takes in a number and creates a list of squares from 1 to number.

(define (listofsquares number)
(build-list number
            (lambda (x) (square (+ x 1)))))




;; Compute the sum of the squares of all the numbers from 1 to number

(define (sumofsquares number)

;; add up all the numbers in the list
  
    (foldl + 0

;; build a list of squares of numbers:
(build-list (+ number 1) (lambda (x) (square x)))))





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


;; (apply procedure list) : passes the elements of the list as inputs into procedure.

;; maxelement takes in a list and outputs the biggest number in the list.

(define (maxelement list)
  (apply max list))


