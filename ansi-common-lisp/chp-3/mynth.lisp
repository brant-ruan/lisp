(defun mynth (n lst)
	(if (zerop n)
		(car lst)
		(mynth (- n 1) (cdr lst))
	)
)