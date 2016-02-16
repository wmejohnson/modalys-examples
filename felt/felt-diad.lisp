;wm johnson
;felt diads
(new)

(defun playDiad (number p1 p2)
;objects
  (setf string-1 (make-object 'mono-string (const-loss 2)))
  (set-pitch string-1 'length p1)
  (setf string-2 (make-object 'mono-string (const-loss 1.5)))
  (set-pitch string-2 'length p2)
  (setf hammer-1 (make-object 'bi-two-mass))

  ;felt connection
  (setf string-1-access (make-access string-1 (const 0.1) 'trans0))
  (setf string-2-access (make-access string-2 (const 0.5) 'trans0))
  (setf hammer-1-access (make-access hammer-1 (const 1) 'trans0))
  (make-connection 'felt hammer-1-access .1 string-1-access 0 
                   (const 0.01)
                   (const 1e+4)
                   (const 2)
                   (const .13)
                   (const 35e-2)
                   )

  (make-connection 'felt hammer-1-access .1 string-2-access 0 
                   (const 0.01)
                   (const 1e+4)
                   (const 2)
                   (const .13)
                   (const 35e-2)
                   )

  ;make the hammer move
  (setf hammer-1-mov (make-access hammer-1 (const 0) 'trans0))

  (setq hmov (make-connection 'position hammer-1-mov 
                   (make-controller 'envelope 1
                                    '( (0.0 .1)
                                       (0.01 -0.001)
                                       (0.02 .1)
                                       ))))

  ;make lsitening points
  (setf listen (make-access string-1 (const 0.1) 'trans0))
  (setf listen2 (make-access string-2 (const 0.1) 'trans0))

  (make-point-output listen 0)
  (make-point-output listen2 1) 


  (run 10)
  (play)
  (save-aiff (format NIL "../../Users/wmjohnson/Google\ Drive/2016/feb/modalys/iter/mysound-~S.aiff" number))

)


(defvar counter)
(setq counter 0)

(loop for x in '(200 200 100)
      for y in '(240 700 70)
          do (playDiad counter x y)
             (setq counter (+ counter 1))
             )


