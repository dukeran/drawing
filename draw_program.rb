module DrawProgram
  #use reply to determine if the first comman is a draw rectangle or fill

  #if y1 = y2 then draw a horizontal line
  def line_is_horizontal?(reply)
    reply[0] == 'L' && reply.map(&:to_i)[2] == reply.map(&:to_i)[4]
  end

  #iterate through the array while keeiping y constant
  def draw_horizontal_line(reply, board)
    reply = reply.map(&:to_i)
    x1 = reply[1]
    y1 = reply[2]
    while x1 <= reply[3]
      board.grid[y1][x1] = "x"
      x1 = x1 +1
    end
    board.display_board(board)
  end

  #if x1 = x2 then draw a verticle line
  def line_is_vertical?(reply)
    reply[0] == 'L' && reply.map(&:to_i)[1] == reply.map(&:to_i)[3]
  end

  #iterate through the array while keeping x constant
  def draw_vertical_line(reply, board)
    reply = reply.map(&:to_i)
    x2 = reply[1]
    y2 = reply[2]
    while y2 <= reply[4]
      board.grid[y2][x2] = "x"
      y2 = y2 +1
    end
    board.display_board(board)
  end

  #if value of first index is R, then command is to draw a rectangle
  def command_is_a_rectangle?(reply)
    reply[0] == "R"
  end

  #iterate through two different plans of array to create rectangle
  def draw_a_rectangle(reply, board)
    reply = reply.map(&:to_i)
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
    while y1 <= y2
      #need to fix hardcoding
      board.grid[y1][reply[1]] = "x"
      board.grid[y1][reply[3]] = "x"
      y1 = y1 +1
    end
    board.display_board(board)
  end

  #if value of first index is B, be prepared to fill in
  def fill_canvas?(reply)
    reply[0] == "B"
  end

  #determine in the starting point is in a box, if not, then fill up
  def fill_the_canvas(reply, board)
    reply = reply.map(&:to_i)
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
    board.display_board(board)
  end
end