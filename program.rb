require './board'
require './draw_program.rb'

include DrawProgram

  puts 'Congratulations! You have been chosen to beta-test our new canvas program! We have a few commands that you can run
  to create your ultimate masterpiece.
      Use C w h to create a new canvas with your specified width and height.
      Use L x1 y1 x2 y2 to create new lines
      Use R x1 y1 x2 y2 to crate a new rectangle
      Use B x y c to bucket fill
      And Use Q to quit the program.'
  puts nil
  puts 'Let\'s get started!'
  puts nil

  def ask question
      reply = gets.chomp.split(" ")
      if reply[0] == "C"
        reply = reply.map(&:to_i)
        board = Board.new(reply[1], reply[2])
        board.display_board(board)
      else
        puts "Sorry but you must initialize the board, please terminate and start again"
      end
      while true
      puts question
      reply = gets.chomp.split(" ")

      #if line is horizontal draw a horizontal line
      if line_is_horizontal?(reply)
        draw_horizontal_line(reply, board)

      #if line is verticle, draw a vertical line
      elsif line_is_vertical?(reply)
        draw_vertical_line(reply, board)

      #if command is a rectangle, create a rectangle
      elsif command_is_a_rectangle?(reply)
        draw_a_rectangle(reply, board)

      #fill the canvas based on wehther or not it is in a box
      elsif fill_canvas?(reply)
        fill_the_canvas(reply, board)

      #quit program
      elsif reply[0] == "Q"
        break
      else
         puts 'I\'m sorry, but that is beyond the canvas capabilities.'
      end
    end
  end
  ask " "

