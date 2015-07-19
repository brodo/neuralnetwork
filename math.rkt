#lang racket
(require math/base)

(define (random-weight)
  (let ([between-0-and-0.2 (/ (random 2001) 10000)]
        [random-bool (= (random 2) 1)])
    (if random-bool between-0-and-0.2 (- between-0-and-0.2))
  )
)

(define (mean-squared-error errors)
  (let* ([combiner (lambda (curr acc) (+ acc (expt curr 2)))]
         [sum (foldl combiner 0 errors)])
    (/ sum (length errors))
  )
)

(define (sigmoid x)
  (/ 1 (+ 1 (expt euler.0 (- x))))
)

(provide random-weight mean-squared-error sigmoid)