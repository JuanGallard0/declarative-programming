#lang racket

; if de dos bloques:
(define (prueba-if x)
  (if (> x 0)
      (display "si")
      (display "no")))

; if de un solo bloque:
(define (prueba-if-un-bloque x)
  (if (> x 0)
      (display "si")
      (void)))

; Un if más simple:
(define (if-simple)
  (if 5
      7
      3))

; Verificar si la suma de dos números
; es mayor o menor que 10:
(define (comparar-con-10 a b)
  (if (> (+ a b) 10)
      (display "La suma es mayor que 10")
      (display "La suma es menor que 10")))


; Verificar si la suma de dos números
; es mayor, menor o igual a 10:
(define (comparar-con-10-v2 a b)
  (if (> (+ a b) 10)
      (display "La suma es mayor que 10")
      (if (< (+ a b) 10)
          (display "La suma es menor que 10")
          (display "La suma es igual a 10")
      )
  )
)


; Verificar si la suma de dos números
; es mayor, menor o igual a 10:
; Utilizando bloques begin:
(define (comparar-con-10-v3 a b)
  (if (> (+ a b) 10)
      (begin
        (display "La suma es ")
        (display "mayor que 10")
      )
      (if (< (+ a b) 10)
          (begin
            (display "La suma es ")
            (display "menor que 10")
          )
          (begin
            (display "La suma es ")
            (display "igual a 10")
          )
      )
  )
)


; Verificar si la suma de dos números
; es mayor, menor o igual a 10:
; Utilizando cond:
(define (comparar-con-10-cond a b)
  (cond
    ((> (+ a b) 10) (display "La suma es ") (display "mayor que 10"))
    ((< (+ a b) 10) (display "La suma es ") (display "menor que 10"))
    (else (display "La suma es ") (display "igual a 10"))
  )
)

; Días de la semana:
; Utilizando cond:
(define (días-semana día)
  (cond
    ((equal? día 1) (display "Lunes"))
    ((equal? día 2) (display "Martes"))
    ((equal? día 3) (display "Miércoles"))
    ((equal? día 4) (display "Jueves"))
    ((equal? día 5) (display "Viernes"))
    ((equal? día 6) (display "Sábado"))
    ((equal? día 7) (display "Domingo"))
    (else (error "Número de día no váldo"))
  )
)


; Días de la semana:
; Utilizando case:
(define (días-semana-case día)
  (case día
    ((1) (display "Lunes"))
    ((2) (display "Martes"))
    ((3) (display "Miércoles"))
    ((4) (display "Jueves"))
    ((5) (display "Viernes"))
    ((6) (display "Sábado"))
    ((7) (display "Domingo"))
    (else (display "Número de día no váldo"))
  )
)


; Lectura de valores desde teclado:
(define (leerValor)
  (read)
)


(define (mostrarValorLeido a)
  (display "El valor leído es: ")
  (display a)
)



(define (hacer-función función x)
  (función x)
)


(define (sumar10 x)
  (+ x 10)
)




