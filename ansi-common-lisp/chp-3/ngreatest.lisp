
(defun ngreatest (n lst func)
	(nth (- n 1) 
		(sort (copy-list lst) func)
	)
)
