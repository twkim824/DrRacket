;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Tutorial 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require htdp/arrow)

(define f
  (lambda (x)
    (sqr x)))
(check-expect (f 2) 4)

(define g
  (lambda (y)
    (+ (f y) 10)))
(check-expect (g 2) 14)

(define string-overlay
  (lambda (str img)
    (overlay (text str 12 "red") img)))
 
(string-overlay "hello" (circle 20 "solid" "blue"))

(string-overlay "hello"
                (rectangle (* 6 (string-length "hello")) 20 "solid" "green"))

(string-length "hello")

(substring "hello" 0 3)

(define add2
  (lambda (n)
    (+ 2 n)))
(check-expect (add2 2) 4)

;; Takes a string and number and removes that number of characters from
;; end of the string
(define drop-from-end
  (lambda (str num)
    (substring str 0 (- (string-length str) num))))
(check-expect (drop-from-end "hello" 2) "hel")

;; Takes a string and a number and removes that number of characters from front
;; of the string
(define drop-from-front
  (lambda (str num)
    (substring str num (string-length str))))
(check-expect (drop-from-front "hello" 2) "llo")

;; Takes a string and a number and removes the number of characters from front
;; and back
(define clip-string
  (lambda (str num)
    (substring str num (- (string-length str) num))))
(check-expect (clip-string "hello" 1) "ell")





  