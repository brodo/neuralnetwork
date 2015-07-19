#lang racket
(require "neuron.rkt")
(require racket/format)
(define inputs 
  (list 1 1 1 1               
        1 0 0 1
        0 0 1 0
        0 1 0 0
        1 1 1 1))

(define network (list (random-layer 10 20) (random-layer 2 10)))

(let* ([outputs (process-network network inputs)]
       [str-list (map (compose ~r round) outputs)])
   (string->number (string-join str-list "") 2))