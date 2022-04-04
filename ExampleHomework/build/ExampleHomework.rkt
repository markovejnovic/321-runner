#lang plai

(define eight-principles
  (list
  "Know your rights."
  "Acknowledge your sources."
  "Protect your work."
  "Avoid suspicion."
  "Do your own work."
  "Never falsify a record or permit another person to do so."
  "Never fabricate data, citations, or experimental results."
  "Always tell the truth when discussing your work with your instructor."))

; This is your solution file. You can do your solution here.
(define my-val 4)
(define isnt-this-great? true)

; No clue how this works, but it does
(define-syntax (test-true stx)
  (syntax-case stx ()
    [(_ result-expr)
     #`(generic-test 
        (λ () result-expr) 
        (λ (result-value)
          (values
           (cond
             [(exn:plai? result-value) result-value]
             [(equal~? result-value true) true]
             [else false])
           true))
        (quote #,(syntax->datum #'result-expr))
        (format "at line ~a" #,(syntax-line stx)))]
    [_ (print stx)]))

; Honestly, I have no clue how this works, but it does :)
(define-syntax (test-false stx)
  (syntax-case stx ()
    [(_ result-expr)
     #`(generic-test 
        (λ () result-expr) 
        (λ (result-value)
          (values
           (cond
             [(exn:plai? result-value) result-value]
             [(equal~? result-value false) true]
             [else false])
           false))
        (quote #,(syntax->datum #'result-expr))
        (format "at line ~a" #,(syntax-line stx)))]
    [_ (print stx)]))

; This is your test file. Write your test-cases here.
(test my-val 4)
(test-true isnt-this-great?)

