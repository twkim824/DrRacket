;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Imperative Programming Notes|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; Imperative Programming

(define x 0)

(define (increment!)
  (begin (set! x (+ x 1)) x)) ;; set! replaces the first variable with the value of the second variable.

(define (clear!)
  (begin (set! x 0) x))

;; incrementing y = 0 by 1, then 2, then 3 etc...

(define y 0)

(define (add!)
  (begin (increment!) (set! y (+ y x)) y))

;; (sum!) gives the sum of mylist.

(define mylist (list 1 2 3 4 3 2 1))

(define a 0)

(define (sum!)
  (begin (set! a (+ a (first mylist)))
         (set! mylist (rest mylist))
         (if (empty? mylist)
             (set! a a)
             (sum!))
         a))

;; (length!) gives the length of mylist.

(define listlength 0)

(define (length!)
  (begin (set! listlength (+ listlength 1))
  (set! mylist (rest mylist))
  (if (empty? mylist)
      (set! listlength listlength)
      (length!)) listlength))
