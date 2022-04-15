; All list-utilities are prefixed with a dollar sign
(define $e empty)
(define $cat append)
(define $ list)
(define $in? member)
(define ($nin? x xs) (not ($in? x xs)))
