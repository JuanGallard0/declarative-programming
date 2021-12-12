; Juan Humberto Gallardo Hernandez  00091813

#lang racket

; EJERCICIO 1

; a)

(define (ecEsfera xc yc zc a b c)
  (let
      (
       (raizCuad (+ (sqr (- a xc)) (sqr (- b yc)) (sqr (- c zc))))
       )
    (list '= (list '+ (list 'sqr (list '- 'x xc)) (list 'sqr (list '- 'y yc)) (list 'sqr (list '- 'z zc))) raizCuad)
    )
  )

(define Esfera (ecEsfera 3 2 1 6 2 1))

; b)

; (define x 3) (define y 2) (define z 1)
; (define x 4) (define y 2) (define z 2)
; (define x 1) (define y 2) (define z 4)

; c)

; (eval Esfera)


; EJERCICIO 2
; (problema3 '((3 2 1) (4 2 2) (1 2 4) (10 10 10)))
; Funciona solo si se ha definido x, y, z previamente en consola

(define (problema3 L)
  ; Apertura:
  (define datos-de-lista (open-output-file "evaluacion-de-funciones.txt" #:mode 'text #:exists 'replace))
  ; Procesamiento:
  (problema3-rec L datos-de-lista)
  ; Cierre:
  (close-output-port datos-de-lista)
  )

(define (problema3-rec L flujo)
  (if (not (empty? L))
      (begin
        (let
            (
             (x (list-ref (first L) 0))
             (y (list-ref (first L) 1))
             (z (list-ref (first L) 2))
             )          
          (display (eval Esfera) flujo)        
          )
        (display "\n" flujo)
        (problema3-rec (rest L) flujo))
      (void)))


; EJERCICIO 3
; (invertir-arbol (list (list (list null 3 null) 5 (list null 8 null)) 10 (list (list null 12 null) 15 (list null 20 null))))

(define (invertir-arbol A)
  (if (not (equal? A null))
      (begin
        (invertir-arbol (third A))
        (display (second A))
        (newline)
        (invertir-arbol (first A))
        )
      (void)
      )
  )