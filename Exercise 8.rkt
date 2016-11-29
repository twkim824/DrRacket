;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Exercise 8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require cs111/gui)
(require cs111/file-operations)
(require 2htdp/image)

;; A test image for show/url
(define cat
  "https://www.funnypica.com/wp-content/uploads/2012/01/Funny-Cats-Funny-Cat-Picture-052-FunnyPica.com_.jpg")

;; The location of the pictures on your hard disk.  Modify as appropriate.
(define pictures-directory "/Users/taewon/desktop/image.png")

(define folder "/Users/taewon/desktop/folder")

;; Common file extensions for picture files
(define picture-extensions
  (list ".jpg" ".jpeg" ".gif" ".tif" ".tiff" ".png" ".bmp"))

;; Width of space to allocate for the image container in the slideshow
(define image-container-width 800)
;; Height of space to allocate for the image container in the slideshow
(define image-container-height 600)
;; Width of buttons for the slideshow
(define button-height 50)
;; Height of buttons for the slideshow
(define button-width 50)

;;; FILL IN YOUR ANSWERS BELOW


;; show/url!: string -> window
;; EFFECT: show the image from the specified url in a window

(define show/url!
  (λ (url)
    (local [(define image (bitmap/url url))
            (define container (make-image-container (image-width image) (image-height image)))
            (define window (make-window (image-width image) (image-height image)))]
            (begin (set-image-container-content! container image) (add-widget! window container 0 0) (open-window! window)))))
    

;; show/file!: path -> window
;; EFFECT: show the image from the specified file path in a window

(define show/file!
  (λ (file)
    (local [(define image (bitmap/file file))
            (define container (make-image-container (image-width image) (image-height image)))
            (define window (make-window (image-width image) (image-height image)))]
            (begin (set-image-container-content! container image) (add-widget! window container 0 0) (open-window! window)))))

;; picture-file?: path -> boolean
;; True if the path is for a picture file (as determined by its extension).

;(define picture-file?
;  (λ (path)
;    (path-has-extension? path ".png")))

(define (picture-file? path)
  (ormap (λ (element) (path-has-extension? path element)) picture-extensions))
  
;; directory-pictures: path -> (listof path)
;; The list of paths of the pictures in the specified directory.


(define (directory-pictures directory-path)
  (filter (λ (element) (picture-file? element)) (directory-files directory-path)))


;; slideshow!: path -> window
;; EFFECT: Show all the pictures in the specified directory in a window.



(define (slideshow! directory-path)
  (local [(define buttonNext (make-button button-width button-height "Next"))
          (define buttonPrevious (make-button button-width button-height "Previous"))
          (define listofimages (directory-pictures directory-path))
          (define image-container (make-image-container image-container-width image-container-height))
          (define window (make-window image-container-width (+ image-container-height 50)))
          (define index 0)
          (define (next)
            (begin (set! index (+ index 1))
            (cond [(< index (- (length listofimages) 1))
                  (begin (set-button-text! buttonPrevious "Previous")
                         (set-button-text! buttonNext "Next")
                         (set-image-container-content! image-container (resized-bitmap (list-ref listofimages index) image-container-width image-container-height)))]
                  [(= index (- (length listofimages) 1))
                   (begin (set-button-text! buttonNext "")
                          (set-image-container-content! image-container (resized-bitmap (list-ref listofimages index) image-container-width image-container-height)))]
                  [(> index (- (length listofimages) 1))
                   (set! index (- (length listofimages) 1))]
                  )))
          (define (previous)
            (begin (set! index (- index 1))
            (cond [(> index 0)
                   (begin (set-button-text! buttonPrevious "Previous") (set-button-text! buttonNext "Next") (set-image-container-content! image-container (resized-bitmap (list-ref listofimages index) image-container-width image-container-height)))]
                  [(= index 0)
                   (begin (set-button-text! buttonPrevious "")
                   (set-image-container-content! image-container (resized-bitmap (list-ref listofimages index) image-container-width image-container-height)))]
                  [(< index 0)
                   (set! index 0)]
                  )))]

    (begin
      (set-button-text! buttonPrevious "")
      (set-image-container-content! image-container (resized-bitmap (list-ref listofimages index) image-container-width image-container-height))
      (set-click-callback! buttonNext next)
      (add-widget! window buttonNext (- (* 0.67 image-container-width) (* 0.5 button-width)) image-container-height)
      (add-widget! window buttonPrevious (- (* 0.33 image-container-width) (* 0.5 button-width)) image-container-height)
      (set-click-callback! buttonPrevious previous)
      (add-widget! window image-container 0 0)
      (if (= index (- (length listofimages) 1))
          (set! buttonNext (make-button button-width button-height ""))
          void)
      
      

      (open-window! window))))




;; resized-bitmap: image number number -> image
;; Returns a scaled version of image that will fill a space of the specified size as best as possible
;; It will now change the aspect ratio of the original image and it will not extend past the boundaries
;; of the region.

(define (resized-bitmap bitmap width height)
  (local [(define image (bitmap/file bitmap))
          (define widthRatio (/ width (image-width image)))
          (define widthHeight (/ height (image-height image)))
          (define window (make-window width height))]
            (begin
              (cond [(< widthRatio widthHeight)
                     (begin (set! image (scale widthRatio image)))]
                    [(< widthHeight widthRatio)
                     (begin (set! image (scale widthHeight image)))])
              image)))