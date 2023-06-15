;; Author @ Justin L.

;; The board is represented by a list 9 long
;; which is a 3x3 board.
;;
(defun print-board (board)
  (if (= 0 (mod (length board) 3))
    (format t "~% ~a" (car board))
    (format t " ~a" (car board))
  )
  (if (null (rest board))
      (format t "~%") ;; TODO: NEWLINE HERE.
      (print-board (rest board)))
)

;; Creates a 3x3 board and randomly flickers on 1 light on the board
;; @Params
;; gameboard : list of length 9 with lights randomly toggled on
(defun start ()
  (let (
  (gameboard (gen))
  )
  (driver gameboard 0)
  )
)

;; Lets a really dumb ai play the game for you
(defun autoPlay ()
  (let (
  (gameboard (gen))
  )
  (fullauto gameboard 0)
  )
)

;; Copy-Paste of Driver but automated to randomly pick a move
;; Driver code for the AI Alg
(defun fullauto (oldBoard count)

  (print-board oldBoard)

  (let (
    (newBoard (toggle-one oldBoard (random 9))) ;; Randomly chooses a move 
  ) ;; Pray that it somehow solves it

  (defun checkAuto (counter)
  (if (> counter 25) ;; Can be increased but most consistent to avoid overflow
    (format t "AI took too long... - ~a moves were made." count)
    (fullauto newBoard (+ 1 count))
  )
)

  (if (lightsout newBoard)
    (format t "AI won in ~a moves ~%" count) ;; Print count
    (checkAuto count)
  )
  )
)

;; Will continue to run the game until the win condition is met
(defun driver (oldBoard count)

  (print-board oldBoard)

  (let (
    (newBoard (toggle-one oldBoard (get-input "Chose a position 0 - 8 to toggle: ")))
  )

  (if (lightsout newBoard)
    (format t "You won in ~a moves ~%" count) ;; Print count
    (driver newBoard (+ 1 count))
  )
  )
)

;; Prompts the user to pick a valid number.
;; @Params
;; prompt : string - Message instructing the user on what to do
;; usernum : int - Userinput within the valid range
(defun get-input (prompt)
  (format T prompt)
    (let ( (usernum (read)))
    (if (or (< usernum 0) (> usernum 9))
      (get-input "Position must be from 0 - 8. Enter Again: ")
      usernum
    )
  )
)

;; Generates the game board
;; @Params
;; board : list - List (size 9) that will be randomized for the game
(defun gen ()
  (rnd-list-9 2 9)
)

;; Creates a random list of 9 
;; limit : int -  The range of numbs generating
;; count : int - Quantity of nums getting generated
(defun rnd-list-9 (limit count)
  (cond ((<= count 0)
         nil)
        (t
         (cons (random limit)
               (rnd-list-9 limit (1- count)))))
)

;; Function that toggles one light on the board, choose 0-8 for position
;; board : list - The 3x3 board getting passed through
;; pos : int - Position the player has chosen to flip on or off
(defun toggle-one (board pos)

  (toggle-main (toggle-left (toggle-right (toggle-bot (toggle-up board pos) pos) pos) pos) pos) 

)

;; Function that toggles the initial target on or off
;; board : list - The 3x3 board getting passed through
;; pos : int - Position the player has chosen to flip on or off
(defun toggle-main (board pos)
    (if (zerop pos) 
      (cons (opposite (first board)) (rest board)) 
      (cons (first board) (toggle-main (rest board) (- pos 1))) ;; We keep Consing the list until we reach player position
    )
)

;; Function that toggles the left light given the position
(defun toggle-left (board position)
  (if (or (eql position 0) (eql position 3) (eql position 6))
    board
    (toggle-main board (- position 1))
  )
)

;; Toggle all lights but not positions 2,5,8
(defun toggle-right (board position)
  (if (or (eql position 2) (eql position 5) (eql position 8))
    board
    (toggle-main board (+ position 1))
  )
)

;; Toggle all lights but not positions > 5
(defun toggle-bot (board position)
  (if (> position 5)
    board
    (toggle-main board (+ position 3))
  )
)

;; Toggle all lights but not positions < 3
(defun toggle-up (board position)
  (if (< position 3)
    board
    (toggle-main board (- position 3))
  )
)


;; Checks the whole board if it is full and prompts if it is or not
;; @Params 
;; board : list - The board 9 long that is being checked if lights out.
(defun lightsout (board)
    (if (null (first board)) ;; If null, board is not fully off
    t
      (if (zerop (first board))
        (lightsout (rest board)) ;; Continues to check if there is a 1 present
        nil) 
    )
)

;; Function that flips the toggle on and off if 1 or 0.
;; @Params 
;; aval : int - takes an int from toggle-one and inverts it from 0 to 1 or vice versa.
(defun opposite (aval)
  (if (zerop aval)
    1
    0
  )
)

;; Simple test to see if the toggle-one function works
(defun toggle-test() 
  (and (equal '(0 1 0 0 0 0 0 0 0)
        (toggle-one'(0 0 0 0 0 0 0 0 0) 1)))
  (and (equal '(0 0 0 0 0 0 0 0 0)
        (toggle-one'(0 1 0 0 0 0 0 0 0) 1)))
)