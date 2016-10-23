;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Exercise 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;;
;;;; Exercise 2: A simple database
;;;; EECS-111 Fall 2016
;;;; TaeWon Kim

(require cs111/remove-duplicates)

(define-struct album (title artist genre))


(define database
  
  (list (make-album "The White Album"
                    "The Beatles"
                    "Rock")
        (make-album "Song name"
                    "The Beatles"
                    "Music genre")
        (make-album "Idlewild"
                    "Outkast"
                    "Soundtrack")
        (make-album "Blackstar"
                    "David Bowie"
                    "Rock")
        (make-album "Anti"
                    "Rihanna"
                    "Pop")
        (make-album "Random"
                    "Rihanna"
                    "Rock")))


;; all-titles: database -> (listof string)
;; Gets all titles of all albums in the database

;; Question 1

(define all-titles
  (lambda (database)
    (map
     (lambda (album)
       (album-title album)) database)))

(check-expect (all-titles database)
                                (list "The White Album" "Song name" "Idlewild" "Blackstar" "Anti" "Random"))

;; Question 2

(define all-artists
  (lambda (database)
    (remove-duplicates
    (map
     (lambda (album)
       (album-artist album)) database))))



(check-expect (all-artists database)
                           (list "The Beatles" "Outkast" "David Bowie" "Rihanna"))


;; Question 3

(define all-genres
  (lambda (database)
    (remove-duplicates
     (map album-genre database))))

(check-expect (all-genres database)
              (list "Rock" "Music genre" "Soundtrack" "Pop"))

;; Question 4

(define artist-albums
     (lambda (desired-artist database)
       (map album-title
            (filter
             (lambda (album)
               (equal? (album-artist album) desired-artist)) database))))
          
(check-expect (artist-albums "The Beatles" database)
              (list "The White Album" "Song name"))



;; Question 5

(define artist-genres
     (lambda (desired-artist database)
       (map album-genre
            (filter
             (lambda (genre)
               (equal? (album-artist genre) desired-artist)) database))))

(check-expect (artist-genres "Rihanna" database)
              (list "Pop" "Rock"))


;; Question 6

(define artist-is-versatile?
  (lambda (desired-artist database)
    (> (length (artist-genres desired-artist database)) 1)))

(check-expect (artist-is-versatile? "The Beatles" database) #t)


;; Question 7

(define versatile-artists
  (lambda (database)
    (remove-duplicates
     (all-artists
      (filter
       (lambda (album)
         (artist-is-versatile? (album-artist album) database)) database)))))

(check-expect (versatile-artists database)
              (list "The Beatles" "Rihanna"))


;; Question 8

;; a

   (define artist-album-count
     (lambda (desired-artist)
       (length (artist-genres desired-artist database))))

(check-expect (artist-album-count "The Beatles") 2)

;; b

(define artist-album-count-list
  (lambda (desired-artist database)
    (list desired-artist (artist-album-count desired-artist))))

(check-expect (artist-album-count-list "The Beatles" database) (list "The Beatles" 2))

;; c

(define artist-album-counts
  (lambda (db)
    (remove-duplicates
     (map
      (lambda (album)
        (artist-album-count-list (album-artist album) db)) db))))



(check-expect (artist-album-counts database) (list
                                              (list "The Beatles" 2)
                                              (list "Outkast" 1)
                                              (list "David Bowie" 1)
                                              (list "Rihanna" 2)))
       
;; Question 9

(define genre-albums
  (lambda (desired-genre database)
    (map album-title
         (filter
          (lambda (album)
            (equal? (album-genre album) desired-genre)) database))))
                   
(check-expect (genre-albums "Rock" database) (list "The White Album"
                                                   "Blackstar"
                                                   "Random"))





(define genre-album-count
  (lambda (desired-genre)
    (length
     (genre-albums desired-genre database))))

(check-expect (genre-album-count "Rock") 3)






(define genre-album-count-list
  (lambda (desired-genre)
    (list desired-genre (genre-album-count desired-genre))))

(check-expect (genre-album-count-list "Rock") (list "Rock" 3))





(define genre-album-counts
  (lambda (database)
    (remove-duplicates
     (map
      (lambda (album)
        (genre-album-count-list (album-genre album))) database))))

(check-expect (genre-album-counts database) (list
                                             (list "Rock" 3)
                                             (list "Music genre" 1)
                                             (list "Soundtrack" 1)
                                             (list "Pop" 1)))