(defun myreverse (lst)
	(if (null lst)
		nil
		(let ((y nil))
			(dolist (obj lst)
				(push (pop lst) y)
			)
			y
		)
	)
)
