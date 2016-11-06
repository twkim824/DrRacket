;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Notes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; LISTS



(append (list 1 2) (list 3 4)) ;; ---> (list 1 2 3 4)

(list-ref (list 1 2 3) 0) ;; ---> 1 (computer counts from 0)

(define (index list number)
  (list-ref list (- number 1))) ;; (- number 1) because computer counts from 0.

;; (index (list 5 4 3 2 1) 2) ---> 4

;; (filter predicate list)

(filter odd? (list 1 2 3 4 5)) ;; ---> (list 1 3 5)

(ormap odd? (list 1 2)) ;; ---> true because there is an odd number

(andmap odd? (list 1 2)) ;; ---> false because not all numbers are odd


;; (map procedure list)

(map - (list 1 2 3)) ;; ---> (list -1 -2 -3)

(foldl - 0 (list 1 2 3)) ;; ---> 2 because (- 3 (- 2 (- 1 0)))


;; (build-list count procedure) runs procedure repeatedly with inputs ranging from 0 to count - 1 and creates a list.

(build-list 5 (lambda (n) (* n n))) ;; ---> (list 0 1 4 9 16)

(define (my-build-list count procedure)
  (rest (build-list (+ count 1) procedure))) ;; ---> my-build-list changes the input range from 1 to count for convenience.

;; (my-build-list 5 (lambda (n) n)) ---> (list 1 2 3 4 5)


(foldl + 0 (my-build-list 5 (lambda (n) n))) ;; ---> adds up all the numbers in (list 1 2 3 4 5)

(define (my-sum list)
  (foldl + 0 list)) ;; my-sum sums up all the numbers in a list

;; (apply procedure list) calls procedure and passes the elements of list as inputs.

(apply + (list 1 2 3 4 5)) ;; ---> 15

