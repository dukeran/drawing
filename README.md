<h2>Welcome to the beta-canvas!</h2>

It's simple to use, simply drop into the drawing directory and run $ ruby program.rb. You'll be given instructions and a prompt to continue from there. No need to install anything!

<h3>The following are commands for the program:</h3>

Command 		Description
<strong>C w h</strong>  --- Should create a new canvas of width w and height h.<br><br>
<strong>L x1 y1 x2 y2 </strong> --- Should create a new line from (x1,y1) to (x2,y2). Currently only<br>
                         horizontal or vertical lines are supported. Horizontal and vertical lines<br>
                         will be drawn using the 'x' character.<br><br>
<strong>R x1 y1 x2 y2 </strong> --- Should create a new rectangle, whose upper left corner is (x1,y1) and
                lower right corner is (x2,y2). Horizontal and vertical lines will be drawn
                using the 'x' character.<br><br>
<strong>B x y c    </strong    --- Should fill the entire area connected to (x,y) with "colour" c. The
                behaviour of this is the same as that of the "bucket fill" tool in paint
                programs.<br><br>
<strong>Q  </strong    ---         Should quit the program.<br>

__Sample I/O__

<h3>Below is a sample run of the program. User input is prefixed with enter command:</h3>

      enter command: C 20 4
      ----------------------
      |                    |
      |                    |
      |                    |
      |                    |
      ----------------------

      enter command: L 1 2 6 2
      ----------------------
      |                    |
      |xxxxxx              |
      |                    |
      |                    |
      ----------------------

      enter command: L 6 3 6 4
      ----------------------
      |                    |
      |xxxxxx              |
      |     x              |
      |     x              |
      ----------------------

      enter command: R 14 1 18 3
      ----------------------
      |             xxxxx  |
      |xxxxxx       x   x  |
      |     x       xxxxx  |
      |     x              |
      ----------------------

      enter command: B 10 3 o
      ----------------------
      |oooooooooooooxxxxxoo|
      |xxxxxxooooooox   xoo|
      |     xoooooooxxxxxoo|
      |     xoooooooooooooo|
      ----------------------

      enter command: Q to quit



 * * *

<h4>This was written by Kerrie Durham and it is version 1.0.0 at 017-10-26 06:45:49 -0400</h4>

