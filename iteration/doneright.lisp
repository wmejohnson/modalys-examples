; iteration
; save suble (or not) variations of a sound to a multichannel audiofile

(new)

;now we make a function with the 'instrument' we are trying to create
;the first argument is the strings radius and the second is the channel number
(defun make-inst (rad count)
  "creates a basic mono-string setup with string radius as a variable"
  (setf my-string (make-object 'mono-string 
                               (length 0.5)  
                               (radius rad)
                               ))
  (setf string-access (make-access my-string (const 0.3) 'trans0))
  (setf out-access (make-access my-string (const 0.1) 'trans0))
  (make-connection 'force string-access (const 1) 'trans0)
  ;here you set the audio channel with count and increment the counter
  (make-point-output string-access count)
)

;here's the crux of it
;(mapcar f l) where f is our create-inst function and l is a list of the arguments it wants. the number of arguments you provide will be the number of audio channels
(mapcar 'make-inst '(9e-5 2e-4 7e-3)'(0 1 2))

;here's a way to do it with looping
;(loop
; for i from 1 to 10
; do
; 
; (make-inst (/ 1 i) (- i 1))
;)

(run 5)
(play)

(save-aiff "/Users/wmjohnson/Documents/Modalys/blog/iteration/results/output.aiff")

;special thanks to jb on this one