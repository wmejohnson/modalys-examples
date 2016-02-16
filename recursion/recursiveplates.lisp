; wm johnson
; recursively generating modal models

(new) 

(defun make-plate (freq)
  ;make plate
  (setf my-plate (make-object 'clamped-circ-plate
                              (thickness 60.1)
                              (freq-loss 0.1)
                              (density 9000)
                              (radius 1000)
                              ))
  (set-pitch my-plate 'young (const freq))

  ;make plate access
  (setf plate-access (make-access my-plate (const 0.9 120) 'normal))
  
  ;make connection
  (make-connection 'force plate-access (const 1))

  ;make output
  (make-point-output plate-access)

  )

(setf freq 50)
(defun recurse (depth)
  (make-plate freq)
  (setf freq (get-info 'mode-frequency my-plate 1))
  (run 1)
  (cond
   ((> depth 0) (recurse (- depth 1)))
   )
)

(recurse 4)

;(save-object my-plate  "/Users/wmjohnson/Desktop/test.txt")
(run 2)
(play)
