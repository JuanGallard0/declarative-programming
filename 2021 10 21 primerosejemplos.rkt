#lang racket

;Suma de dos números:
(define (suma a b)
  (+ a b)
)


;Longitud de una circunferencia:
(define (longitud-circunferencia r)
  ;(* 2 (* pi r))
  (* 2 pi r)
)

;Area de un triángulo rectángulo:
(define (area-triangulo base altura)
  (/ (* base altura) 2)
)

;Distancia entre dos puntos:
(define (distancia-dos-puntos x1 y1 x2 y2)
  (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1))))
)

;Cuadrado perfecto:
(define (cuadrado-perfecto n)
  (integer? (sqrt n))
)

;Problema 5a:
(define (problema5a x)
  (and (> x 3) (<= x 7))
)

(define (ejemplo)
  (+ 3 5)
  (* 3 5)
  (/ 3 5)
)

(define (raizCuadratica a b c)

(/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))

(/ (- (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))

)

(define (raizCuadratica2 a b c)

(display (/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))) (display "\n")

(display (/ (- (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a)))

)

(define (raizCuadratica3 a b c)
  (list
   (/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
   (/ (- (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
  )
)
