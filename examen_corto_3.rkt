; EXAMEN CORTO 3
; GRUPO DE 2 INTEGRANTES:
; Juan Humberto Gallardo Hernández 00091813
; Mario Andrés Cálix Sosa 00309119

#lang racket


; Ejercicio 1
; Consulta: (ConvertirCadALista "hola")

(define (ConvertirCadALista cad)
  (CadALista cad 0 '())
  )

(define (CadALista cad i L)
  (if(< i (string-length cad))
     (CadALista cad (add1 i) (append L (list (string-ref cad i))))
     L
     )
  )


; Ejercicio 2
; Consulta: (ConvertirCadAListaInv "hola")

(define (ConvertirCadAListaInv cad)
  (CadAListaInv cad 0 '())
  )

(define (CadAListaInv cad i L)
  (if(< i (string-length cad))
     (CadAListaInv cad (add1 i) (append (list (string-ref cad i)) L))
     L
     )
  )


; Ejercicio 3
; Consulta: (UnirListasGrupo (list 1 2 3 4 5) (list 6 7 8 9 10) (list 11 12 13 14 15))

(define (UnirListasGrupo L1 L2 L3)
  (ListasGrupo  L1 L2 L3 '())
  )

(define (ListasGrupo L1 L2 L3 UL)
  (if (not (empty? L1))
      (ListasGrupo (rest L1) (rest L2) (rest L3) (append UL (list (first L1)) (list (first L2)) (list (first L3))))
      UL
      )
  )


; Ejercicio 4
; Consulta: (UnirListas (list 1 2 3 4 5) (list 6 7 8 9 10) (list 11 12 13 14 15))

(define (UnirListas L1 L2 L3)
  (append (list L1) (list L2) (list L3))
  )


; Ejercicio 5
; Consulta: (ClasificarLista (list #\a "hello" 4 '+ #\e "uca" 15 '_))

(define (ClasificarLista L)
  (Clasificar  L '() '() '() '())
  )

(define (Clasificar L LNum LStr LSym LChar)
  (if (not (empty? L))
      (cond
        ((number? (first L)) (Clasificar (rest L) (append LNum (list (first L))) LStr LSym LChar))
        ((string? (first L)) (Clasificar (rest L) LNum (append LStr (list (first L))) LSym LChar))
        ((symbol? (first L)) (Clasificar (rest L) LNum LStr (append LSym (list (first L))) LChar))
        ((char? (first L)) (Clasificar (rest L) LNum LStr LSym (append LChar (list (first L)))))
        )
      (begin
        (display LNum)
        (newline)
        (display LStr)
        (newline)
        (display LSym)
        (newline)
        (display LChar)
        )
      )
  )