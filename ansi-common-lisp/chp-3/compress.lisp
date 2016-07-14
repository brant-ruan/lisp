; Chapter 3
; Compress
(defun compress (x)
	(if (consp x)
		(compr (car x) 1 (cdr x))
		x
	)
)

(defun compr (elt n lst)
	(if (null lst)
		(list (n-elts elt n)) ; if no elt rest, compress elt
		(let ((next (car lst)))
			(if (eql next elt)
				(compr elt (+ n 1) (cdr lst)) ; if elt rest, n = n+1
				(cons (n-elts elt n)
					(compr next 1 (cdr lst)) ; compress elt; do next
				)
			)
		)
	)
)

(defun n-elts (elt n)
	(if (> n 1)
		(list n elt)
		elt
	)
)

; Uncompress
(defun uncompress (lst)
	(if (null lst)
		nil
		(let ((elt (car lst))
			(rest (uncompress (cdr lst))))
			(if (consp elt)
				(append (apply #'list-of elt) rest) ; uncompress elt
				(cons elt rest) ; link elt with rest
			)	
		)
	)
)

(defun list-of (n elt)
	(if (zerop n)
		nil
		(cons elt (list-of (- n 1) elt))
	)
)
