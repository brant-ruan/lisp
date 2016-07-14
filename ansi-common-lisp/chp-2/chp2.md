
#### 2.10 Variables

> let ; define local variables

```lisp
; x y are local variables
(let ((x 1) (y 2))
	(+ x y)
)
```

```lisp
; the function doesn't stop until you enter a number
(defun ask-number ()
	(format t "Please enter a number. ")
	(let ((val (read)))
		(if (numberp val)
			val
			(ask-number)
		)
	)
)
```

> defparameter ; define global variables

; to avoid the same with local variables, we use \*\*

`> (defparameter *glob* 99)`

> defconstant ; define constants

`> (defconstant limit (+ *glob* 1))`

> boundp ; test whether a symbol is a global variable or constant

`> (boundp '*glob*)`

#### 2.11 Assignment

> setf ; assign global/local variables

`(setf *glob* 98)`
; if the first variable is a symbol but not a name of local variable, setf will set it as global variable
```lisp
(let ((n 10))
	(setf n 2)
	n
)
```

setf can also:

```lisp
(defparameter x (list 'a 'b 'c))
(setf (car x) 'n)
; x will be (N B C)
```

setf can also:

`(setf a 'b c 'd e 'f)`

#### 2.12 Function Programming

> Function Programming means using the return value and not changing original things. It allows interactive testing

```lisp
; lst won't be changed
(setf lst '(c a r a t))
(remove 'a lst)
; x will be changed
(setf x (remove 'a x))
```

; so you'd better not use functions like *setf*

#### 2.13 Iteration

> *do* is the basic iterative symbol and it can create variables. The first actual variable is a format list of a group variables; each element in the list is (variable initial update)
> The second actual variable contains one or more expressions.The first expression used to test whether the iteration reach end.The rest expressions will be calculated and the last expression's value will be returned

```lisp
; iteration
(defun show-squares (start end)
	(do ((i start (+ i 1))) ; counter
		((> i end) 'done) ; done will be returned
		(format t "~A ~A~%" i (* i i)) ; main iteration
	)
)
; recursive
(defun show-squares (start end)
	(if (> start end)
		'done
		(progn ; accept expressions and return the last value
			(format t "~A ~A~%" start (* start start))
			(show-squares (+ start 1) end)
		)
	)
)
```

```lisp
; iterate in a list:
(defun our-length (lst)
	(let ((len 0))
		(dolist (obj lst)
			(setf len (+ len 1))
		)
		len
	)
)
; recursive version
(defun our-length (lst)
	(if (null lst)
		0
		(+ (our-length (cdr lst)) 1)
	)
)
; it is not tail-recursive
```

#### 2.14 Functions as Objects

> Functions are objects like symbols.

`(function +) ; return the funtcion of object`
`#'+`
; We use \#'(sharp quote) as the abbreviation of function

`apply #'+ '(1 2 3)`
*apply* can accept funciton as actual parameter,and then a actual parameter list

you can also use *funcall* and don't need the actual parameter to be in a list

`(funcall #'+ 1 2 3)`

`(lambda (x) (+ x 100))`
> *defun* creates a function and names it. But funciton doesn't need name. So we can use *lambda* expression

`(lambda (x y) (+ x y))`
(x y) is formal parameters list
(+ x y) is the function body
So?
`((lambda (x) (+ x 100)) 1)`
is ok.
`(funcall #'(lambda (x) (+ x 100)) 1)`
is ok.

#### 2.15 Types

only numbers have types;variables don't have types
27 is a number, and it belongs to *fixnum,integer,rational,real,number,atom,t*
*t* is the supertype and all the objects belong to it	

`typep 27 'integer`
*typep* accept an object and a type


#### 2.16 Looking Forward

Practice!

