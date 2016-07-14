4.
```lisp
(defun greater (x y)
	(if (> x y)
		x
		y
	)
)
```
5.

(a)
```lisp
(defun enigma (x)
	(and (not (null x))
		(or (null (car x))
			(enigma (cdr x))
		)
	)
)
; to judge whether there is a nil in x
```
(b)
```lisp
(defun mystery (x y)
	(if (null y)
		nil
		(if (eql (car y) x)
			0
			(let ((z (mystery x (cdr y))))
				(and z (+ z 1))
			)
		)
	)
)
; return the index of x in y (if not exist, return nil)
```
6.
```lisp
(a) (car (car (cdr '(a (b c) d))))
(b) (or 13 (/ 1 0))
(c) (funcall (lambda (x y z) (list (car (funcall x y z)))) #'list 1 nil)
```
7.
```lisp
; recursive version

(defun testlist (x) 
	(if (not (listp x)) 
		nil ; not list, return nil
		(if (null x) 
			nil ; is empty, return nil
			(if (listp (car x))
				t ; match the request, return true
				(testlist (cdr x)) ; recurisvely test the rest
			)
		)
	)
)

; iterative version

(defun testlist (x)
	(if (not (listp x))
		nil ; not list, return nil
		(if (null x)
			nil
			(let ((res nil))
				(dolist (obj x)
					(if (listp obj)
						(setf res t) ; res to record the judgement
						nil
					)
				)
				res ; return res
			)
		)
	)
)
```

8.

(a)
```lisp
; iterative

(defun PrintDot (x)
	(do ((i 1 (+ i 1)))
		((> i x) 'done)
		(format t ".")
	)
	(format t "~%")
)

; recursive

(defun PrintDot (x)
	(if (> x 0)
		(progn
			(format t ".")
			(PrintDot (- x 1))
		)
		nil
	)
)
```
(b)
```lisp
; iterative

(defun testa (x)
	(if (not (listp x))
		nil
		(let ((res 0))
			(dolist (obj x)
				(if (eql obj 'a)
					(setf res (+ res 1))
				)
			)
			res
		)
	)
)

; recursive

(defun testa (x)
	(if (not (listp x))
		nil
		(if (null x)
			0
			(let
				((z (if (eql (car x) 'a)
					1
					0
				)))
				(setf z (+ z (testa (cdr x))))
				z
			)
		)
	)
)
```

9.

(a)
```lisp
(defun summit (lst)
	(setf lst (remove nil lst))
	(apply #'+ lst)
)
```
(b)
```lisp
(defun summit (lst)
	(if (null lst)
		0
		(let ((x (car lst)))
			(if (null x)
				(summit (cdr lst))
				(+ x (summit (cdr lst)))
			)
		)
	)
)
```
