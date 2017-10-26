require './board.rb'

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
        board.create_board(board)
      else
        # in the future would like to add something where you don't need
        # to terminate program but just need to enter correct input
        puts "Sorry but you must initialize the board, please terminate and start again"
      end
      while true
      puts question
      reply = gets.chomp.split(" ")

      if board.horizontal?(reply)
      	x1 = reply[1]
        y1 = reply[2]
        while x1 <= reply[3]
          board.grid[y1][x1] = "x"
          x1 = x1 +1
        end
        board.create_board(board)

      elsif board.vertical?(reply)
        x2 = reply[1]
        y2 = reply[2]
        while y2 <= reply[4]
          board.grid[y2][x2] = "x"
          y2 = y2 +1
        end
        board.create_board(board)

      elsif board.rectangle?(reply)
        x1 = reply[1]
        y1 = reply[2]
        x2 = reply[3]
        y2 = reply[4]
        y3 = reply[2] # so variables won't be changed or mixed up with previous iterations
        while x1 <= x2
          board.grid[y1][x1] = "x"
          board.grid[y2][x1] = "x"
          x1 = x1 +1
          while y3 > y2
            y3 = y3+1
          end
        end
        x2 = reply[3]
        y2 = reply[4]
        while y1 <= y2
          board.grid[y1][14] = "x"
          board.grid[y1][18] = "x"
          y1 = y1 +1
        end
        board.create_board(board)

      elsif board.bucket?(reply)
        #bucket - fill in method
        o = reply[3]
        reply = reply.map(&:to_i)
        x = reply[1]
        y = reply[2]
        # this ensures that the coordinates aren't in a box ( this could be improved )
        unless board.grid.transpose[x].include?('x') && board.grid[y].include?('x')
          board.grid.map do |arr|
            y = arr.count - 1
            next if arr.include? '-'
            while y > 0
              break if arr[y] == 'x'

              unless arr[y] == "|"
                arr[y] = o
              end
              y = y - 1
            end
          end
          sideways = board.grid.transpose
          # so I can get the boxes that are in between 'x's
          sideways.map do |arr|
            z = 0
            next if arr.include? "|"
            while z < arr.count
              break if arr[z] == 'x'
              unless arr[z] == "-"
                arr[z] = o
              end
              z = z + 1
            end
            y = arr.count - 1
            next if arr.include? "|"
            next if arr.include? o
            while y > 0
              break if arr[y] == 'x'
              unless arr[y] == "-"
                arr[y] = o
              end
              y = y - 1
            end
          end
        end

        unless sideways == nil
          board.grid = sideways.transpose
        end
        board.create_board(board)
      elsif reply[0] == "Q"
        break
      else
         puts 'I\'m sorry, but that is beyond the canvas capabilities.'
      end
  	end
  end
  ask " "

