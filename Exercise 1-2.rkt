;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |exercise 1-2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require cs111/iterated)
(require 2htdp/universe)

(define answer1
  (iterated-overlay
   (lambda (x)
     (square (* 10 (+ x 1)) "outline" "black")) 10))

(define answer1-2
  (lambda (n)
    (iterated-overlay
     (lambda (x)
       (square (* 10 (+ x 1)) "outline" "black")) n)))

(define answer2
(iterated-beside
 (lambda (x)
   (rectangle (* 10 (+ x 1)) 50 "outline" "black")) 7))

(define answer2-2
  (lambda (numberofrectangles)
    (iterated-beside
     (lambda (x)
       (rectangle (* 10 (+ x 1)) 50 "outline" "black")) numberofrectangles)))

(define answer3
(iterated-overlay
 (lambda (n)
   (rotate (* 36 n)
           (ellipse 100 25 "solid" "blue"))) 5))

(define answer3-2
  (lambda (count)
    (iterated-overlay
     (lambda (n)
       (rotate (* (/ 180 count) n)
               (ellipse 100 25 "solid" "blue"))) count)))

(define answer4
  (iterated-overlay
   (lambda (n)
     (rotate (* 36 n)
             (ellipse 100 25 64 (color 255 0 0)))) 5))

(define answer4-2
  (lambda (count)
    (iterated-overlay
     (lambda (n)
       (rotate (* (/ 180 count) n)
               (ellipse 100 25 64 (color 255 0 0)))) count)))

(define answer6
  (iterated-beside
   (lambda (color1 color2 count)
     (square 50 "solid" (interpolate-colors color1 color2 (- 1 (/ 1 count))))) 5))