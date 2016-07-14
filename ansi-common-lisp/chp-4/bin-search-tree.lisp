;;;; Program:
;;;;	bin-search-tree.lisp
;;;; Author:
;;;;	Paul Graham
;;;; Date:
;;;;	2016-07-14
;;;; Function:
;;;; 

(defstruct (node (:print-function 
                    (lambda (n s d) 
                        (format s "#<~A>" (node-elt n)))))
    elt (l nil) ( r nil))

(defun bst-insert (obj bst <)
    (if (null bst)
        (make-node :elt obj)
        (let ((elt (node-elt bst)))
            (if (eql obj elt)
                bst
                (if (funcall < obj elt)
                    (make-node
                        :elt elt
                        :l (bst-insert obj (node-l bst) <)
                        :r (node-r bst))
                    (make-node
                        :elt elt
                        :r (bst-insert obj (node-r bst) <)
                        :l (node-l bst)))))))





