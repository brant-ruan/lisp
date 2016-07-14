; 9
; copied from the book and modified
(defun shortest-path (start end net)
	(bfs end (list (list start)) net))

(defun bfs (end queue net)
	(if (null queue)
		nil
		(let ((path (car queue)))
			(let ((node (car path)))
				(if (and (eql node end) (null (cdr queue)))
					(reverse path)
					(bfs end
						(append (cdr queue) 
								(new-paths path node end net))
								net))))))

(defun new-paths (path node end net)
	(if (equal node end)
		nil
		(let ((tmplst (mapcar #'(lambda (n) (cons n path)) (cdr (assoc node net))))
			  (reslst nil))
			(dolist (obj tmplst)
				(if (> (no-repeat obj) (length obj)) 
					(setf reslst (cons obj reslst))
					nil))
			reslst)))

(defun no-repeat (lst)
	(let ((tmplst nil))
		(do ((i 1 (+ i 1)))
			((or (member (nth (- i 1) lst) tmplst) (> i (length lst))) i)
			(setf tmplst (cons (nth (- i 1) lst) tmplst)))))

