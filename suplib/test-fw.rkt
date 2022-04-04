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
