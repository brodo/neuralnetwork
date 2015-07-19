#lang racket
(require "math.rkt")
(struct neuron (weights bias) #:transparent #:mutable)

(define (random-neuron number-of-inputs)
  (let ([weights (build-list number-of-inputs (λ (x) (random-weight)))]
        [bias (random-weight)])
    (neuron weights bias))
)

(define (process-neuron inputs neuron)
  (let* ([bias (neuron-bias neuron)]
        [weights (neuron-weights neuron)]
        [input-weight-products (map * weights inputs)]
        [input-weight-sum (foldl + 0 input-weight-products)])
    (sigmoid (+ input-weight-sum bias))
  )
)

(define (random-layer number-of-neurons number-of-inputs)
  (let ([neuron-builder (λ (x) (random-neuron number-of-inputs))])
    (build-list number-of-neurons neuron-builder)
  )
)

(define (process-layer layer inputs)
  (map (curry process-neuron inputs) layer)
)

(define (process-network layers inputs)
  (foldl process-layer inputs layers))