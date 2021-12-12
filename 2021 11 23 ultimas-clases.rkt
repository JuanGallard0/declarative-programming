#lang racket

; Elabore una función que almacene en un archivo
; los datos que se leen desde teclado, uno por fila,
; hasta introducir cero.
(define (leer-hasta-cero)
  ; Apertura:
  (define datos-de-teclado (open-output-file "datos-de-teclado.txt" #:mode 'text #:exists 'replace))
  ; Procesamiento:
  (leer-hasta-cero-rec datos-de-teclado)
  ; Cierre:
  (close-output-port datos-de-teclado)
)

(define (leer-hasta-cero-rec flujo)
  (local
    (
     (define dato (read))
    )
    (if (not (equal? dato 0))
        (begin
          (display dato flujo)
          (display "\n" flujo)
          ;(newline flujo)
          (leer-hasta-cero-rec flujo)
        )
        (void)
    )
  )
)
    

; Elabore una función que, dada una lista de números enteros,
; almacene en un archivo los valores de la lista, uno por fila.
(define (guardar-datos-de-lista L)
  ; Apertura:
  (define datos-de-lista (open-output-file "datos-de-lista.txt" #:mode 'text #:exists 'replace))
  ; Procesamiento:
  (guardar-datos-de-lista-rec L datos-de-lista)
  ; Cierre:
  (close-output-port datos-de-lista)
)

(define (guardar-datos-de-lista-rec L flujo)
  (if (not (empty? L))
      (begin
        (display (first L) flujo)
        (display " " flujo)
        (guardar-datos-de-lista-rec (rest L) flujo))
      (void)))


; Elabore una función que, dada una lista de números enteros,
; almacene en un archivo los factoriales de dichos números.
(define (guardar-factoriales L)
  ; Apertura:
  (define datos-de-lista (open-output-file "factoriales-de-lista.txt" #:mode 'text #:exists 'replace))
  ; Procesamiento:
  (guardar-factoriales-rec L datos-de-lista)
  ; Cierre:
  (close-output-port datos-de-lista)
)

(define (guardar-factoriales-rec L flujo)
  (if (not (empty? L))
      (begin
        (display (factorial (first L)) flujo)
        (display " " flujo)
        (guardar-factoriales-rec (rest L) flujo))
      (void)))

(define (factorial n)
  (if (> n 1)
      (* n (factorial (- n 1)))
      1))



;derivada de:

;una constante:                      n
;de x:                               'x
;de una constante por x:             '(* n x)
;de una constante por una función:   '(* n x)
;de x a la n:                        '(expt x n)

;Derivada de una constante:
(define (deri-cte x Expresion)
  (if (number? Expresion)
      0
      'Falta_construir_más_derivadas
  )
)


;Derivada de x respecto a x:
(define (deri-x x Expresion)
  (if (equal? Expresion x)
      1
      'Falta_construir_más_derivadas
  )
)


;Incorporando los dos casos de derivada ya realizados:
(define (deri-dos x Expresion)
  (if (number? Expresion)
      0
      (if (equal? Expresion x)
          1
          'Falta_construir_más_derivadas
      )
   )
)
  

; Función que contempla varias derivadas:
(define (deri x Expresion)
  (if (number? Expresion) ;Derivada de una constante.
      0
      (if (equal? Expresion x) ;Derivada de x respecto a x.
          1
          (let
              (
               (u (second Expresion))
               (v (third Expresion))
              )
              (case (first Expresion)
                ((expt) ;Derivada de x a la n.
                 (if (and (equal? u x) (number? v))
                     (list '* v (list 'expt u (- v 1)))
                     'Falta_construir_más_derivadas_con_potencia
                 ))
                ((*)
                 (if (and (number? u) (equal? v x)) ;Derivada una constante por x.
                     u
                     (if (and (number? u) (list? v)) ;Derivada una constante por una función.
                         (list '* u (deri x v))
                         (if (and (list? u) (list? v))
                             (list '+ (list '* (deri x u) v) (list '* u (deri x v)))
                             (void)
                             )
                     )))
                ((/)
                 (if (and (list? u) (list? v))
                     (list '/ (list '- (list '* (deri x u) v) (list '* u (deri x v))) (list 'sqr v))
                     (void)
                 )
                )
                ((+)
                 (if (and (list u) (list v))
                     (list '+ (deri x u) (deri x v))
                     (void)
                 ))
                ((-)
                 (if (and (list u) (list v))
                     (list '- (deri x u) (deri x v))
                     (void)
                 ))
            )
       )
    )
  )
)


; Hacer: la derivada de la suma de dos funciones, de la resta de
; dos funciones, del producto y del cociente


(define x 10.0)

(define f '(- (expt x 2) 4))

;Método de Newton-Raphson para converger a la raíz de una función:
(define (N-R)
  (let
      (
       (xSig (- x (/ (eval f) (eval (deri 'x f))))) 
      )
      (if (>= (abs (- xSig x)) 0.0001)
          (begin
            (display xSig)
            (newline)
            (set! x xSig)
            (N-R)
          )
          xSig
      )
  )
)


(define (ecCircunferencia h k a b)
  (let
      (
       (rCuad (+ (sqr (- a h)) (sqr (- b k))))
      )
      (list '= (list '+ (list 'sqr (list '- 'x h)) (list 'sqr (list '- 'y k))) rCuad)
  )
)


(define (ecuacionRecta x1 y1 x2 y2)
  (let*
      (
       (m (/ (- y2 y1) (- x2 x1)))
       (b (- y1 (* m x1)))
      )
      (list '+ (list '* (eval m) 'x) (eval b))
  )
)


;;;;;;;;; Integrales ;;;;;;;;;;
(define (integralEjm1 x expresion)
  (if (number? expresion)
      (list '* expresion 'x)
      (void) ;Pendiente para más integrales
  )
)


(define (integralEjm2 x Expresion)
  (if (equal? Expresion 'x)
      (list '* 1/2 '(sqr x))
      (void) ;Pendiente para más integrales
  )
)


(define (integralEjm3 x Expresion)
  (if (number? Expresion)
       (list '* Expresion 'x)
      (if (equal? Expresion 'x)
          (list '* 1/2 '(sqr'x))
          'Pendiente_de_construir_más_integrales
      )
  )
)



(define (integral x Expresion)
  (if (number? Expresion)
      (list '* Expresion 'x)
      (if (equal? Expresion 'x)
          (list '* 1/2 (list 'sqr x))
          (let
              (
               (u (second Expresion))
               (v (third Expresion))
              )
              (case (first Expresion)
                ((*)
                 (if (and (number? u) (equal? v x))
                     (list '* u 1/2 (list 'sqr x))
                     (void)
                 ))
              )
          )
      )
  )
)


(define (evaluar-integral var expresion a b)
  (let*
      (
       ;(x 0) ; Ya está definida en este archivo más arriba.
       (I (integral var expresion))
       (Ia 0)
       (Ib 0)
      )
      (set! x a)
      (set! Ia (eval I))
      (set! x b)
      (set! Ib (eval I))
      (- Ib Ia)
  )
)
