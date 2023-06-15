>#### ***Lightsout Game***

Minigame written within Lisp where the player must flip a 3x3 grid on. 

Current version - v3.0

>#### ***Organization***
<br>
lightsout.lisp <br>
README.md <br>
<br>

>#### ***How to use***
<br>

    Player may call **(start)** to start the game. 

    The game will then print the board with random lights flickered on and for the Player to pick a space to toggle on.
    The lights will be toggled one in a "+" - like pattern 
    The game is finished when everything on the board is 0's, signifying that the lights are out. 

    The game will print the resultant moves it took for Player to solve the puzzle as well. 

    Player may also call **(autoplay)** to see an AI attempt to play the game. 
    The AI will stop playing once it has made over 25 moves. 

...

>#### ***Design Notes***

    Fully game is fully implemented.

    Game is based on a 3x3 board but instead we use a list 9 long
    The game board is consistently recreated whenever a light is toggled on
    Game generates a randomly list 9 long with lights randomly on to create a gameplay loop.

    Each light toggle is programmed seperately as their own functions. Users may test them by calling them accordingly.

    Board can be tested calling **toggle-test** to see if the lights are correctly functioning

    An unoptimized AI may also run the game but clocks out at 25 moves to prevent overflow errors.

    Program may be intruppted at any point by inputting a char of any type. 


...

