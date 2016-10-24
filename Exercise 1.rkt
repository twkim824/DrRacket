(require 2htdp/image)
(require cs111/iterated)
(require 2htdp/universe)


(define question1-answer
  (iterated-overlay
   (lambda (n)
     (square (* (+ n 1) 10) "outline" "black"))
   10))

(define question2-answer
  (iterated-beside
   (lambda (n)
     (rectangle (* (+ n 1) 10) 50 "outline" "black"))
   7))

(define question3-answer
  (iterated-overlay
   (lambda (n)
     (rotate (* n 36)
             (ellipse 100 25 "solid" "blue")))
   5))

(define question4-answer
  (iterated-overlay
   (lambda (n)
     (rotate (* 36 n)
             (ellipse 100 25 "solid" (color 255 0 0 64)))) 5))

(define question5-answer
  (iterated-overlay
   (lambda (n)
     (rotate (* 36 n)
             (ellipse 100 25 "solid" (color (* 50 n) 0 (- 255 (* 50 n)) 64)))) 5))

;;;
;;; PART 2
;;;

(require 2htdp/image)
(require cs111/iterated)

;; Question 6

(define swatch
  (λ (color1 color2 count)
    (iterated-beside
     (lambda (n)
       (square 50 255 (interpolate-colors color1 color2 (* (/ 1 (- count 1)) n))))count)))


;; Question 7

;; iterated-overlay-inclusive

(define iterated-overlay-inclusive
  (λ (generator count start end)
    (iterated-overlay
     (lambda (picture-count)
       (generator
        (* picture-count
           (/ (- end start)
              (- count 1)))))
     count)))

;; iterated-overlay-exclusive

(define iterated-overlay-exclusive
  (λ (generator count start end)
    (iterated-overlay
     (lambda (picture-number)
       (generator (* picture-number (/ (- end start) count))))
     count)))

;; Question 8

(define grid-from-generator
  (λ (generator columns rows)
    (iterated-beside
     (lambda (row)
       (iterated-above
        (lambda (col)
          (generator row col))
        rows))
     columns)))

;; Question 9

(define outlined
  (λ (proc width height color)
    (underlay
     (proc width height "solid" color)
     (proc width height "outline" "black"))))

(define flower
  (iterated-overlay-exclusive
   (lambda (angle)
     (rotate angle
             (outlined ellipse 25 100 "red")))
   5 0 180))

;; Question 10

(define SIZE 110)

;; Animates an ellipse to rotate left

(define generate-frame
    (lambda (frame-number)
      (overlay
      (rotate frame-number
              (outlined ellipse 25 100 "red"))
      (square SIZE "outline" "black"))))

;; Animates an ellipse to rotate right

(define generate-frame-right
    (lambda (frame-number)
      (overlay
      (rotate (- frame-number)
              (outlined ellipse 25 100 "red"))
      (square SIZE "outline" "black"))))
  
;; Double the rate of rotation

(define generate-frame-double
    (lambda (frame-number)
      (overlay
      (rotate (* 2 frame-number)
              (outlined ellipse 25 100 "red"))
      (square SIZE "outline" "black"))))
