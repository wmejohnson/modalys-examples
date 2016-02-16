;wm johnson
;exploring the felt connection

(new)

;objects
(setf string-1 (make-object 'mono-string))
(setf hammer-1 (make-object 'bi-two-mass))

;felt connection
(setf string-1-access (make-access string-1 (const 0.2) 'trans0))
(setf hammer-1-access (make-access hammer-1 (const 1) 'trans0))
(make-connection 'felt hammer-1-access .1 string-1-access 0 
                 (const 0.01)
                 (const 1e+9)
                 (const 2.5)
                 (const 0.83)
                 (const 35e-04)
                 )

;make the hammer move
(setf hammer-1-mov (make-access hammer-1 (const 0) 'trans0))

(make-connection 'position hammer-1-mov 
                 (make-controller 'envelope 1
                                  '( (0.0 .1)
                                     (0.01 -0.001)
                                     (0.02 .1)
                                    )))

;make lsitening points
(setf listen (make-access string-1 (const 0.6) 'trans0))

(make-point-output listen)


(run 10)
(play)