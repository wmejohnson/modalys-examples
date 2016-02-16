;;using 'random contorller 

(new)

;objects
;a mono-string moves in one direction
(setf my-string (make-object 'mono-string))

;accesses
;here 'trans0 is a reference to the direction of the vibration
;if we were using a bi-string we would have access to both 'trans0 and 'trans1 etc...
(setf force-access (make-access my-string (const .1) 'trans0))

;controllers
;here is our random controller, it takes two parameters - dimension and period(seconds). these can not be controllers
(setf random (make-controller 'random 1 0.2))

;connection
;here i am using a the most simple connection - a force connection
(make-connection 'force force-access random)

;i use two point accesses to output a stereo file - fun trick
(setf out-access.l (make-access my-string (const .6) 'trans0))
(setf out-access.r (make-access my-string (const .2) 'trans0))

(make-point-output out-access.l 0 (const 1))
(make-point-output out-access.r 1 (const 1))

;run and play
(run 5)
(play)