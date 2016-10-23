;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Exercise_0) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define a-red-square (rectangle 100 100 "solid" "red"))

(define a-blue-circle (circle 50 "solid" "blue"))

(define outlined-square (rectangle 100 100 "outline" "red"))

(define outlined-circle (circle 50 "outline" "blue"))

(define row-of-squares (beside (rectangle 100 100 "solid" "red")
        (rectangle 100 100 "solid" "blue")
        (rectangle 100 100 "solid" "green")))

(define column-of-squares (above (rectangle 100 100 "solid" "red")
        (rectangle 100 100 "solid" "blue")
        (rectangle 100 100 "solid" "green")))


(define nested-squares (overlay (rectangle 25 25 "solid" "black")
         (rectangle 50 50 "solid" "green")
         (rectangle 75 75 "solid" "blue")
         (rectangle 100 100 "solid" "red")))

(define rotated-square (rotate 45 (overlay (rectangle 25 25 "solid" "black")
         (rectangle 50 50 "solid" "green")
         (rectangle 75 75 "solid" "blue")
         (rectangle 100 100 "solid" "red"))))

(define skyrec (rectangle 300 30 "solid" "lightblue"))
(define whiterec (rectangle 300 10 "solid" "white"))
(define redstar (radial-star 6 10 24 "solid" "red"))
(define whitespace (rectangle 12 12 "solid" "white"))

(define flag-of-chicago (overlay (above
       skyrec
       whiterec
       (beside redstar
        whitespace
        redstar
        whitespace
        redstar
        whitespace
        redstar)
       whiterec
       skyrec)
         (rectangle 301 180 "outline" "black")))

flag-of-chicago
