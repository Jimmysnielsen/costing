#lang racket
(require test-engine/racket-tests)

;; data definitions
;;-----------------------------------------------------------------------------
;; ISOMETRIC is PID-NR LINE-ID LINE-SIZE MEDIA-CODE PIPE-CODE INSULATION-CODE
(define-struct isometric (pid-nr line-id line-size media-code pipe-code insulation-code)
  #:transparent)
;; PID-NR is symbol
;; LINE-ID is symbol
;; LINE-SIZE is symbol
;; MEDIA-CODE is symbol
;; PIPE-CODE is symbol
;; INSULATION-CODE is symbol

;;example isometric
;;(define ISO1 (make-isometric '21101 '100 '25 'CP01 'S57 'H43))
;;(define ISO2 (make-isometric '21101 '100 '25 'CP01 'S57 'H43))

(check-expect (isometric-pid-nr (make-isometric '21101 '100 '25 'CP01 'S57 'H43)) '21101)
(check-expect (isometric-line-id (make-isometric '21101 '100 '25 'CP01 'S57 'H43)) '100)
(check-expect (isometric-line-size (make-isometric '21101 '100 '25 'CP01 'S57 'H43)) '25)
(check-expect (isometric-media-code (make-isometric '21101 '100 '25 'CP01 'S57 'H43)) 'CP01)
(check-expect (isometric-pipe-code (make-isometric '21101 '100 '25 'CP01 'S57 'H43)) 'S57)
(check-expect (isometric-insulation-code (make-isometric '21101 '100 '25 'CP01 'S57 'H43)) 'H43)

;; template function
#;(define (fn-for-isometric i)
    ... (isometric-pid-nr i)
    ... (isometric-line-id i)
    ... (isometric-line-size i)
    ... (isometric-media-code i)
    ... (isometric-pipe-code i)
    ... (isometric-insulation-code i))
;;---------------------------------------------------------------------------

;; List-of-Isometric is one of
;;  empty
;;  (cons isometric List-of-Isometric)
;; examples
#;(define LOI0 empty)
#;(define LOI1 (cons (make-isometric '21101 '100 '25 'CP01 'S57 'H43) empty))
#;(define LOI2 (cons (make-isometric '21101 '100 '25 'CP01 'S57 'H43)
                   (cons (make-isometric '21101 '100 '25 'CP01 'S57 'H43) empty)))

;; template function
#;(define (fn-for-loI loi)
    (cond [(empty? loi) ...]
          [else (... (first loi)
                     (fn-for-loi (rest loi)))]))
;;--------------------------------------------------------------------------

;; MEDIA-SPEC is CODE DESC IMPACT
(define-struct media-spec (code desc impact)
  #:transparent)
;; CODE is symbol
;; desc is String
;; impact is Boolean
;; example
(define MS1 (make-media-spec 'CS-5 "Clean steam 5 barg" #t))
(define MS2 (make-media-spec 'CL-2 "Cooling liquid 2 barg" #f))
(define MS3 (make-media-spec 'WFI-5deg "WFI 5 degrees C" #t))

(check-expect (media-spec-code (make-media-spec 'CS-5 "Clean steam 5 barg" #t)) 'CS-5)
(check-expect (media-spec-desc (make-media-spec 'CS-5 "Clean steam 5 barg" #t))
              "Clean steam 5 barg")
(check-expect (media-spec-impact (make-media-spec 'CS-5 "Clean steam 5 barg" #t)) #t)

;; template function
#;(define (fn-for-media-spec m)
  ... (media-spec-code m)
  ... (media-spec-desc m)
  ... (media-spec-impact m))
;;--------------------------------------------------------------------------

;; ;; List-of-Media-spec is one of
;;  empty
;;  (cons media-spec List-of-Media-spec)
;; examples
(define LOM1 empty)
(define LOM2 (cons (make-media-spec 'CS-5 "Clean steam 5 barg" #t) empty))
(define LOM3 (cons (make-media-spec 'WFI-5deg "WFI 5 degrees C" #t)
                   (cons (make-media-spec 'CS-5 "Clean steam 5 barg" #t) empty)))

;; template function
#;(define (fn-for-LoM lom)
    (cond [(empty? lom) ...]
          [else (... (first lom)
                     (fn-for-lom (rest lom)))]))
;;--------------------------------------------------------------------------

;; PIPE-SPEC is CODE STANDARD SIZE DIMENSION 
(define-struct pipe-spec (code standard size dimension)
  #:transparent)
;; CODE is symbol
;; STANDARD is symbol
;; DIMENSION is symbol

;example pipe-spec
#;(define PIPE1 (make-pipe-spec 'S57 'EN-1234 'DN25 '25.4x1.65))
#;(define PIPE2 (make-pipe-spec 'S02 'EN-1239-1 'DN50 '50.8x2.00))

(check-expect (pipe-spec-code (make-pipe-spec 'S57 'EN-1234 'DN25 '25.4x1.65)) 'S57)
(check-expect (pipe-spec-standard (make-pipe-spec 'S57 'EN-1234 'DN25 '25.4x1.65)) 'EN-1234)
(check-expect (pipe-spec-size (make-pipe-spec 'S57 'EN-1234 'DN25 '25.4x1.65)) 'DN25)
(check-expect (pipe-spec-dimension (make-pipe-spec 'S57 'EN-1234 'DN25 '25.4x1.65)) '25.4x1.65)

;; template function
#;(define (fn-for-pipe-spec p)
    ... (pipe-spec-code p)
    ... (pipe-spec-standard p)
    ... (pipe-spec-size p)
    ... (pipe-spec-dimension p))
;;---------------------------------------------------------------------------

;; List-of-Pipe-spec is one of
;;  empty
;;  (cons pipe-spec List-of-Pipe-spec)
;; example
#;(define LOP0 empty)
#;(define LOP1 (cons (make-pipe-spec 'S57 'EN-1234 'DN25 '25.4x1.65) empty))
#;(define LOP2 (cons (make-pipe-spec 'S02 'EN-1239-1 'DN50 '50.8x2.00)
                   (cons (make-pipe-spec 'S57 'EN-1234 'DN25 '25.4x1.65) empty)))

;; template function
#;(define (fn-for-loI loi)
    (cond [(empty? loi) ...]
          [else (... (first loi)
                     (fn-for-loi (rest loi)))]))
;;--------------------------------------------------------------------------


(test)

