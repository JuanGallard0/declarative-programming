#lang racket

; Queremos invocar así:
; > (recorrer-arbol (list (list (list null 3 null) 5 (list null 8 null)) 10 (list (list null 12 null) 15 (list null 20 null))))
(define (recorrer-arbol A)
  (if (not (equal? A null))
      (begin
        (recorrer-arbol (first A))
        (display (second A))
        (newline)
        (recorrer-arbol (third A))
      )
      (void)
  )
)


; > (buscar-dato-en-arbol (list (list (list null 3 null) 5 (list null 8 null)) 10 (list (list null 12 null) 15 (list null 20 null))) 15)

(define (buscar-dato-en-arbol A dato)
  (if (not (equal? A null))
      (if (< dato (second A))
          (buscar-dato-en-arbol (first A) dato)
          (if (> dato (second A))
              (buscar-dato-en-arbol (third A) dato)
              (display "El dato se encuentra en el árbol\n")
          )
      )
      (display "El dato no se encuentra en el árbol\n")
  )
)

(define (crear-lista-rama-busqueda A dato)
  (crear-lista A dato null)
)

(define (crear-lista A dato L)
  (if (not (null? A))
      (if (< dato (second A))
          (crear-lista (first A) dato (append L (list (second A))))
          (if (> dato (second A))
              (crear-lista (third A) dato (append L (list (second A))))
              (append L (list (second A)))
          )
      )
      L
  )
)


(define (insertar-nodo-en-arbol A dato)
  (ins-nodo A dato)
)

(define (ins-nodo A dato)
  (if (equal? A null)
      (list null dato null)
      (if (equal? (second A) dato)
          A
          (if (< dato (second A))
              (list (ins-nodo (first A) dato) (second A) (third A))
              (list (first A) (second A) (ins-nodo (third A) dato))
          )
      )
  )
)

