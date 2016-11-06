;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Tutorial 6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A FileSystemObject is one of:
; 1. Folder
; 2. File

; A Folder is a (make-folder String (Listof FileSystemObjects))

(define-struct folder (name contents))
; the first string is the name of the folder
; The list is all the files and folders in this directory
; A File is a (make-file String String)

(define-struct file (name contents))
; the first string is the name of the file
; the second string is whatever text is in the file

; A Path is (Listof "string")



(define FileSystemObject1
  (make-folder "Folder1"
               (list
                (make-file "file1.txt" "content1")
                
                (make-folder "Folder1.2"
                             (list (make-file "file2.txt" "content2")
                                   (make-file "file3.txt" "content3"))))))

(define FileSystemObject2
  (make-folder "/"
               
   (list
    (make-folder "a"
                 (list (make-file "1.txt" "data1")
                       (make-file "2.txt" "data2")))
    (make-folder "b" (list
                      (make-file "3.txt" "data3")
                      (make-file "4.txt" "data4"))))))



(define (lookup-file-system-object FileSystemObjectList name)
  (cond [(empty? FileSystemObjectList) '()]
        
        [(file? (first FileSystemObjectList)) (if (equal? name (file-name (first FileSystemObjectList)))
                                                  (first FileSystemObjectList)
                                                  (lookup-file-system-object (rest FileSystemObjectList) name))]
        
        [(folder? (first FileSystemObjectList)) (if (equal? name (folder-name (first FileSystemObjectList)))
                                                    (first FileSystemObjectList)
                                                    (lookup-file-system-object (folder-contents (first FileSystemObjectList)) name))]))
                                                    
  

