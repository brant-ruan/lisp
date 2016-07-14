; iterative
(defun mylength (lst)
	(if (consp lst)
		(let ((len 0))
			(dolist (obj lst)
				(setf len (+ len 1))
			)
			len
		)
		nil
	)
)

; recursive

(defun mylength-r (lst)
	(if (null lst)
		0
		(+ (mylength-r (cdr lst)) 1)
	)
)
