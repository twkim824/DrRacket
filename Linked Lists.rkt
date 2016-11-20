;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Linked Lists|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (procedureMap aProcedure myList)
  (if (empty? myList)
      '()
      (cons (aProcedure (first myList)) (procedureMap aProcedure (rest myList)))))

(define-struct pair (first rest))

(define (procedureCons first rest) (make-pair first rest))

(define (procedureFirst list) (pair-first list))

(define (procedureRest list) (pair-rest list))

;; Defining the filter procedure

(define (procedureFilter inputPredicate inputList)
  
  (if (empty? inputList)
      '()
      
      (local [(define former (first inputList))
              (define latter (procedureFilter inputPredicate (rest inputList)))]
        (if (inputPredicate former)
            (cons former latter)
            latter))

      ))

;; Defining the append procedure

(define (procedureAppend list1 list2)
  (if (empty? list1)
      list2

      (cons (first list1) (procedureAppend (rest list1) list2))))