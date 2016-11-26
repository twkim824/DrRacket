;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Album Review|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

;; (album? object)

;; (album-title album) (album-artist album) (album-genre album)


(require cs111/remove-duplicates)

(define-struct album (title artist genre))



(define database
  
  (list (make-album "The White Album"
                    "The Beatles"
                    "Rock")
        
        (make-album "Song name"
                    "The Beatles"
                    "Music genre")

        (make-album "whatever"
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

(define all-titles
  (λ (db)
    (map album-title db)))

(define all-artists
   (λ (db)
    (remove-duplicates (map album-artist db))))

(define all-genres
  (λ (db)
    (remove-duplicates (map album-genre db))))

(define artist-albums
  (λ (desired-artist db)
    (filter (λ (album) (equal? (album-artist album) desired-artist)) db)))


(define artist-genres
  (λ (artist database)
    (remove-duplicates
     (map album-genre
          (filter (λ (album) (equal? (album-artist album) artist)) database)))))

(define artist-genres-2
  (λ (artist database)
    (all-genres (artist-albums artist database))))

(define versatile?
  (λ (artist-name some-database)
    (if (= (length (artist-genres artist-name some-database)) 1)
        #false
        #true)))

(define versatile2?
  (λ (artist database)
    (> (length (artist-genres artist database)) 1)))

(define versatile-artists
  (λ (database)
    (remove-duplicates (filter (λ (artist) (versatile? artist database)) (map album-artist database)))))


;; procedure that computes the number of albums by a single artist

(define artist-album-count
  (λ (artist database) (length (artist-albums artist database))))
    
;; procedure that returns a two-element list containing the artist's name and the album count

(define artist-album-count-list
  (λ (artist database) (list artist (artist-album-count artist database))))

(define artist-album-counts
  (λ (database)
    (remove-duplicates (map (λ (x) (artist-album-count-list (album-artist x) database)) database))))

               
;; count the number of albums in each genre

;; genre-albums

(define genre-albums
  (λ (genre database)
    (filter (λ (album) (equal? (album-genre album) genre)) database)))
    

;; genre-album-count
  
(define genre-album-count
  (λ (genre database)
    (length (genre-albums genre database))))
        
;; genre-album-count-list

(define genre-album-count-list
  (λ (genre database) (list genre (genre-album-count genre database))))

;; genre-album-counts

(define genre-album-counts
  (λ (database)
    (remove-duplicates
     (map (λ (album) (genre-album-count-list (album-genre album) database)) database))))



;; Other practice


(define filter-strings
  (λ (list)
  (filter (λ (x) (string? x)) list)))

(define filter-strings-2
  (λ (list)
    (filter string? list)))
   
(define add1toelements
  (λ (list)
    (map (λ (element) (+ element 1)) list)))


