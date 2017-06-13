;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname mysort) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; Tim M. Lael
;; cs4250 hw5
;; date 11/22/2015

;;main mysort function which performs a recursive selection sort
;;by building new list from minimum elements. minimums are removed
;;after each call. sort output is ascending since minimums are added
;;to the head of the list constructed
(define (mysort X)
  (cond ((null? X) '())
       (else (cons (minimum X (car X))
                   (mysort (trim X (minimum X (car X))))
             )
       )
  )
)

;;function to find minimum value.
;;Compares list X to a single element Y
(define (minimum X Y)
  (cond ((null? X) Y)
        ((< (car X) Y) (minimum (cdr X) (car X)))
        (else (minimum (cdr X) Y))
  )
)

;;function to trim sorted values from original list
;;removes Y from list X
(define (trim X Y)
  (cond ((null? X) '())
         ((= (car X) Y) (cdr X))
        (else (cons (car X)(trim (cdr X) Y)))
  )
)
